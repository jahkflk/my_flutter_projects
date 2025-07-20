import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/animations_view.dart';

final List<GoRoute> animationsRoutes = [
  GoRoute(
    path: '/animations',
    builder: (_, __) => const AnimationsView(),
  ),
];
