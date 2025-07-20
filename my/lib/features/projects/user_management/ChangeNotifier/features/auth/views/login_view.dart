// login_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:my/core/widgets/selectable_outlined_button_with_pressed.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../widgets/dialog_widget.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCtrl = useTextEditingController();
    final passCtrl = useTextEditingController();
    final viewModel = ref.read(authViewModelProvider.notifier);

    // 用 hook 管理按钮“按下”状态
    final isPressed = useState(false);

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

            // ✅ Login 按钮
            SelectableOutlinedButtonWithPressed(
              isSelected: false,
              isPressedOverride: isPressed.value, // 👈 按下时变色
              icon: Icons.login,
              label: 'Login',
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => DialogWidget(
                    onConfirm: () => viewModel.login(
                      emailCtrl.text.trim(),
                      passCtrl.text.trim(),
                    ),
                  ),
                ).then((success) {
                  if (success == true && context.mounted) {
                    context.go('/home');
                  } else if (success == false && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login failed')),
                    );
                  }
                });
              },
              selectedBackgroundColor: Colors.black,
              unselectedBackgroundColor: Colors.grey.shade100,
              pressedBackgroundColor: Colors.grey.shade300,
              selectedTextColor: Colors.white,
              unselectedTextColor: Colors.black87,
              pressedTextColor: Colors.black,
              selectedIconColor: Colors.white,
              unselectedIconColor: Colors.black54,
              pressedIconColor: Colors.black87,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              borderSide: const BorderSide(color: Colors.black),
            ),

            const SizedBox(height: 16),

            SelectableOutlinedButtonWithPressed(
              isSelected: false,
              isPressedOverride: false,
              icon: Icons.login,
              label: 'Login',
              // 在LoginPage中调用DialogWidget
              onPressed: () async {
                final success = await showDialog<bool>(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => DialogWidget(
                    onConfirm: () => viewModel.login(
                      emailCtrl.text.trim(),
                      passCtrl.text.trim(),
                    ),
                  ),
                );

                if (success == true && context.mounted) {
                  context.go('/home');
                } else if (success == false && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login failed')),
                  );
                }
              },

              selectedBackgroundColor: Colors.black,
              unselectedBackgroundColor: Colors.grey.shade100,
              pressedBackgroundColor: Colors.grey.shade300,
              selectedTextColor: Colors.yellow,
              unselectedTextColor: Colors.black87,
              pressedTextColor: Colors.black,
              selectedIconColor: Colors.yellow,
              unselectedIconColor: Colors.black45,
              pressedIconColor: Colors.black87,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              borderSide: const BorderSide(color: Colors.black),
            ),

            const SizedBox(height: 16),

            // Your other buttons unchanged...
          ],
        ),
      ),
    );
  }
}
