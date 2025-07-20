import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../general/features/auth/auth_routes.dart';
import '../intl_demo_view.dart';

final List<GoRoute> intlDemoRoutes = [
  GoRoute(
    path: '/projects/intl_demo',
    builder: (context, state) => const IntlDemoView(),
  ),
  ...authIntlRoutes,
  // ...homeRoutes,
  // ...managementRoutes,
  // GoRoute(
  //   path: '/projects/intl_demo/use-hooks',
  //   builder: (context, state) => const UserManagementUseHooksView(),
  // ),
];
