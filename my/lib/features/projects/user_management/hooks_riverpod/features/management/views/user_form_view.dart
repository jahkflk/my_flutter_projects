import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/user_model.dart';
import '../providers/user_provider.dart';

class UserFormPage extends HookConsumerWidget {
  final int? userId;
  const UserFormPage({super.key, this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdit = userId != null;
    final nameCtrl = useTextEditingController();
    final emailCtrl = useTextEditingController();
    final passCtrl = useTextEditingController();
    final notifier = ref.read(userNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit User' : 'Add User')),
      body: FutureBuilder<UserModel?>(
        future: isEdit ? notifier.getUser(userId!) : Future.value(null),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = snapshot.data;
          if (user != null) {
            nameCtrl.text = user.name ?? '';
            emailCtrl.text = user.email;
            passCtrl.text = user.password;
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passCtrl,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final model = UserModel(
                      id: userId,
                      name: nameCtrl.text.trim(),
                      email: emailCtrl.text.trim(),
                      password: passCtrl.text.trim(),
                    );

                    if (isEdit) {
                      await notifier.updateUser(model);
                    } else {
                      await notifier.insertUser(model);
                    }

                    if (context.mounted) context.pop();
                  },
                  child: Text(isEdit ? 'Update' : 'Add'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
