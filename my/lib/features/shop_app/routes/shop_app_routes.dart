import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/shop_app_view.dart';

final List<GoRoute> shopAppRoutes = [
  GoRoute(
    path: '/shop-app',
    builder: (_, __) => const ShopAppView(),
  ),
];
