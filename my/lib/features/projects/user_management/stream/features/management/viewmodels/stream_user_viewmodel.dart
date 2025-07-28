import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my/features/projects/user_management/stream/features/management/dao/stream_user_dao.dart';
import '../../data/models/stream_user_model.dart';

final userViewModelProvider =
    ChangeNotifierProvider<UserViewModel>((ref) => UserViewModel());

class UserViewModel extends ChangeNotifier {
  final UserDaoStream _repo = UserDaoStream();

  List<UserModelStream> users = [];

  Future<void> loadUsers() async {
    users = await _repo.getAllUsers(); // ✅ UserDao 直接返回 List<UserModelStream>
    notifyListeners();
  }

  /// メール重複エラーを検知し、成功ならtrue, 重複エラーならfalseを返す
  Future<bool> insertUser(UserModelStream user) async {
    try {
      await _repo.insertUser(user); // ✅ 不再用 toMap
      await loadUsers();
      return true;
    } catch (e) {
      if (e.toString().contains('UNIQUE constraint failed')) {
        return false;
      }
      rethrow;
    }
  }

  Future<bool> updateUser(UserModelStream user) async {
    try {
      await _repo.updateUser(user);
      await loadUsers();
      return true;
    } catch (e) {
      if (e.toString().contains('UNIQUE constraint failed')) {
        return false;
      }
      rethrow;
    }
  }

  Future<void> deleteUser(int id) async {
    await _repo.deleteUser(id);
    await loadUsers();
  }

  Future<void> deleteAll() async {
    await _repo.deleteAllUsers();
    await loadUsers();
  }

  Future<UserModelStream?> getUser(int id) async {
    final data = await _repo.getUserById(id);
    return data;
  }
}
