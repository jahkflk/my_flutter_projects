import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/toggle_bar_rp_view.dart';

final List<GoRoute> toggleBarRpRoutes = [
  GoRoute(
    path: '/toggle_bar_rp',
    builder: (context, state) => const ToggleBarRpView(),
  ),
];
