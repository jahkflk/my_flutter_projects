import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/udemy_view.dart';

final List<GoRoute> udemyRoutes = [
  GoRoute(
    path: '/udemy',
    builder: (_, __) => const UdemyView(),
  ),
];
