import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path =
        kIsWeb ? 'user_web.db' : join(await getDatabasesPath(), 'user.db');
    return await openDatabase(path, version: 1, onCreate: _createTables);
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');
  }

  Future<void> insertUser(Map<String, dynamic> data) async {
    final database = await db;
    try {
      await database.insert('users', data);
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw Exception('Email already exists');
      } else {
        rethrow;
      }
    }
  }

  Future<int> updateUser(Map<String, dynamic> data) async {
    final database = await db;
    return await database
        .update('users', data, where: 'id = ?', whereArgs: [data['id']]);
  }

  Future<int> deleteUser(int id) async {
    final database = await db;
    return await database.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllUsers() async {
    final database = await db;
    await database.delete('users');
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final database = await db;
    return await database.query('users');
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final database = await db;
    final result =
        await database.query('users', where: 'email = ?', whereArgs: [email]);
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String, dynamic>?> getUserById(int id) async {
    final database = await db;
    final result =
        await database.query('users', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : null;
  }
}
