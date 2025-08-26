import 'package:go_router/go_router.dart';

import '../view/register_page.dart';

final List<GoRoute> registerFormRoutes = [
  GoRoute(
    path: '/register_form',
    builder: (context, state) => const RegisterPage(),
  ),
];
