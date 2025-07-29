import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/flash_chat_view.dart';

// 引入模块路由

final List<GoRoute> flashChatRoutes = [
  GoRoute(
    path: '/flash_chat',
    builder: (context, state) => const FlashChatView(),
  ),
];
