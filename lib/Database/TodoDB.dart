import 'package:mi_agro_app/Database/database_service.dart';
import 'package:mi_agro_app/Models/Enum/DeleteDataBaseEnum.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../Models/Database/Todo.dart';

class TodoDB {
  final tableName = "todo";

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName(
      id TEXT PRIMARY KEY,
      title TEXT NOT NULL,
      body TEXT NOT NULL,
      date TEXT NOT NULL,
      farming_id TEXT NOT NULL,
      deleted INT
      );""");
  }

  Future<int> create({required String title, required String body, required String farming_id}) async {
    var uuid = Uuid();
    final database = await DatabaseService().database;
    return await database
        .rawInsert('''INSERT INTO $tableName (id, title, body, date, farming_id, deleted) VALUES (?, ?, ?, ?, ?, ?)''',
        [
          uuid.v6(),
          title,
          body,
          DateTime.now().toIso8601String(),
          farming_id,
          DeleteDataBaseEnum.enable.index
        ]
    );
  }

  Future<int> createRow(
      {
        required String id,
        required String title,
        required String body,
        required String createdDate,
        required String farming_id
      }) async {
    var uuid = Uuid();
    final database = await DatabaseService().database;
    return await database
        .rawInsert('''INSERT INTO $tableName (id, title, body, date, farming_id, deleted) VALUES (?, ?, ?, ?, ?, ?)''',
        [
          id,
          title,
          body,
          createdDate,
          farming_id,
          DeleteDataBaseEnum.enable.index
        ]
    );
  }

  Future<List<Todo>> fetchAll() async {
    final database = await DatabaseService().database;
    final todos = await database.rawQuery('''SELECT * FROM $tableName;''');
    return todos.map((e) => Todo.fromSQLDatabase(e)).toList();
  }

  Future<List<Todo>> getByFarmingId({required String farmingId}) async {
    print("Id del cultivo $farmingId");
    final database = await DatabaseService().database;
    final todos = await database.rawQuery('''SELECT * FROM $tableName WHERE farming_id = ? AND deleted = ?''', [farmingId, DeleteDataBaseEnum.enable.index] );
    return todos.map((e) => Todo.fromSQLDatabase(e)).toList();
  }

  Future<Todo> fechById({required String id}) async {
    final database = await DatabaseService().database;
    final todos = await database.rawQuery('''SELECT * FROM $tableName WHERE id = ?''', [id]);
    return Todo.fromSQLDatabase(todos.first);
  }

  Future<int> disable({required String id}) async{
    final database = await DatabaseService().database;
    return await database.update(
        tableName,
        {
          'deleted': DeleteDataBaseEnum.disable.index
        },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id]
    );
  }

  Future<void> delete() async {
    final database = await DatabaseService().database;
    await database.delete(tableName);
  }
}
