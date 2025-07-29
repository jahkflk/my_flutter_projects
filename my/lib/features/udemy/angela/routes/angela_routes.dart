import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../flash_chat/routes/flash_chat_routes.dart';
import '../todoey/routes/todoey_routes.dart';
import '../views/angela.view.dart';

// 引入模块路由

final List<GoRoute> angelaRoutes = [
  GoRoute(
    path: '/angela',
    builder: (context, state) => const AngelaView(),
  ),

  // 嵌套模块路由
  ...todoeYRoutes,
  ...flashChatRoutes,
];
