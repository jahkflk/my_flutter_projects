import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../management/providers/stream_user_provider.dart';

class HomeViewStream extends HookConsumerWidget {
  const HomeViewStream({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userNotifierProvider);
    final notifier = ref.read(userNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'add') {
                context.push('/user/add');
              } else if (value == 'logout') {
                context.go('/login');
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'add', child: Text('Add User')),
              const PopupMenuItem(value: 'logout', child: Text('Logout')),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/user/add'),
        child: const Icon(Icons.add),
      ),
      body: users.isEmpty
          ? const Center(child: Text('No users found.'))
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Created')),
                  DataColumn(label: Text('Updated')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: users.map((user) {
                  return DataRow(
                    cells: [
                      DataCell(Text(user.id?.toString() ?? '')),
                      DataCell(Text(user.name ?? '')),
                      DataCell(Text(user.email)),
                      DataCell(Text(user.createdAt?.toIso8601String() ?? '-')),
                      DataCell(Text(user.updatedAt?.toIso8601String() ?? '-')),
                      DataCell(Row(
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
                            onPressed: () {
                              if (user.id != null) {
                                notifier.deleteUser(user.id!);
                              }
                            },
                          ),
                        ],
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),
    );
  }
}
