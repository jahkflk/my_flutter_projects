import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/stream_user_detail_view.dart';
import '../views/stream_user_form_view.dart';

final List<GoRoute> managementRoutesStream = [
  GoRoute(
    path: '/user/add',
    builder: (BuildContext context, GoRouterState state) {
      return const UserFormViewStream();
    },
  ),
  GoRoute(
    path: '/user/edit/:id',
    builder: (BuildContext context, GoRouterState state) {
      final id = int.tryParse(state.pathParameters['id'] ?? '');
      return UserFormViewStream(userId: id);
    },
  ),
  GoRoute(
    path: '/user/detail/:id',
    builder: (BuildContext context, GoRouterState state) {
      final id = int.tryParse(state.pathParameters['id'] ?? '');
      return UserDetailViewStream(userId: id!);
    },
  ),
];
