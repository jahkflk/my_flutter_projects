import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/http_view.dart';

final List<GoRoute> httpRoutes = [
  GoRoute(
    path: '/http',
    builder: (_, __) => const HttpView(),
  ),
];
