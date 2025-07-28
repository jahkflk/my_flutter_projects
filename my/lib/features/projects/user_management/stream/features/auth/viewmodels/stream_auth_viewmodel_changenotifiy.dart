import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/dto/stream_user_dto.dart';
import '../dao/stream_auth_dao.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AsyncValue<void>>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends StateNotifier<AsyncValue<void>> {
  AuthViewModel() : super(const AsyncValue.data(null));

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // 模拟网络延迟
    state = const AsyncLoading();
    final result = await AuthDaoStream.login(email, password);
    state = const AsyncData(null);
    return result;
  }

  Future<bool> register(String name, String email, String password) async {
    state = const AsyncLoading();

    final dto = UserDtoStream(name: name, email: email, password: password);
    final userModel = dto.toModel(); // ✅

    final result = await AuthDaoStream.register(userModel);
    state = const AsyncData(null);
    return result;
  }
}
