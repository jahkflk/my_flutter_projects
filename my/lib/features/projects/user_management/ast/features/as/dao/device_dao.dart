import 'package:flutter/foundation.dart';
import 'package:my/data/db/db_helper.dart';

import '../dto/device_register_form_dto.dart';

class DeviceDao {
  static Future<bool> register(DeviceRegisterFormDto dto) async {
    final db = await DbHelper.instance.database;
    try {
      await db.insert("devices", dto.toMap());
      return true;
    } catch (e, stack) {
      debugPrint('❌ DeviceDao.insert error: $e\n$stack');
      return false;
    }
  }
}
