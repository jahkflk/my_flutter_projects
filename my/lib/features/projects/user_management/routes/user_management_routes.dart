import 'package:go_router/go_router.dart';
import '../ast/core/routes/ast_routes.dart';
import '../hooks_riverpod/core/routes/flutter_hooks_routes.dart';
import '../register_form/core/routes/flutter_register_form_routes.dart';
import '../stream/core/routes/stream_routes.dart';
import '../user_management_view.dart';

final List<GoRoute> userManagementRoutes = [
  GoRoute(
    path: '/user_management',
    builder: (context, state) => const UserManagementView(),
  ),
  ...flutterHooks,
  ...stream,
  ...flutterRegisterFormRoute,
  ...astRoutes,
];
