import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my/features/projects/views/projects_view.dart'
    show ProjectsView;

import 'package:my/features/ai_apps/routes/ai_apps_routes.dart';

// 导入真实页面
import 'package:my/features/udemy/views/udemy_view.dart';
import 'package:my/features/blog/views/blog_view.dart';
import 'package:my/features/flutter_official/views/flutter_official_view.dart';
import 'package:my/features/dart_official/views/dart_official_view.dart';
import 'package:my/features/youtube/views/youtube_view.dart';
import 'package:my/features/flutter_cn/views/flutter_cn_view.dart';
import 'package:my/features/widgets/views/widgets_view.dart';
import 'package:my/features/routing/views/routing_view.dart';
import 'package:my/features/state_management/views/state_management_view.dart';
import 'package:my/features/http/views/http_view.dart';
import 'package:my/features/database/views/database_view.dart';
import 'package:my/features/custom_widgets/views/custom_widgets_view.dart';
import 'package:my/features/animations/views/animations_view.dart';
import 'package:my/features/cross_platform/views/cross_platform_view.dart';
import 'package:my/features/github/views/github_view.dart';
import 'package:my/features/codelab/views/codelab_view.dart';
import 'package:my/features/shop_app/views/shop_app_view.dart';
import 'package:my/features/enterprise/views/enterprise_view.dart';
import 'package:my/features/mock_api/views/mock_api_view.dart';
import 'package:my/features/gen_ai/views/gen_ai_view.dart';
import 'package:my/features/ai_apps/views/ai_apps_view.dart';
import 'package:my/features/langchain/views/langchain_view.dart';
import 'package:my/features/rag/views/rag_view.dart';
import 'package:my/features/prompt_design/views/prompt_design_view.dart';

import '../views/my_learning_view.dart';

final List<GoRoute> myLearningRoutes = [
  GoRoute(
    path: '/my-learning',
    builder: (BuildContext context, GoRouterState state) {
      return const myLearningView();
    },
  ),

  /// ✅ 添加 AI 模块子路由
  ...aiAppsRoutes,

  // ✅ 替换 Dummy 为真实页面
  GoRoute(path: '/projects', builder: (_, __) => const ProjectsView()),
  GoRoute(path: '/udemy', builder: (_, __) => const UdemyView()),
  GoRoute(path: '/blog', builder: (_, __) => const BlogView()),
  GoRoute(
      path: '/flutter-official',
      builder: (_, __) => const FlutterOfficialView()),
  GoRoute(path: '/dart-official', builder: (_, __) => const DartOfficialView()),
  GoRoute(path: '/youtube', builder: (_, __) => const YoutubeView()),
  GoRoute(path: '/flutter-cn', builder: (_, __) => const FlutterCnView()),
  GoRoute(path: '/widgets', builder: (_, __) => const WidgetsView()),
  GoRoute(path: '/routing', builder: (_, __) => const RoutingView()),
  GoRoute(
      path: '/state-management',
      builder: (_, __) => const StateManagementView()),
  GoRoute(path: '/http', builder: (_, __) => const HttpView()),
  GoRoute(path: '/database', builder: (_, __) => const DatabaseView()),
  GoRoute(
      path: '/custom-widgets', builder: (_, __) => const CustomWidgetsView()),
  GoRoute(path: '/animations', builder: (_, __) => const AnimationsView()),
  GoRoute(
      path: '/cross-platform', builder: (_, __) => const CrossPlatformView()),
  GoRoute(path: '/github', builder: (_, __) => const GithubView()),
  GoRoute(path: '/codelab', builder: (_, __) => const CodelabView()),
  GoRoute(path: '/shop-app', builder: (_, __) => const ShopAppView()),
  GoRoute(path: '/enterprise', builder: (_, __) => const EnterpriseView()),
  GoRoute(path: '/mock-api', builder: (_, __) => const MockApiView()),
  GoRoute(path: '/gen-ai', builder: (_, __) => const GenAiView()),
  // GoRoute(path: '/ai-apps', builder: (_, __) => const AiAppsView()),
  GoRoute(path: '/langchain', builder: (_, __) => const LangchainView()),
  GoRoute(path: '/rag', builder: (_, __) => const RagView()),
  GoRoute(path: '/prompt-design', builder: (_, __) => const PromptDesignView()),
];
