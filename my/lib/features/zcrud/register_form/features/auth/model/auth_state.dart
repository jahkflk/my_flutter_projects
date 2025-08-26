import 'user.dart';

class AuthState {
  final bool isLoggedIn;
  final List<User> users;

  const AuthState({
    this.isLoggedIn = false,
    this.users = const [],
  });

  AuthState copyWith({
    bool? isLoggedIn,
    List<User>? users,
  }) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      users: users ?? this.users,
    );
  }
}
