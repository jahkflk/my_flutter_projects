import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/stream_user_provider.dart';

class UserListPageStream extends ConsumerWidget {
  const UserListPageStream({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: usersAsync.when(
        data: (users) => users.isEmpty
            ? const Center(child: Text('No users found.'))
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user.name ?? 'Unnamed'),
                    subtitle: Text(user.email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.info),
                          onPressed: () =>
                              context.push('/user/detail/${user.id}'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () =>
                              context.push('/user/edit/${user.id}'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            if (user.id != null) {
                              await ref
                                  .read(userNotifierProvider.notifier)
                                  .deleteUser(user.id!);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
