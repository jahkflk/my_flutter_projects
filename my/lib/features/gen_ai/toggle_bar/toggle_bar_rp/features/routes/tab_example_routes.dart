import 'package:go_router/go_router.dart';

import '../views/tab_example_page.dart';

final List<GoRoute> authRoutes = [
  GoRoute(
    path: '/tab_example',
    builder: (context, state) => const TabExamplePage(),
  ),
];
