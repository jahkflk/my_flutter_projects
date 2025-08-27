import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../toggle_bar_hooks/core/routes/toggle_bar_hooks_routes.dart';
import '../toggle_bar_rp/core/routes/toggle_bar_rp_routes.dart';
import '../toggle_bar_view.dart';

final List<GoRoute> toggleBarRoutes = [
  GoRoute(
    path: '/toggle_bar',
    builder: (context, state) => const ToggleBarView(),
  ),
  ...toggleBarHooksRoutes,
  ...toggleBarRpRoutes,
];
