import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/state_management_view.dart';

final List<GoRoute> stateManagementRoutes = [
  GoRoute(
    path: '/state-management',
    builder: (_, __) => const StateManagementView(),
  ),
];
