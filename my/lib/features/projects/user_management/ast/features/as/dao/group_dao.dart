import 'package:flutter/foundation.dart';
import 'package:my/data/db/db_helper.dart';
import '../../data/db/as_table.dart';
import '../../data/models/user_model.dart';
import '../dto/group_register_form_dto.dart';
import '../models/group_model.dart';

class GroupDao {
  const GroupDao(); // ✅ 添加 const 构造函数，方便 Provider 实例化

  static Future<bool> register(GroupRegisterFormDto dto) async {
    final db = await DbHelper.instance.database;
    try {
      await db.insert("groups", dto.toMap());
      return true;
    } catch (e, stacktrace) {
      debugPrint('DB insert error: $e');
      debugPrint('Stack trace: $stacktrace');
      return false;
    }
  }

  Future<List<GroupModel>> getAllGroups() async {
    try {
      final db = await DbHelper.instance.database;
      final result = await db.query("groups", orderBy: "display_order ASC");
      return result.map((e) => GroupModel.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

// Future<int> insertGroup(GroupModel group) async {
//   try {
//     return await _dbHelper.insertGroup(group);
//   } catch (e) {
//     rethrow;
//   }
// }
//
// Future<void> deleteGroup(int id) async {
//   try {
//     await _dbHelper.deleteGroup(id);
//   } catch (e) {
//     rethrow;
//   }
// }
//
// Future<void> updateGroup(GroupModel group) async {
//   try {
//     await _dbHelper.updateGroup(group);
//   } catch (e) {
//     rethrow;
//   }
// }
//
// Future<GroupModel?> getGroupById(int id) async {
//   try {
//     return await _dbHelper.getGroupById(id);
//   } catch (e) {
//     rethrow;
//   }
// }
// }
