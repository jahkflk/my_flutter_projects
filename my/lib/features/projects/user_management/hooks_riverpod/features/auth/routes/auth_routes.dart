import 'package:go_router/go_router.dart';
import '../views/login_view.dart';
import '../views/register_view.dart';
import '../views/register_success.dart';

final List<GoRoute> authRoutes = [
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterPage(),
  ),
  GoRoute(
    path: '/register_success',
    builder: (context, state) => const RegisterSuccessPage(),
  ),
];
