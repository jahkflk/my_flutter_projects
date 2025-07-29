import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/todoey_view.dart';

// 引入模块路由

final List<GoRoute> todoeYRoutes = [
  GoRoute(
    path: '/todoey',
    builder: (context, state) => const TodoeyView(),
  ),
];
