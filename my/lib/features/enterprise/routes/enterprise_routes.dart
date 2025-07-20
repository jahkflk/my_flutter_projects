import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/enterprise_view.dart';

final List<GoRoute> enterpriseRoutes = [
  GoRoute(
    path: '/enterprise',
    builder: (_, __) => const EnterpriseView(),
  ),
];
