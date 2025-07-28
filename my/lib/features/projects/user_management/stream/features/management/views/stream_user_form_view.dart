// lib/features/user_management/views/user_form_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/stream_user_model.dart';
import '../dao/stream_user_dao.dart';

class UserFormViewStream extends HookWidget {
  final int? userId;
  const UserFormViewStream({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final isLoading = useState(false);
    final isEditing = userId != null;

    useEffect(() {
      if (isEditing) {
        UserDaoStream().getUserById(userId!).then((user) {
          if (user != null) {
            nameController.text = user.name ?? '';
            emailController.text = user.email;
          }
        });
      }
      return null;
    }, [userId]);

    Future<void> handleSubmit() async {
      isLoading.value = true;
      final name = nameController.text;
      final email = emailController.text;

      final user = UserModelStream(
        id: userId,
        name: name,
        email: email,
        password: '',
        updatedAt: DateTime.now(),
        createdAt: isEditing ? null : DateTime.now(),
      );

      if (isEditing) {
        await UserDaoStream().updateUser(user);
      } else {
        await UserDaoStream().insertUser(user);
      }

      isLoading.value = false;
      if (context.mounted) context.pop();
    }

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit User' : 'Add User')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: isLoading.value ? null : handleSubmit,
              child: Text(isEditing ? 'Update' : 'Create'),
            ),
          ],
        ),
      ),
    );
  }
}
