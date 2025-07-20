import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my/core/widgets/selectable_button_group.dart';

class MultiSelect extends ConsumerWidget {
  const MultiSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndices = ref.watch(selectedIndicesProvider);
    final selectedLabels =
        selectedIndices.map((i) => buttonLabels[i]).join(', ');

    return Scaffold(
      appBar: AppBar(title: const Text('多选按钮组示例')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SelectableButtonGroup(),
            const SizedBox(height: 20),
            Text('已选中: $selectedLabels'),
          ],
        ),
      ),
    );
  }
}
