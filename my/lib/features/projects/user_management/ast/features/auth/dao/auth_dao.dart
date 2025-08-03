import 'package:my/data/db/db_helper.dart';
import '../../data/db/as_table.dart';
import '../../data/models/user_model.dart';

class AuthDao {
  static Future<bool> register(UserModel userModel) async {
    final db = await DbHelper.instance.database;

    try {
      await db.insert(AsTable.tableName, userModel.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    final db = await DbHelper.instance.database;

    final res = await db.query(AsTable.tableName,
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    return res.isNotEmpty;
  }
}
