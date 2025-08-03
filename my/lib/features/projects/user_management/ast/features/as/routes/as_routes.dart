import 'package:go_router/go_router.dart';

import '../views/as_view.dart';
import '../views/device_add_view.dart';
import '../views/group_add_view.dart';

final List<GoRoute> AsRoutes = [
  GoRoute(
    path: '/as',
    builder: (context, state) => const AsView(),
  ),
  GoRoute(
    path: '/device_add',
    builder: (context, state) => const DeviceAddView(),
  ),
  GoRoute(
    path: '/group_add',
    builder: (context, state) => const GroupAppView(),
  ),
];
