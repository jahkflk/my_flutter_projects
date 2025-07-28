// lib/features/user_management/views/user_detail_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../data/models/stream_user_model.dart';
import '../dao/stream_user_dao.dart';

class UserDetailViewStream extends HookWidget {
  final int userId;
  const UserDetailViewStream({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final user = useState<UserModelStream?>(null);
    final isLoading = useState(true);

    useEffect(() {
      () async {
        user.value = await UserDaoStream().getUserById(userId);
        isLoading.value = false;
      }();
      return null;
    }, [userId]);

    return Scaffold(
      appBar: AppBar(title: const Text('User Detail')),
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : user.value == null
              ? const Center(child: Text('User not found'))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${user.value!.id}'),
                      const SizedBox(height: 8),
                      Text('Name: ${user.value!.name ?? '-'}'),
                      const SizedBox(height: 8),
                      Text('Email: ${user.value!.email}'),
                      const SizedBox(height: 8),
                      Text(
                          'Created: ${user.value!.createdAt?.toIso8601String() ?? '-'}'),
                      const SizedBox(height: 8),
                      Text(
                          'Updated: ${user.value!.updatedAt?.toIso8601String() ?? '-'}'),
                    ],
                  ),
                ),
    );
  }
}
