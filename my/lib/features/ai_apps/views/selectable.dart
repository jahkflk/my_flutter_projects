import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my/core/widgets/selectable_outlined_button.dart';

final selectedIndexProvider = StateProvider<int>((ref) => -1);

class SelectableButtonDemo extends ConsumerWidget {
  const SelectableButtonDemo({super.key});

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
              child: SelectableOutlinedButton(
                isSelected: selectedIndex == index,
                icon: icon,
                label: label,
                onPressed: () {
                  ref.read(selectedIndexProvider.notifier).state = index;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You selected: $label')),
                  );
                },
                selectedBackgroundColor: Colors.blue.shade900,
                unselectedBackgroundColor: Colors.white,
                selectedTextColor: Colors.white,
                unselectedTextColor: Colors.black87,
                selectedIconColor: Colors.white,
                unselectedIconColor: Colors.black54,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                borderSide: const BorderSide(color: Colors.blueGrey),
              ),
            );
          }),
        ),
      ),
    );
  }
}
