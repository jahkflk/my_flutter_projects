import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/dart_official_view.dart';

final List<GoRoute> dartOfficialRoutes = [
  GoRoute(
    path: '/dart-official',
    builder: (_, __) => const DartOfficialView(),
  ),
];
