import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/provider/auth_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider).value!;
    final notifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - All Users'),
        actions: [
          if (auth.isLoggedIn)
            IconButton(
              tooltip: 'Logout',
              onPressed: () {
                notifier.logout();
                context.go('/z_login');
              },
              icon: const Icon(Icons.logout),
            ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => context.go('/z_add'),
                    icon: const Icon(Icons.person_add),
                    label: const Text('Add New User'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: auth.users.isEmpty
                ? const Center(child: Text('No users yet. Tap "Add New User".'))
                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: auth.users.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final u = auth.users[index];
                      return Card(
                        child: ListTile(
                          title: Text(u.email),
                          subtitle: Text('MAC: ${u.mac}'),
                          trailing: Wrap(
                            spacing: 8,
                            children: [
                              OutlinedButton(
                                onPressed: () => context.go('/z_edit/${u.id}'),
                                child: const Text('Edit'),
                              ),
                              IconButton(
                                tooltip: 'Delete',
                                onPressed: () => notifier.deleteUser(u.id),
                                icon: const Icon(Icons.delete_outline),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
