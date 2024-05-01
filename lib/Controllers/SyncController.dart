import 'dart:convert';

import 'package:mi_agro_app/Database/TodoDB.dart';
import 'package:mi_agro_app/Models/Database/Todo.dart';
import 'package:mi_agro_app/Models/ResponseHttpDto.dart';
import 'package:mi_agro_app/Models/SyncRequestDto.dart';
import 'package:mi_agro_app/Services/FieldDiaryService.dart';
import 'package:mi_agro_app/Services/IFieldDiaryService.dart';

class SyncController {
  final todoDB = TodoDB();
  late IFieldDiaryService _fieldDiaryService;

  SyncController(){
    _fieldDiaryService = FieldDiaryService();
  }

  Future<bool> syncData() async {
    List<Todo> valuesFromDB = await todoDB.fetchAll();
    List<SyncRequestDto> valuesList = [];
    print("Imprime");
    valuesFromDB.forEach((element) {
      SyncRequestDto body;
      var index = valuesList.indexWhere((x) => x.id == element.farming_id);
      if(index == -1){
        SyncRequestDto syncRequestDto = SyncRequestDto(element.farming_id);
        syncRequestDto.setBody(element);
        valuesList.add(syncRequestDto);
      }else{
        valuesList[index].setBody(element);
      }
    });

    var json = jsonEncode(valuesList);

    bool success = false;
    await _fieldDiaryService.syncData(json).then((index) async{
      Iterable lista = jsonDecode(index.data);
      await todoDB.delete();
      for(var row in lista) {
        int result = await todoDB.createRow(
            id: row['id'].toString(),
            title: row['title'].toString(),
            body: row['body'].toString(),
            createdDate: row['createdDate'].toString(),
            farming_id: row['farming_id'].toString()
        );
        if(result != 0) {
          success = true;
        } else {
          success = false;
          break;
        }
      }
    });

    return success;
  }

}