import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/youtube_view.dart';

final List<GoRoute> youtubeRoutes = [
  GoRoute(
    path: '/youtube',
    builder: (_, __) => const YoutubeView(),
  ),
];
