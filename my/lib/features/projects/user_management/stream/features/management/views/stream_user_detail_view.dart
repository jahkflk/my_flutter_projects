import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/stream_user_viewmodel.dart';

class UserDetailPageStream extends ConsumerWidget {
  final int userId;
  const UserDetailPageStream({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(userViewModelProvider);

    return FutureBuilder(
      future: viewModel.getUser(userId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }

        final user = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: const Text('User Details')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${user.id}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('Name: ${user.name}',
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('Email: ${user.email}',
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('Password: ${user.password ?? "N/A"}',
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
        );
      },
    );
  }
}
