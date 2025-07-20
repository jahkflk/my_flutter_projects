import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/selection_page.dart';

final List<GoRoute> selectionPageRoutes = [
  GoRoute(
    path: '/selection-page',
    builder: (BuildContext context, GoRouterState state) {
      return const SelectionPage();
    },
  ),
];
