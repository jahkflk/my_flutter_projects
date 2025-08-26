import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/routes/auth_routes.dart';
import '../../features/flutter_register_form.dart';

final List<GoRoute> zCrudRoutes = [
  GoRoute(
    path: '/zcrud',
    builder: (context, state) => const FlutterRegisterForm(),
  ),
  ...registerFormRoutes,
];
