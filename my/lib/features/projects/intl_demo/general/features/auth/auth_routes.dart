import 'package:go_router/go_router.dart';

import '../views/login_view.dart';

final List<GoRoute> authIntlRoutes = [
  GoRoute(
    path: '/intl_demo_general_login',
    builder: (context, state) => const IntlLoginView(),
  ),
  // GoRoute(
  //   path: '/register',
  //   builder: (context, state) => const RegisterPage(),
  // ),
  // GoRoute(
  //   path: '/register_success',
  //   builder: (context, state) => const RegisterSuccessPage(),
  // ),
];
