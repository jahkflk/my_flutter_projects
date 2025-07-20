import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../projects/routes/projects_routes.dart';
import '../../udemy/routes/udemy_routes.dart';
import '../../blog/routes/blog_routes.dart';
import '../../flutter_official/routes/flutter_official_routes.dart';
import '../../dart_official/routes/dart_official_routes.dart';
import '../../youtube/routes/youtube_routes.dart';
import '../../flutter_cn/routes/flutter_cn_routes.dart';
import '../../widgets/routes/widgets_routes.dart';
import '../../routing/routes/routing_routes.dart';
import '../../state_management/routes/state_management_routes.dart';
import '../../http/routes/http_routes.dart';
import '../../database/routes/database_routes.dart';
import '../../custom_widgets/routes/custom_widgets_routes.dart';
import '../../animations/routes/animations_routes.dart';
import '../../cross_platform/routes/cross_platform_routes.dart';
import '../../github/routes/github_routes.dart';
import '../../codelab/routes/codelab_routes.dart';
import '../../shop_app/routes/shop_app_routes.dart';
import '../../enterprise/routes/enterprise_routes.dart';
import '../../mock_api/routes/mock_api_routes.dart';
import '../../gen_ai/routes/gen_ai_routes.dart';
import '../../ai_apps/routes/ai_apps_routes.dart';
import '../../langchain/routes/langchain_routes.dart';
import '../../rag/routes/rag_routes.dart';
import '../../prompt_design/routes/prompt_design_routes.dart';

import '../views/my_learning_view.dart';

final List<GoRoute> myLearningRoutes = [
  GoRoute(
    path: '/my-learning',
    builder: (BuildContext context, GoRouterState state) =>
        const myLearningView(),
  ),

  // 模块化子路由整合
  ...projectsRoutes,
  ...udemyRoutes,
  ...blogRoutes,
  ...flutterOfficialRoutes,
  ...dartOfficialRoutes,
  ...youtubeRoutes,
  ...flutterCnRoutes,
  ...widgetsRoutes,
  ...routingRoutes,
  ...stateManagementRoutes,
  ...httpRoutes,
  ...databaseRoutes,
  ...customWidgetsRoutes,
  ...animationsRoutes,
  ...crossPlatformRoutes,
  ...githubRoutes,
  ...codelabRoutes,
  ...shopAppRoutes,
  ...enterpriseRoutes,
  ...mockApiRoutes,
  ...genAiRoutes,
  ...aiAppsRoutes,
  ...langchainRoutes,
  ...ragRoutes,
  ...promptDesignRoutes,
];
