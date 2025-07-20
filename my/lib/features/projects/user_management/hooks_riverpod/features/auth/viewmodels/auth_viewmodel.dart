import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../dao/auth_dao.dart';
import '../../data/dto/user_dto.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AsyncValue<void>>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends StateNotifier<AsyncValue<void>> {
  AuthViewModel() : super(const AsyncValue.data(null));

  Future<bool> login(String email, String password) async {
    state = const AsyncLoading();
    final result = await AuthDao.login(email, password);
    state = const AsyncData(null);
    return result;
  }

  Future<bool> register(String name, String email, String password) async {
    state = const AsyncLoading();

    final dto = UserDto(name: name, email: email, password: password);
    final userModel = dto.toModel(); // ✅

    final result = await AuthDao.register(userModel);
    state = const AsyncData(null);
    return result;
  }
}
