import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/mock_api_view.dart';

final List<GoRoute> mockApiRoutes = [
  GoRoute(
    path: '/mock-api',
    builder: (_, __) => const MockApiView(),
  ),
];
