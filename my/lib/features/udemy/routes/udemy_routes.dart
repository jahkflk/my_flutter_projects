import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../angela/routes/angela_routes.dart';
import '../views/udemy_view.dart';

final List<GoRoute> udemyRoutes = [
  GoRoute(
    path: '/udemy',
    builder: (context, state) => const UdemyView(),
  ),
  ...angelaRoutes,
];
