import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/flutter_cn_view.dart';

final List<GoRoute> flutterCnRoutes = [
  GoRoute(
    path: '/flutter-cn',
    builder: (_, __) => const FlutterCnView(),
  ),
];
