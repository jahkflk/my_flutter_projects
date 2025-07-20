import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/blog_view.dart';

final List<GoRoute> blogRoutes = [
  GoRoute(
    path: '/blog',
    builder: (_, __) => const BlogView(),
  ),
];
