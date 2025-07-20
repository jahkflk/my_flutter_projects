import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/custom_widgets_view.dart';

final List<GoRoute> customWidgetsRoutes = [
  GoRoute(
    path: '/custom-widgets',
    builder: (_, __) => const CustomWidgetsView(),
  ),
];
