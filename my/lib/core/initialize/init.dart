import 'package:flutter/foundation.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite_common/sqflite.dart' as common;

class DatabaseInitializer {
  static Future<void> initialize() async {
    if (kIsWeb) {
      // ✅ Web: IndexedDB
      common.databaseFactory = databaseFactoryFfiWeb;
    } else if (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      // ✅ Desktop: SQLite FFI
      sqfliteFfiInit();
      common.databaseFactory = databaseFactoryFfi;
    } else if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      // ✅ Mobile: Native SQLite
      // Do nothing — sqflite will be used automatically.
    } else {
      throw UnsupportedError('Unsupported platform: $defaultTargetPlatform');
    }

    // For debug purpose
    debugPrint('Database factory initialized: ${common.databaseFactory}');
  }
}
