import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my/features/projects/user_management/user_management_view.dart';

import '../../features/auth/routes/auth_routes.dart';
import '../../features/home/routes/home_routes.dart';
import '../../features/hooks_riverpod_view.dart';
import '../../features/management/routes/user_routes.dart';

final List<GoRoute> flutterHooks = [
  GoRoute(
    path: '/flutter_hooks',
    builder: (context, state) => const HooksRiverpodView(),
  ),
  ...authRoutes,
  ...homeRoutes,
  ...managementRoutes,
];
