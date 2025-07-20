import 'package:my/features/a_my_learning/routes/my_learning_routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/my-learning',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        // ここで共通の画面枠やナビゲーションバーを入れる場合は記述
        return child;
      },
      routes: [
        ...myLearningRoutes,
      ],
    ),
  ],
);
