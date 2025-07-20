import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/github_view.dart';

final List<GoRoute> githubRoutes = [
  GoRoute(
    path: '/github',
    builder: (_, __) => const GithubView(),
  ),
];
