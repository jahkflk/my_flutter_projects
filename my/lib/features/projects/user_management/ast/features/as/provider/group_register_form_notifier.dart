import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my/core/validators/input_validators.dart';

import '../dto/group_register_form_dto.dart';
import '../models/group_form_state.dart';
import '../dao/group_dao.dart';
import '../dao/group_dao_provider.dart'; // 引入 provider

class GroupRegisterFormNotifier extends AsyncNotifier<GroupFormState> {
  late final GroupDao _groupDao;

  @override
  GroupFormState build() {
    // 通过 provider 获取 GroupDao 实例
    _groupDao = ref.read(groupDaoProvider);
    return const GroupFormState();
  }

  void updateGroupName(String value) {
    state = AsyncData(state.value!.copyWith(groupName: value));
  }

  Future<void> submit(BuildContext context) async {
    final s = state.value!;
    final isValidGroupName = isValidEmail(s.groupName);

    if (!isValidGroupName) return;

    state = AsyncData(s.copyWith(isSubmitting: true));

    final dto = GroupRegisterFormDto(groupName: s.groupName);

    // 使用实例方法调用
    final success = await _groupDao.register(dto);

    state = AsyncData(s.copyWith(isSubmitting: false));

    if (context.mounted && success) {
      debugPrint('Navigating to /as');
      context.go('/as');
    } else {
      debugPrint(
          'Not navigating: mounted=${context.mounted}, success=$success');
    }
  }
}

final groupRegisterFormProvider =
    AsyncNotifierProvider<GroupRegisterFormNotifier, GroupFormState>(
        () => GroupRegisterFormNotifier());
