import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/stream_user_model.dart';
import '../dao/stream_user_dao.dart';

class UserNotifier extends StateNotifier<List<UserModelStream>> {
  final UserDaoStream _repo = UserDaoStream();

  UserNotifier() : super([]) {
    loadUsers(); // 初始化加载
  }

  Future<void> loadUsers() async {
    state = await _repo.getAllUsers();
  }

  Future<bool> insertUser(UserModelStream user) async {
    try {
      await _repo.insertUser(user.copyWith(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
      await loadUsers();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateUser(UserModelStream user) async {
    try {
      await _repo.updateUser(user.copyWith(updatedAt: DateTime.now()));
      await loadUsers();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteUser(int id) async {
    await _repo.deleteUser(id);
    await loadUsers();
  }

  Future<UserModelStream?> getUser(int id) async {
    return await _repo.getUserById(id);
  }
}
