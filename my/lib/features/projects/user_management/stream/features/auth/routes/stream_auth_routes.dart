import 'package:go_router/go_router.dart';
import '../views/stream_login_view.dart';
import '../views/stream_register_success.dart';
import '../views/stream_register_view.dart';

final List<GoRoute> authRoutesStream = [
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginViewStream(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterStream(),
  ),
  GoRoute(
    path: '/register_success',
    builder: (context, state) => const RegisterSuccessStream(),
  ),
];
