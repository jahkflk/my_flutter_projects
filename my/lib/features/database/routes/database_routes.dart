import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/database_view.dart';

final List<GoRoute> databaseRoutes = [
  GoRoute(
    path: '/database',
    builder: (_, __) => const DatabaseView(),
  ),
];
