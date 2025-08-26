import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../features/auth/provider/auth_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider).value!;
    final users = state.users;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          Expanded(
            child: users.isEmpty
                ? const Center(child: Text('No users yet'))
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(user.email),
                        subtitle: Text('MAC: ${user.mac}'),
                        trailing: ElevatedButton(
                          onPressed: () {
                            context.go('/edit/${user.id}');
                          },
                          child: const Text('Edit'),
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => context.go('/add'),
            child: const Text('Add New User'),
          ),
        ],
      ),
    );
  }
}
