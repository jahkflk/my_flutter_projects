import 'package:go_router/go_router.dart';
import '../views/home_view.dart';

final List<GoRoute> homeRoutes = [
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeView(),
  ),
];
