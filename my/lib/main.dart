import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/initialize/init.dart';
import 'core/routes/app_router.dart';
import 'package:my/features/projects/intl_demo/generated/l10n.dart';
import 'package:my/core/providers/locale_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; // ✅ 添加这行

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseInitializer.initialize(); // ✅ 注意方法名变了
  runApp(const ProviderScope(child: MyApp())); // ✅ hooks_riverpod 的入口
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
      title: 'White Toggle Button Demo',
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter,
    );
  }
}
