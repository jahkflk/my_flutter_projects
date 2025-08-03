import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthButtonType { login, register }

class AuthButtonState {
  final AuthButtonType? pressed;
  const AuthButtonState({this.pressed});

  bool isPressed(AuthButtonType type) => pressed == type;

  AuthButtonState copyWith({AuthButtonType? pressed}) {
    return AuthButtonState(pressed: pressed);
  }
}

class AuthButtonNotifier extends StateNotifier<AuthButtonState> {
  AuthButtonNotifier() : super(const AuthButtonState());

  void setPressed(AuthButtonType? type) {
    state = state.copyWith(pressed: type);
  }

  void reset() => setPressed(null);
}

final authButtonProvider =
    StateNotifierProvider<AuthButtonNotifier, AuthButtonState>(
  (ref) => AuthButtonNotifier(),
);
