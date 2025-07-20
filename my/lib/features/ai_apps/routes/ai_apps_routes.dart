import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../selection_page/views/selection_page.dart';
import '../views/ai_apps_view.dart';
import '../views/multi_select.dart';
import '../views/selectable.dart';
import '../views/selectable_with_pressed.dart';

final List<GoRoute> aiAppsRoutes = [
  GoRoute(
    path: '/ai-apps',
    builder: (BuildContext context, GoRouterState state) {
      return const AiAppsView();
    },
  ),
  GoRoute(path: '/multi-select', builder: (_, __) => const MultiSelect()),
  GoRoute(
      path: '/selectable', builder: (_, __) => const SelectableButtonDemo()),
  GoRoute(path: '/selection-page', builder: (_, __) => const SelectionPage()),
  GoRoute(
      path: '/selectable-with-pressed',
      builder: (_, __) => const SelectableButtonWithPressDemo()),
];
