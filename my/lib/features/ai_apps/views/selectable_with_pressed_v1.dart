import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my/core/widgets/selectable_outlined_button.dart';

import '../../../core/widgets/selectable_outlined_button_with_pressed_v1.dart';

final selectedIndexProvider = StateProvider<int>((ref) => -1);

class SelectableButtonWithPressDemoV1 extends ConsumerWidget {
  const SelectableButtonWithPressDemoV1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    final buttonData = [
      ('LangChain', Icons.language),
      ('RAG', Icons.book),
      ('Prompt', Icons.text_fields),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('AI Apps 选择按钮示例')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(buttonData.length, (index) {
            final (label, icon) = buttonData[index];

            return SizedBox(
                width: 160,
                child: SelectableOutlinedButtonWithPressed(
                  isSelected: false, // 登录按钮不需要“选中”状态，可以传false
                  icon: Icons.login,
                  label: 'Login',
                  onPressed: () {
                    // 登录逻辑
                  },
                  selectedBackgroundColor: Colors.blue.shade900,
                  unselectedBackgroundColor: Colors.white,

                  selectedTextColor: Colors.white,
                  unselectedTextColor: Colors.black87,

                  selectedIconColor: Colors.white,
                  unselectedIconColor: Colors.black54,

                  pressedBackgroundColor: Colors.blue.shade900, // 按下时更深颜色
                  pressedIconColor: Colors.white,
                  pressedTextColor: Colors.white,

                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ));
          }),
        ),
      ),
    );
  }
}
