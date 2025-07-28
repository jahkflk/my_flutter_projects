import 'package:go_router/go_router.dart';

import '../views/stream_home_view.dart';

final List<GoRoute> homeRoutesStream = [
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeViewStream(),
  ),
];
