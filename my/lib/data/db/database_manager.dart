// import 'package:flutter/foundation.dart';
// import 'package:sqflite_common/sqlite_api.dart';
// import 'package:sqflite_common/sqflite.dart';
// import 'package:path/path.dart';
//
// import 'db_helper.dart';
// import 'features/projects/user_management/hooks_riverpod/auth/group_dao.dart';
//
// class DatabaseManager {
//   static Database? _db;
//
//   static Future<Database> get database async {
//     if (_db != null) return _db!;
//     return await _initDB();
//   }
//
//   static Future<Database> _initDB() async {
//     await DBHelper.initPlatformDatabase(); // 平台适配初始化
//
//     final String path;
//     if (kIsWeb) {
//       path = 'user_web.db';
//     } else {
//       path = join(await getDatabasesPath(), 'user.db');
//     }
//
//     _db = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await AuthTable.createTable(db);
//         // 👉 你可以在这里继续添加其他业务模块的表
//       },
//     );
//
//     return _db!;
//   }
//
//   static Future<void> close() async {
//     if (_db != null) {
//       await _db!.close();
//       _db = null;
//     }
//   }
// }
