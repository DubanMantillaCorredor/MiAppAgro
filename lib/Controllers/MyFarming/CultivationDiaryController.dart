import 'package:mi_agro_app/Database/TodoDB.dart';
import 'package:mi_agro_app/Models/Database/Todo.dart';

class CultivationDiaryController{
  List<Todo> listOfNotes = [];
  late String farmingId = "";
  bool isLoading = true;
  final _todoDB = TodoDB();


  Future GetList(String farmingId) async{
    listOfNotes = await _todoDB.getByFarmingId(farmingId: farmingId);
  }
}