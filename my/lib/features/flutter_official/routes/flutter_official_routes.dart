import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/flutter_official_view.dart';

final List<GoRoute> flutterOfficialRoutes = [
  GoRoute(
    path: '/flutter-official',
    builder: (_, __) => const FlutterOfficialView(),
  ),
];
