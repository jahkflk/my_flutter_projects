// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:my/core/validators/input_validators.dart';
// import '../dto/group_register_form_dto.dart';
// import '../models/group_form_state.dart';
// import '../dao/group_dao.dart';
//
// class GroupRegisterFormNotifier extends AsyncNotifier<GroupFormState> {
//   @override
//   GroupFormState build() => const GroupFormState();
//
//   void updateGroupName(String value) {
//     state = AsyncData(state.value!.copyWith(groupName: value));
//   }
//
//   Future<void> submit(BuildContext context) async {
//     final s = state.value!;
//     final isValidGroupName = isValidEmail(s.groupName);
//
//     if (!isValidGroupName) return;
//
//     state = AsyncData(s.copyWith(isSubmitting: true));
//
//     final dto = GroupRegisterFormDto(groupName: s.groupName);
//     final success = await GroupDao.register(dto);
//
//     state = AsyncData(s.copyWith(isSubmitting: false));
//
//     if (context.mounted && success) {
//       debugPrint('Navigating to /as');
//       context.go('/as'); // 👈 回到 AsView
//     } else {
//       debugPrint(
//           'Not navigating: mounted=${context.mounted}, success=$success');
//     }
//   }
// }
//
// final groupRegisterFormProvider =
//     AsyncNotifierProvider<GroupRegisterFormNotifier, GroupFormState>(
//         () => GroupRegisterFormNotifier());
