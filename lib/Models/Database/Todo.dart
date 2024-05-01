import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Todo {
  String id;
  String title;
  String body;
  String date;
  String farming_id;
  int deleted;

  String get getDatetime {
    initializeDateFormatting();
    try{
      var dateformat = DateFormat('yyyy-MM-dd').parse(this.date);
      return DateFormat.yMMMMd('es').format(dateformat);
    }catch(ex){
      print(ex);
      return "Error en la fecha";
    }

  }

  Todo(
      {required this.id,
      required this.title,
      required this.body,
      required this.date,
      required this.farming_id,
      required this.deleted});

  factory Todo.fromSQLDatabase(Map<String, dynamic> map) => Todo(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      body: map['body'] as String? ?? '',
      date: map['date'] as String? ?? '',
      farming_id: map['farming_id'] as String? ?? '',
      deleted: map['deleted'] as int? ?? 0);

}
