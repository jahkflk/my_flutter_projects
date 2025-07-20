import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/cross_platform_view.dart';

final List<GoRoute> crossPlatformRoutes = [
  GoRoute(
    path: '/cross-platform',
    builder: (_, __) => const CrossPlatformView(),
  ),
];
