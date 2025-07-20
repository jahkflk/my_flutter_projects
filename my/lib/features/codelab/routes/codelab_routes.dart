import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/codelab_view.dart';

final List<GoRoute> codelabRoutes = [
  GoRoute(
    path: '/codelab',
    builder: (_, __) => const CodelabView(),
  ),
];
