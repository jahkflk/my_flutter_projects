import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/gen_ai_view.dart';

final List<GoRoute> genAiRoutes = [
  GoRoute(
    path: '/gen-ai',
    builder: (_, __) => const GenAiView(),
  ),
];
