import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my/features/projects/intl_demo/generated/l10n.dart';
import 'package:my/features/projects/intl_demo/widgets/language_selector.dart';

class IntlLoginView extends ConsumerWidget {
  const IntlLoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = AppLocalizations.of(context)!;
    final usernameCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    debugPrint('IntlDemo IntlLoginView build called');

    return Scaffold(
      appBar: AppBar(
        title: Text('denglu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: 'Change Language',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const LanguageSelector(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameCtrl,
              decoration: InputDecoration(labelText: s.username),
            ),
            TextField(
              controller: passCtrl,
              decoration: InputDecoration(labelText: s.password),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // 你可以根据业务把登录按钮打开并国际化：
            // ElevatedButton(
            //   onPressed: () async {
            //     final success = await viewModel.login(
            //       usernameCtrl.text,
            //       passCtrl.text,
            //     );
            //
            //     if (!context.mounted) return;
            //
            //     if (success) {
            //       context.go('/home');
            //     } else {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text(s.loginFailed)),
            //       );
            //     }
            //   },
            //   child: Text(s.login),
            // ),
            const SizedBox(height: 10),
            // TextButton(
            //   onPressed: () => context.push('/register'),
            //   child: Text(s.createAccount),
            // ),
            // const SizedBox(height: 50),
            // TextButton(
            //   onPressed: () => context.push('/flutter-learning'),
            //   child: Text(s.goToFlutterLearning),
            // ),
            // const SizedBox(height: 50),
            // TextButton(
            //   onPressed: () => context.push('/selection-page'),
            //   child: Text(s.goToSelectionPage),
            // ),
          ],
        ),
      ),
    );
  }
}
