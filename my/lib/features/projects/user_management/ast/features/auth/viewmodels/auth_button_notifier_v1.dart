import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthButtonState {
  final bool isPressed;
  AuthButtonState({this.isPressed = false});
}

class AuthButtonNotifier extends StateNotifier<AuthButtonState> {
  AuthButtonNotifier() : super(AuthButtonState());

  void setPressed(bool v) => state = AuthButtonState(isPressed: v);
}

final authButtonProvider =
    StateNotifierProvider<AuthButtonNotifier, AuthButtonState>(
        (_) => AuthButtonNotifier());
