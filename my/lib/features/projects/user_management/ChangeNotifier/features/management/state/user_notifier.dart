import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/user_model.dart';
import '../dao/user_dao.dart';

class UserNotifier extends StateNotifier<List<UserModel>> {
  final UserDao _repo = UserDao();

  UserNotifier() : super([]) {
    loadUsers(); // 初始化加载
  }

  Future<void> loadUsers() async {
    state = await _repo.getAllUsers();
  }

  Future<bool> insertUser(UserModel user) async {
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

  Future<bool> updateUser(UserModel user) async {
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

  Future<UserModel?> getUser(int id) async {
    return await _repo.getUserById(id);
  }
}
