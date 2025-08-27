import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/segmented_tab_view.dart';
import '../views/segmented_tab_view_ud.dart';

final List<GoRoute> segmentedTabRoutes = [
  GoRoute(
    path: '/segmented',
    builder: (context, state) => const SegmentedTabView(),
  ),
  GoRoute(
    path: '/segmented_ud',
    builder: (context, state) => const SegmentedTabsPage(),
  ),
];
