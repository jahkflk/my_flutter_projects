import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user_model.dart';
import '../dao/user_dao.dart';

final userViewModelProvider =
    ChangeNotifierProvider<UserViewModel>((ref) => UserViewModel());

class UserViewModel extends ChangeNotifier {
  final UserDao _repo = UserDao();

  List<UserModel> users = [];

  Future<void> loadUsers() async {
    users = await _repo.getAllUsers(); // ✅ UserDao 直接返回 List<UserModel>
    notifyListeners();
  }

  /// メール重複エラーを検知し、成功ならtrue, 重複エラーならfalseを返す
  Future<bool> insertUser(UserModel user) async {
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

  Future<bool> updateUser(UserModel user) async {
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

  Future<UserModel?> getUser(int id) async {
    final data = await _repo.getUserById(id);
    return data;
  }
}
