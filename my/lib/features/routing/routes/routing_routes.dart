import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/routing_view.dart';

final List<GoRoute> routingRoutes = [
  GoRoute(
    path: '/routing',
    builder: (_, __) => const RoutingView(),
  ),
];
