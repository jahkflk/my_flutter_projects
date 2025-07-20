// import 'package:flutter/foundation.dart';
// import 'package:my/features/projects/user_management/hooks_riverpod/features/auth/models/user_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// import 'database_manager.dart';
//
// class DBHelper {
//   static Database? _db;
//
//   Future<Database> get db async {
//     if (_db != null) return _db!;
//     _db = await _initDB();
//     return _db!;
//   }
//
//   Future<Database> _initDB() async {
//     final String path;
//     if (kIsWeb) {
//       path = 'user_web.db';
//     } else {
//       path = join(await getDatabasesPath(), 'user.db');
//     }
//
//     return await openDatabase(path, version: 1, onCreate: _createTables);
//   }
//
//   Future<void> _createTables(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE IF NOT EXISTS users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT,
//         email TEXT UNIQUE,
//         password TEXT
//       )
//     ''');
//   }
//
//   // 新規ユーザー登録
//   Future<void> insertUser(Map<String, dynamic> data) async {
//     final database = await db;
//     try {
//       await database.insert('users', data);
//     } on DatabaseException catch (e) {
//       if (e.isUniqueConstraintError()) {
//         throw Exception('Email already exists');
//       } else {
//         rethrow;
//       }
//     }
//   }
//
//   // 全ユーザー取得
//   Future<List<Map<String, dynamic>>> getAllUsers() async {
//     final database = await db;
//     return await database.query('users');
//   }
//
//   // IDでユーザー取得
//   Future<Map<String, dynamic>?> getUserById(int id) async {
//     final database = await db;
//     final result =
//         await database.query('users', where: 'id = ?', whereArgs: [id]);
//     return result.isNotEmpty ? result.first : null;
//   }
//
//   // Emailでユーザー取得
//   Future<Map<String, dynamic>?> getUserByEmail(String email) async {
//     final database = await db;
//     final result =
//         await database.query('users', where: 'email = ?', whereArgs: [email]);
//     return result.isNotEmpty ? result.first : null;
//   }
//
//   // ユーザー情報更新
//   Future<int> updateUser(Map<String, dynamic> data) async {
//     final database = await db;
//     if (!data.containsKey('id')) {
//       throw Exception('ID is required for update');
//     }
//     return await database
//         .update('users', data, where: 'id = ?', whereArgs: [data['id']]);
//   }
//
//   // IDでユーザー削除
//   Future<int> deleteUser(int id) async {
//     final database = await db;
//     return await database.delete('users', where: 'id = ?', whereArgs: [id]);
//   }
//
//   // 全ユーザー削除
//   Future<void> deleteAllUsers() async {
//     final database = await db;
//     await database.delete('users');
//   }
//
//   static Future<bool> register(User user) async {
//     final db = await DatabaseManager.database;
//     try {
//       await db.insert('users', user.toMap());
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }
//
//   static Future<bool> login(String email, String password) async {
//     final db = await DatabaseManager.database;
//     final result = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );
//     return result.isNotEmpty;
//   }
// }
