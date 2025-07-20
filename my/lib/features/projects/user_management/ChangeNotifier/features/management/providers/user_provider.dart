import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/user_model.dart';
import '../state/user_notifier.dart';

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, List<UserModel>>(
  (ref) => UserNotifier(),
);
