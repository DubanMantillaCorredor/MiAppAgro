import '../../Database/TodoDB.dart';

class FormNoteController {
  late String farming_id = "";
  final todoDB = TodoDB();



  Future<int> saveNote(String title, String body) async{
    int result = await todoDB.create(title: title, body: body, farming_id: farming_id);

    return result;
  }

}