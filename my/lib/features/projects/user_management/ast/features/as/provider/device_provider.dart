import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../dao/group_dao.dart';
import '../dao/group_dao_provider.dart';
import '../models/group_model.dart';

final groupListProvider =
    FutureProvider.autoDispose<List<GroupModel>>((ref) async {
  final dao = ref.watch(groupDaoProvider);
  return dao.getAllGroups();
});
