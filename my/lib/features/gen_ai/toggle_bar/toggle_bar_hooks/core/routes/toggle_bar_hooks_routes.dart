import 'package:go_router/go_router.dart';

import '../../features/segmented/routes/segmented_tab_routes.dart';
import '../../features/toggle_bar_hooks_view.dart';

final List<GoRoute> toggleBarHooksRoutes = [
  GoRoute(
    path: '/toggle_bar_hooks',
    builder: (context, state) => const ToggleBarHooksView(),
  ),
  ...segmentedTabRoutes
];
