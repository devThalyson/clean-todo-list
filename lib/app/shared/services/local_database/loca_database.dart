import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static Future<Database> getDatabase() async {
    final databasePath = await getDatabasesPath();
    final appDatabasePath = join(databasePath, 'clean_todo_app.db');

    var database = await openDatabase(
      appDatabasePath,
      version: 1,
      onCreate: (db, lastVersionDb) async {
        // Tabela Todo
        await db.execute(''' 
        CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title VARCHAR (255),
        description VARCHAR (255),
        finished INTEGER
        )
        ''');
      },
    );

    return database;
  }
}
