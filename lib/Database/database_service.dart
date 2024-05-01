import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'TodoDB.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initialize();
      return _database!;
    }
  }

  Future<String> get fullpath async {
    const name = "todo.db";
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullpath;
    print("Ruta: $path");
    var database = await openDatabase(
        path,
        version: 1,
        onCreate: create,
        singleInstance: true
    );
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await TodoDB().createTable(database);
}
