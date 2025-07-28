// 🚧 WIP - Refactoring to flutter_hooks + stream
// You have a complete working user management system using Riverpod + Future-based logic.
// Let's start converting the user management (Home, Add/Edit, Detail) to `flutter_hooks + Stream` architecture.

// Step 1: Replace UserNotifier with Stream-based Provider

// lib/features/.../management/providers/user_stream_provider.dart
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/stream_user_model.dart';
import '../dao/stream_user_dao.dart';
import '../state/stream_user_notifier.dart';

final userStreamProvider = StreamProvider<List<UserModelStream>>((ref) async* {
  final dao = UserDaoStream();
  while (true) {
    final users = await dao.getAllUsers();
    yield users;
    await Future.delayed(const Duration(seconds: 2));
  }
});

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, List<UserModelStream>>(
  (ref) => UserNotifier(),
);
