import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/langchain_view.dart';

final List<GoRoute> langchainRoutes = [
  GoRoute(
    path: '/langchain',
    builder: (_, __) => const LangchainView(),
  ),
];
