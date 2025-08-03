import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/user_form_view.dart';
import '../views/user_detail_view.dart';

final List<GoRoute> managementRoutes = [
  GoRoute(
    path: '/user/add',
    builder: (BuildContext context, GoRouterState state) {
      return const UserFormPage();
    },
  ),
  GoRoute(
    path: '/user/edit/:id',
    builder: (BuildContext context, GoRouterState state) {
      final id = int.tryParse(state.pathParameters['id'] ?? '');
      return UserFormPage(userId: id);
    },
  ),
  GoRoute(
    path: '/user/detail/:id',
    builder: (BuildContext context, GoRouterState state) {
      final id = int.tryParse(state.pathParameters['id'] ?? '');
      return UserDetailPage(userId: id!);
    },
  ),
];
