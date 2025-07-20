import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../intl_demo/routes/IntlRoutes.dart';
import '../user_management/routes/user_management_routes.dart';
import '../views/projects_view.dart';

// 引入模块路由

final List<GoRoute> projectsRoutes = [
  GoRoute(
    path: '/projects',
    builder: (context, state) => const ProjectsView(),
  ),

  // 嵌套模块路由
  ...userManagementRoutes,
  ...intlDemoRoutes,
];
