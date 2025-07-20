// intl_demo_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my/core/widgets/selectable_button_group.dart';
import 'package:my/features/projects/intl_demo/widgets/language_selector.dart';
import '../../../core/widgets/selectable_outlined_button.dart';
import 'package:my/features/projects/intl_demo/generated/l10n.dart';

class IntlDemoView extends ConsumerWidget {
  const IntlDemoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = AppLocalizations.of(context)!;
    final selectedIndex = ref.watch(selectedIndexProvider);

    final buttonData = [
      ('general', Icons.build, '/intl_demo_general_login'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('IntlDemoView Title1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: 'Change Language',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const LanguageSelector(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;
            double itemWidth;
            if (maxWidth > 1000) {
              itemWidth = (maxWidth - 48) / 4;
            } else if (maxWidth > 600) {
              itemWidth = (maxWidth - 36) / 3;
            } else {
              itemWidth = (maxWidth - 24) / 2;
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
