import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/stream_user_model.dart';
import '../state/stream_user_notifier.dart';

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, List<UserModelStream>>(
  (ref) => UserNotifier(),
);
