import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:my/core/widgets/selectable_outlined_button_with_state.dart';

import '../viewmodels/stream_auth_button_notifier.dart';
import '../viewmodels/stream_auth_viewmodel.dart';
import '../widgets/stream_dialog_widget.dart';

class LoginViewStream extends HookConsumerWidget {
  const LoginViewStream({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCtrl = useTextEditingController();
    final passCtrl = useTextEditingController();

    final authViewModel = ref.read(authViewModelProvider.notifier);
    final authButtonState = ref.watch(authButtonProvideStream);
    final authButtonNotifier = ref.read(authButtonProvideStream.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 24),

            // ✅ Login Button
            SelectableOutlinedButtonWithState(
              isSelected: false,
              isPressed: authButtonState.isPressed(AuthButtonType.login),
              icon: Icons.login,
              label: 'Login',
              onPressed: () async {
                authButtonNotifier.setPressed(AuthButtonType.login);
                final confirmed = await showDialog<bool>(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => DialogWidgetStream(
                    title: 'Confirm Login', // ✅ 设置标题
                    onConfirm: () => authViewModel.login(
                      emailCtrl.text.trim(),
                      passCtrl.text.trim(),
                    ),
                  ),
                );
                authButtonNotifier.reset();
                if (confirmed == true && context.mounted) {
                  context.go('/home');
                } else if (confirmed == false && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login failed')),
                  );
                }
              },
              selectedBackgroundColor: Colors.grey.shade300,
              unselectedBackgroundColor: Colors.grey.shade100,
              pressedBackgroundColor: Colors.black,
              selectedTextColor: Colors.black,
              unselectedTextColor: Colors.black87,
              pressedTextColor: Colors.yellow,
              selectedIconColor: Colors.black,
              unselectedIconColor: Colors.black45,
              pressedIconColor: Colors.yellow,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              borderSide: const BorderSide(color: Colors.black),
            ),

            const SizedBox(height: 50),

            // ✅ Register Button
            SelectableOutlinedButtonWithState(
              isSelected: false,
              isPressed: authButtonState.isPressed(AuthButtonType.register),
              icon: Icons.app_registration,
              label: 'Register',
              onPressed: () async {
                authButtonNotifier.setPressed(AuthButtonType.register);
                final confirmed = await showDialog<bool>(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => DialogWidgetStream(
                    title: 'Confirm Register', // ✅ 设置标题
                    onConfirm: () => Future.value(true),
                  ),
                );
                authButtonNotifier.reset();
                if (confirmed == true && context.mounted) {
                  context.go('/register');
                } else if (confirmed == false && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Register failed')),
                  );
                }
              },
              selectedBackgroundColor: Colors.grey.shade300,
              unselectedBackgroundColor: Colors.grey.shade100,
              pressedBackgroundColor: Colors.black,
              selectedTextColor: Colors.black,
              unselectedTextColor: Colors.black87,
              pressedTextColor: Colors.yellow,
              selectedIconColor: Colors.black,
              unselectedIconColor: Colors.black45,
              pressedIconColor: Colors.yellow,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
