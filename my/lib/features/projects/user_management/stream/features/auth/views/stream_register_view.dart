import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../viewmodels/stream_auth_viewmodel.dart';

/// Registration Page
class RegisterStream extends HookConsumerWidget {
  const RegisterStream({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameCtrl = useTextEditingController();
    final emailCtrl = useTextEditingController();
    final passCtrl = useTextEditingController();
    final viewModel = ref.watch(authViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'name')),
            TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                controller: passCtrl,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final success = await viewModel.register(nameCtrl.text.trim(),
                    emailCtrl.text.trim(), passCtrl.text.trim());
                if (success && context.mounted) {
                  context.go('/register_success');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Register failed')));
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
