import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/rag_view.dart';

final List<GoRoute> ragRoutes = [
  GoRoute(
    path: '/rag',
    builder: (_, __) => const RagView(),
  ),
];
