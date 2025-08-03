import 'package:sqflite/sqlite_api.dart';

class AuthTable {
  static const String tableName = 'users';

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');
  }
}
