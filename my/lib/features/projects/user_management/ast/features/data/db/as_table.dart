import 'package:sqflite/sqlite_api.dart';

class AsTable {
  static const String tableName = 'as_table';

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        group_id INTEGER,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');
    await db.execute('''
        CREATE TABLE groups(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          group_name TEXT NOT NULL,
          display_order INTEGER DEFAULT 0
       );
       ''');
    await db.execute('''
          CREATE TABLE devices(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            mac TEXT NOT NULL,
            group_id INTEGER,
            created_at TEXT,
            last_connected_at TEXT,
            FOREIGN KEY (group_id) REFERENCES groups(id)
          );
        ''');
  }
}
