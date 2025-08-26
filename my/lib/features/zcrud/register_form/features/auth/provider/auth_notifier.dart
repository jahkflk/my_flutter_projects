import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my/core/validators/input_validators.dart';
import 'package:uuid/uuid.dart';

import '../model/auth_state.dart';
import '../model/user.dart';

class AuthNotifier extends AsyncNotifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  // --- Auth ---
  Future<void> login(String email, String password) async {
    if (!isValidEmail(email) || !isValidPassword(password)) return;
    // Simulate async call
    state = AsyncData(state.value!.copyWith(isLoggedIn: true));
  }

  void logout() {
    state = const AsyncData(AuthState());
  }

  // --- Users CRUD ---
  Future<void> addUser(String email, String mac, String password) async {
    if (!isValidEmail(email) || !isValidMac(mac) || !isValidPassword(password))
      return;

    final newUser = User(
      id: const Uuid().v4(),
      email: email,
      mac: mac,
      password: password,
    );

    final updated = [...state.value!.users, newUser];
    state = AsyncData(state.value!.copyWith(users: updated));
  }

  Future<void> updateUser(
      String id, String email, String mac, String password) async {
    if (!isValidEmail(email) || !isValidMac(mac) || !isValidPassword(password))
      return;

    final updated = state.value!.users.map((u) {
      if (u.id == id)
        return u.copyWith(email: email, mac: mac, password: password);
      return u;
    }).toList();

    state = AsyncData(state.value!.copyWith(users: updated));
  }

  Future<void> deleteUser(String id) async {
    final updated = state.value!.users.where((u) => u.id != id).toList();
    state = AsyncData(state.value!.copyWith(users: updated));
  }

  User? getUserById(String id) {
    for (final u in state.value!.users) {
      if (u.id == id) return u;
    }
    return null;
  }
}

final authProvider =
    AsyncNotifierProvider<AuthNotifier, AuthState>(() => AuthNotifier());
