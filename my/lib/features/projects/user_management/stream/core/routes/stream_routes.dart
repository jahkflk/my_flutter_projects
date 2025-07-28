import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/routes/stream_auth_routes.dart';
import '../../features/home/routes/stream_home_routes.dart';
import '../../features/management/routes/stream_user_routes.dart';
import '../../features/stream_view.dart';

final List<GoRoute> stream = [
  GoRoute(
    path: '/stream',
    builder: (context, state) => const StreamView(),
  ),
  ...authRoutesStream,
  ...homeRoutesStream,
  ...managementRoutesStream,
];
