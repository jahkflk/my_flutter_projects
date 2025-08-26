import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my/core/validators/input_validators.dart';

import '../provider/auth_notifier.dart';

enum AuthMode { login, add, edit }

class AuthAndEditPage extends HookConsumerWidget {
  final AuthMode mode;
  final String? userId;

  const AuthAndEditPage({super.key, required this.mode, this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authProvider.notifier);
    final stateAsync = ref.watch(authProvider);

    final user = (mode == AuthMode.edit && userId != null)
        ? notifier.getUserById(userId!)
        : null;

    final emailCtrl = useTextEditingController(text: user?.email ?? '');
    final macCtrl = useTextEditingController(text: user?.mac ?? '');
    final passwordCtrl = useTextEditingController(text: user?.password ?? '');

    final submitClicked = useState(false);

    final showMacField = mode != AuthMode.login;

    final title = switch (mode) {
      AuthMode.login => 'Login',
      AuthMode.add => 'Add User',
      AuthMode.edit => 'Edit User',
    };

    final buttonText = switch (mode) {
      AuthMode.login => 'Login',
      AuthMode.add => 'Add',
      AuthMode.edit => 'Save',
    };

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: stateAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (_) => SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'email@example.com',
                      errorText:
                          submitClicked.value && !isValidEmail(emailCtrl.text)
                              ? 'Invalid email address'
                              : null,
                    ),
                    onChanged: (_) => submitClicked.value = false,
                  ),
                  const SizedBox(height: 12),
                  if (showMacField)
                    TextField(
                      controller: macCtrl,
                      decoration: InputDecoration(
                        labelText: 'MAC Address',
                        hintText: '00:1A:2B:3C:4D:5E',
                        errorText:
                            submitClicked.value && !isValidMac(macCtrl.text)
                                ? 'Invalid MAC address'
                                : null,
                      ),
                      onChanged: (_) => submitClicked.value = false,
                    ),
                  if (showMacField) const SizedBox(height: 12),
                  TextField(
                    controller: passwordCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText:
                          '8–64 chars, include letters, numbers & symbols',
                      errorText: submitClicked.value &&
                              !isValidPassword(passwordCtrl.text)
                          ? 'Password must be 8–64 chars with letters, numbers & symbols'
                          : null,
                    ),
                    onChanged: (_) => submitClicked.value = false,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: FilledButton(
                      onPressed: () async {
                        submitClicked.value = true;

                        if (mode == AuthMode.login) {
                          if (!isValidEmail(emailCtrl.text) ||
                              !isValidPassword(passwordCtrl.text)) return;
                          await notifier.login(
                              emailCtrl.text, passwordCtrl.text);
                          if (context.mounted) context.go('/z_home');
                          return;
                        }

                        // add / edit
                        if (!isValidEmail(emailCtrl.text) ||
                            !isValidMac(macCtrl.text) ||
                            !isValidPassword(passwordCtrl.text)) return;

                        if (mode == AuthMode.add) {
                          await notifier.addUser(
                              emailCtrl.text, macCtrl.text, passwordCtrl.text);
                        } else if (mode == AuthMode.edit && userId != null) {
                          await notifier.updateUser(userId!, emailCtrl.text,
                              macCtrl.text, passwordCtrl.text);
                        }
                        if (context.mounted) context.go('/z_home');
                      },
                      child: Text(buttonText),
                    ),
                  ),
                  if (mode == AuthMode.login) ...[
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => context.go('/z_home'),
                      child: const Text('Skip to Home (demo)'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
