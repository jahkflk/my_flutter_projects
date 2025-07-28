import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../hooks_riverpod/features/auth/routes/auth_routes.dart';
import '../hooks_riverpod/features/home/routes/home_routes.dart';
import '../hooks_riverpod/features/management/routes/user_routes.dart';
import '../hooks_riverpod/core/routes/flutter_hooks_routes.dart';
import '../stream/core/routes/stream_routes.dart';
import '../user_management_view.dart';

final List<GoRoute> userManagementRoutes = [
  GoRoute(
    path: '/user_management',
    builder: (context, state) => const UserManagementView(),
  ),
  ...flutterHooks,
  ...stream,
];
