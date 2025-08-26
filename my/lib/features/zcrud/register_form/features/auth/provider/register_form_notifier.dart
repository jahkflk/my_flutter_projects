import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my/core/validators/input_validators.dart';

import '../model/register_form_state.dart';

class RegisterFormNotifier extends AsyncNotifier<RegisterFormState> {
  @override
  RegisterFormState build() => const RegisterFormState();

  void updateEmail(String value) {
    state = AsyncData(state.value!.copyWith(email: value));
  }

  void updateConfirmEmail(String value) {
    state = AsyncData(state.value!.copyWith(confirmEmail: value));
  }

  void updateMac(String value) {
    state = AsyncData(state.value!.copyWith(mac: value));
  }

  void updatePassword(String value) {
    state = AsyncData(state.value!.copyWith(password: value));
  }

  Future<void> submit(BuildContext context) async {
    final s = state.value!;
    final emailValid = isValidEmail(s.email);
    final emailMatch = s.email == s.confirmEmail;
    final macValid = isValidMac(s.mac);
    final passwordValid = isValidPassword(s.password);

    if (!emailValid || !emailMatch || !macValid || !passwordValid) return;

    state = AsyncData(s.copyWith(isSubmitting: true));
    await Future.delayed(const Duration(seconds: 2)); // Simulate API

    state = AsyncData(s.copyWith(isSubmitting: false));

    // 🟢 Navigate to Home
    if (context.mounted) {
      context.pushNamed('/z_home');
    }
  }
}

final registerFormProvider =
    AsyncNotifierProvider<RegisterFormNotifier, RegisterFormState>(
        () => RegisterFormNotifier());
