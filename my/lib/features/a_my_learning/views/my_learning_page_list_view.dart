import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/selectable_button_group.dart';
import '../../../core/widgets/selectable_outlined_button.dart';

class myLearningPage extends ConsumerWidget {
  const myLearningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    final buttonData = [
      ('实战项目', Icons.build, '/projects'),
      ('Udemy课程', Icons.school, '/udemy'),
      ('博客阅读', Icons.book, '/blog'),
      ('Flutter官网', Icons.language, '/flutter-official'),
      ('Dart官网', Icons.code, '/dart-official'),
      ('YouTube教程', Icons.video_library, '/youtube'),
      ('Flutter中文网', Icons.translate, '/flutter-cn'),
      ('组件练习', Icons.extension, '/widgets'),
      ('路由导航', Icons.navigation, '/routing'),
      ('状态管理', Icons.memory, '/state-management'),
      ('网络请求', Icons.http, '/http'),
      ('数据库操作', Icons.storage, '/database'),
      ('自定义组件', Icons.brush, '/custom-widgets'),
      ('动画练习', Icons.movie, '/animations'),
      ('跨平台适配', Icons.phone_android, '/cross-platform'),
      ('GitHub学习', Icons.code_off, '/github'),
      ('Google Codelab', Icons.lightbulb, '/codelab'),
      ('实战商城App', Icons.shopping_cart, '/shop-app'),
      ('企业级架构', Icons.business, '/enterprise'),
      ('Mock API 练习', Icons.api, '/mock-api'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 学习入口')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: buttonData.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final (label, icon, route) = buttonData[index];

            return SelectableOutlinedButton(
              isSelected: selectedIndex == index,
              icon: icon,
              label: label,
              onPressed: () {
                ref.read(selectedIndexProvider.notifier).state = index;
                context.push(route);
              },
              selectedBackgroundColor: Colors.black,
              unselectedBackgroundColor: Colors.grey.shade100,
              selectedTextColor: Colors.yellow,
              unselectedTextColor: Colors.black87,
              selectedIconColor: Colors.yellow,
              unselectedIconColor: Colors.black45,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              borderSide: const BorderSide(color: Colors.black),
            );
          },
        ),
      ),
    );
  }
}
