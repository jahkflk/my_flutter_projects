import 'package:my/data/db/db_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/db/stream_auth_table.dart';
import '../../data/models/stream_user_model.dart';

class UserDaoStream {
  final String table = AuthTableStream.tableName;
  // 工厂方式获取 db 实例
  Future<Database> get _db async => await DbHelper.instance.database;

  // UserDaoStream（使用构造函数依赖注入）
  // final Future<Database> _db;
  // UserDaoStream({Future<Database>? db}) : _db = db ?? DbHelper.database;

  Future<void> insertUser(UserModelStream user) async {
    final db = await _db;
    try {
      await db.insert(table, user.toMap());
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw Exception('Email already exists');
      } else {
        rethrow;
      }
    }
  }

  Future<UserModelStream?> getUserByEmail(String email) async {
    final db = await _db;
    final result = await db.query(
      table,
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty ? UserModelStream.fromMap(result.first) : null;
  }

  Future<bool> login(String email, String password) async {
    final db = await _db;
    final result = await db.query(
      table,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  Future<List<UserModelStream>> getAllUsers() async {
    final db = await _db;
    final result = await db.query(table);
    return result.map((e) => UserModelStream.fromMap(e)).toList();
  }

  Future<int> updateUser(UserModelStream user) async {
    if (user.id == null) throw Exception("ID is required to update user.");
    final db = await _db;
    return await db.update(
      table,
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await _db;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllUsers() async {
    final db = await _db;
    await db.delete(table);
  }

  Future<UserModelStream?> getUserById(int id) async {
    final db = await _db;
    final result = await db.query(table, where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? UserModelStream.fromMap(result.first) : null;
  }
}
