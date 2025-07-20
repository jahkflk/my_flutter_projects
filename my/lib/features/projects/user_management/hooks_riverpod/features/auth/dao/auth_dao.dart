import 'package:my/data/db/db_helper.dart';
import '../../data/db/auth_table.dart';
import '../../data/models/user_model.dart';

class AuthDao {
  static Future<bool> register(UserModel userModel) async {
    final db = await DbHelper.database;
    try {
      await db.insert(AuthTable.tableName, userModel.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    final db = await DbHelper.database;
    final res = await db.query(AuthTable.tableName,
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    return res.isNotEmpty;
  }
}
