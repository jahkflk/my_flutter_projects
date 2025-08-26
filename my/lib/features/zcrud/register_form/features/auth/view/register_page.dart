import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my/core/validators/input_validators.dart';
import '../provider/register_form_notifier.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('RegisterPage build');
    final form = ref.watch(registerFormProvider);
    final notifier = ref.read(registerFormProvider.notifier);

    final emailController = useTextEditingController();
    final confirmEmailController = useTextEditingController();
    final macController = useTextEditingController();
    final passwordController = useTextEditingController();

    final submitClicked = useState(false);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: form.when(
          data: (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email (Login ID)',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'example@example.com',
                  errorText: submitClicked.value && !isValidEmail(state.email)
                      ? 'Invalid email format'
                      : null,
                ),
                onChanged: notifier.updateEmail,
              ),
              const SizedBox(height: 10),
              const Text('Confirm Email'),
              TextField(
                controller: confirmEmailController,
                decoration: InputDecoration(
                  errorText:
                      submitClicked.value && state.email != state.confirmEmail
                          ? 'Emails do not match'
                          : null,
                ),
                onChanged: notifier.updateConfirmEmail,
              ),
              const SizedBox(height: 10),
              const Text('MAC Address'),
              TextField(
                controller: macController,
                decoration: InputDecoration(
                  hintText: '00:1A:2B:3C:4D:5E',
                  errorText: submitClicked.value && !isValidMac(state.mac)
                      ? 'Invalid MAC address'
                      : null,
                ),
                onChanged: notifier.updateMac,
              ),
              const SizedBox(height: 10),
              const Text('Password'),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  errorText:
                      submitClicked.value && !isValidPassword(state.password)
                          ? '8–64 chars, mix of letters, numbers, symbols'
                          : null,
                ),
                onChanged: notifier.updatePassword,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  submitClicked.value = true;
                  await notifier.submit(context); // 👈 添加 context 参数
                },
                child: state.isSubmitting
                    ? const CircularProgressIndicator()
                    : const Text('Submit'),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Error: $e'),
        ),
      ),
    );
  }
}
