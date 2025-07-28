import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/stream_user_provider.dart';

class UserListPageStream extends ConsumerWidget {
  const UserListPageStream({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userNotifierProvider);
    final notifier = ref.read(userNotifierProvider.notifier);

    if (users.isEmpty) {
      return const Center(child: Text('No users found.'));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Actions')),
        ],
        rows: users.map((user) {
          return DataRow(cells: [
            DataCell(Text(user.id?.toString() ?? '')),
            DataCell(Text(user.name ?? '')),
            DataCell(Text(user.email)),
            DataCell(Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => context.push('/user/edit/${user.id}'),
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
          ]);
        }).toList(),
      ),
    );
  }
}
