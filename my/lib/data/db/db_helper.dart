import 'package:flutter/foundation.dart';
import 'package:my/features/projects/user_management/hooks_riverpod/features/data/db/auth_table.dart';
import 'package:sqflite_common/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static const String _dbWebName = 'web_database.db';
  static const String _dbAppName = 'app_database.db';
  static const int _dbVersion = 1;
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  static Future<Database> _initDatabase() async {
    final factory = databaseFactory;
    final String path;
    if (kIsWeb) {
      path = _dbWebName;
    } else {
      path = join(await getDatabasesPath(), _dbAppName);
    }
    return await factory.openDatabase(path,
        options: OpenDatabaseOptions(
          version: _dbVersion,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
        ));
  }

  static Future<void> _onCreate(Database db, int version) async {
    await AuthTable.createTable(db); // ✅ 修复点
  }

  static Future<void> _onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    // TODO: 添加升级逻辑
  }
}
