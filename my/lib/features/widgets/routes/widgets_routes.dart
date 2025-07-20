import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/widgets_view.dart';

final List<GoRoute> widgetsRoutes = [
  GoRoute(
    path: '/widgets',
    builder: (_, __) => const WidgetsView(),
  ),
];
