import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/prompt_design_view.dart';

final List<GoRoute> promptDesignRoutes = [
  GoRoute(
    path: '/prompt-design',
    builder: (_, __) => const PromptDesignView(),
  ),
];
