import 'package:my/data/db/db_helper.dart';

import '../../data/db/stream_auth_table.dart';
import '../../data/models/stream_user_model.dart';

class AuthDaoStream {
  static Future<bool> register(UserModelStream userModel) async {
    final db = await DbHelper.instance.database;

    try {
      await db.insert(AuthTableStream.tableName, userModel.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    final db = await DbHelper.instance.database;

    final res = await db.query(AuthTableStream.tableName,
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    return res.isNotEmpty;
  }
}
