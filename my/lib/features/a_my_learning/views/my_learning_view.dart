import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my/core/widgets/selectable_button_group.dart';

import '../../../core/widgets/selectable_outlined_button.dart';

class myLearningView extends ConsumerWidget {
  const myLearningView({super.key});

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

      // ✅ 新增 AI 学习主题按钮
      ('生成式 AI', Icons.smart_toy, '/gen-ai'),
      ('AI', Icons.psychology_alt, '/ai-apps'),
      ('LangChain 学习', Icons.fork_right, '/langchain'),
      ('RAG 技术实践', Icons.merge_type, '/rag'),
      ('Prompt 工程技巧', Icons.tips_and_updates, '/prompt-design'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 学习入口')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;

            // 决定每个按钮的宽度
            double itemWidth;
            if (maxWidth > 1000) {
              itemWidth = (maxWidth - 48) / 4; // 网页：4列
            } else if (maxWidth > 600) {
              itemWidth = (maxWidth - 36) / 3; // 平板：3列
            } else {
              itemWidth = (maxWidth - 24) / 2; // 手机：2列
            }

            return SingleChildScrollView(
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(buttonData.length, (index) {
                  final (label, icon, route) = buttonData[index];

                  return SizedBox(
                    width: itemWidth,
                    child: SelectableOutlinedButton(
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
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
