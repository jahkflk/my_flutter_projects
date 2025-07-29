import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my/core/utils/responsive_utils.dart';
import 'package:my/core/widgets/selectable_button_group.dart';

import 'package:my/core/widgets/selectable_outlined_button.dart';

import '../todoey/widgets/selectable_outlined_button_style1.dart';

class AngelaView extends ConsumerWidget {
  const AngelaView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    final buttonData = [
      ('Todoey', Icons.build, '/todoey'),
      ('Flash Chat', Icons.people, '/flash_chat'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('这是 AngelaView 页面')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // child: LayoutBuilder(
        //   builder: (context, constraints) {
        //     double maxWidth = constraints.maxWidth;

        child: Builder(
          // builder: (context) {
          //   double maxWidth = MediaQuery.of(context).size.width;
          //   // 决定每个按钮的宽度
          //   double itemWidth;
          //   if (maxWidth > 1000) {
          //     itemWidth = (maxWidth - 48) / 4; // 网页：4列
          //   } else if (maxWidth > 600) {
          //     itemWidth = (maxWidth - 36) / 3; // 平板：3列
          //   } else {
          //     itemWidth = (maxWidth - 24) / 2; // 手机：2列
          //   }

          builder: (context) {
            final screenWidth = MediaQuery.of(context).size.width;

            int columns;
            if (screenWidth > 1000) {
              columns = 4;
            } else if (screenWidth > 600) {
              columns = 3;
            } else {
              columns = 2;
            }

            final itemWidth = calculateResponsiveItemWidth(
              context: context,
              columns: 3,
              spacing: 12,
              horizontalPadding: 32, // 16 左 + 16 右
            );

            return SingleChildScrollView(
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(buttonData.length, (index) {
                  final (label, icon, route) = buttonData[index];

                  return SizedBox(
                    width: itemWidth,
                    child: SelectableOutlinedButtonStyle1(
                      isSelected: selectedIndex == index,
                      icon: icon,
                      label: label,
                      onPressed: () {
                        ref.read(selectedIndexProvider.notifier).state = index;
                        context.push(route);
                      },
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
