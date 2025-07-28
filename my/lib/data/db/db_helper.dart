import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:my/features/projects/user_management/hooks_riverpod/features/data/db/auth_table.dart';
import 'package:path/path.dart';
import 'package:sqflite_common/sqflite.dart';

class DbHelper {
  static const _dbWebName = 'web_database.db';
  static const _dbAppName = 'app_database.db';
  static const _dbVersion = 1;
  static Database? _db;

  static final DbHelper instance = DbHelper._internal();
  factory DbHelper() => instance;
  DbHelper._internal();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final factory = databaseFactory;
    final path =
        kIsWeb ? _dbWebName : join(await getDatabasesPath(), _dbAppName);

    return await factory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: _dbVersion,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      ),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // auth table
    await AuthTable.createTable(db);
  }

  static Future<void> _onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    // TODO: Add upgrade logic
  }
}
