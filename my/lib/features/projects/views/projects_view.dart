import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my/core/widgets/selectable_button_group.dart';
import '../../../core/widgets/selectable_outlined_button.dart';

class ProjectsView extends ConsumerWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    final buttonData = [
      ('ParkingDemo', Icons.build, '/parking_demo'),
      ('UserManagementDemo', Icons.people, '/user_management'),
      ('IntlDemo', Icons.people, '/intl_demo'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('这是 ProjectsView 页面')),
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
