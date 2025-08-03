import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my/core/validators/input_validators.dart';

import '../dao/device_dao.dart';
import '../dto/device_register_form_dto.dart';
import '../models/device_form_state.dart';

class DeviceRegisterFormNotifier extends AsyncNotifier<DeviceFormState> {
  @override
  DeviceFormState build() => const DeviceFormState();

  void updateName(String value) {
    state = AsyncData(state.value!.copyWith(name: value));
  }

  void updateMac(String value) {
    state = AsyncData(state.value!.copyWith(mac: value));
  }

  void updateGroupId(int? value) {
    state = AsyncData(state.value!.copyWith(groupId: value));
  }

  Future<void> submit(BuildContext context) async {
    final s = state.value!;

    final valid = isValidMac(s.mac) && s.groupId != null;
    if (!valid) return;

    state = AsyncData(s.copyWith(isSubmitting: true));

    final dto = DeviceRegisterFormDto(
      name: s.name,
      mac: s.mac,
      groupId: s.groupId!,
    );

    final success = await DeviceDao.register(dto);

    state = AsyncData(s.copyWith(isSubmitting: false));

    if (context.mounted && success) {
      debugPrint('Navigating to /as');
      context.go('/as'); // 👈 回到 AsView
    } else {
      debugPrint(
          'Not navigating: mounted=${context.mounted}, success=$success');
    }
  }
}

final deviceRegisterFormProvider =
    AsyncNotifierProvider<DeviceRegisterFormNotifier, DeviceFormState>(
        () => DeviceRegisterFormNotifier());
