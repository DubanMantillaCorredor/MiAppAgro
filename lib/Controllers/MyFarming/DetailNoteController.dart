import 'package:mi_agro_app/Database/TodoDB.dart';
import 'package:mi_agro_app/Models/Database/Todo.dart';

class DetailNoteController{
  final _todoDB = TodoDB();
  Todo? todo;
  bool isLoading = true;

  Future fechById(String id) async{
    todo = await _todoDB.fechById(id: id);
    print(todo?.title);
  }

  Future<int> deleteRow({required String id}){
    return _todoDB.disable(id: id);
  }
}