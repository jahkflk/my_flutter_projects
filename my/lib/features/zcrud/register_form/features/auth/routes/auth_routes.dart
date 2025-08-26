import 'package:go_router/go_router.dart';
import '../view/auth_edit_page.dart';
import '../view/home_page.dart';

final List<GoRoute> registerFormRoutes = [
  // GoRoute(
  //   path: '/z_register_form',
  //   // builder: (context, state) => const RegisterPage(),
  //   builder: (context, state) => const AuthAndEditPage(
  //     mode: AuthMode.add,
  //   ),
  // ),
  // GoRoute(
  //   path: '/z_home',
  //   name: 'z_home',
  //   builder: (_, __) => const HomePage(),
  // ),
  GoRoute(
    path: '/z_login',
    builder: (_, __) => const AuthAndEditPage(mode: AuthMode.login),
  ),
  GoRoute(
    path: '/z_home',
    builder: (_, __) => const HomePage(),
  ),
  GoRoute(
    path: '/z_add',
    builder: (_, __) => const AuthAndEditPage(mode: AuthMode.add),
  ),
  GoRoute(
    path: '/z_edit/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return AuthAndEditPage(mode: AuthMode.edit, userId: id);
    },
  ),
];
