// import 'package:sqflite/sqflite.dart';
//
// class AuthDao {
//   // 今は UserDao と同じ users テーブルを使うためテーブル作成は空でもOKにできます
//   Future<void> createTable(Database db) async {
//     // ここは空か、将来ログイン履歴など別テーブル作る場合に実装
//   }
//
//   Future<Map<String, dynamic>?> getUserByEmail(String email) async {
//     final db = await DatabaseManager.database;
//     final result =
//         await db.query('users', where: 'email = ?', whereArgs: [email]);
//     return result.isNotEmpty ? result.first : null;
//   }
//
//   Future<void> insertUser(Map<String, dynamic> data) async {
//     final db = await DatabaseManager.database;
//     await db.insert('users', data);
//   }
// }
