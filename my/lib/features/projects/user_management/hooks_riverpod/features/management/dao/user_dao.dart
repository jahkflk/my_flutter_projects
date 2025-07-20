import 'package:my/data/db/db_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/db/auth_table.dart';
import '../../data/models/user_model.dart';

class UserDao {
  final String table = AuthTable.tableName;
  // 工厂方式获取 db 实例
  Future<Database> get _db async => await DbHelper.database;

  // UserDao（使用构造函数依赖注入）
  // final Future<Database> _db;
  // UserDao({Future<Database>? db}) : _db = db ?? DbHelper.database;

  Future<void> insertUser(UserModel user) async {
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

  Future<UserModel?> getUserByEmail(String email) async {
    final db = await _db;
    final result = await db.query(
      table,
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty ? UserModel.fromMap(result.first) : null;
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

  Future<List<UserModel>> getAllUsers() async {
    final db = await _db;
    final result = await db.query(table);
    return result.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<int> updateUser(UserModel user) async {
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

  Future<UserModel?> getUserById(int id) async {
    final db = await _db;
    final result = await db.query(table, where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? UserModel.fromMap(result.first) : null;
  }
}
