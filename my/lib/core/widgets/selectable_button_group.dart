import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'selectable_outlined_button_animation.dart';

/// 模拟按钮数据模型（可换为真实模型）
final buttonLabels = ['Chat', 'Email', 'Call', 'Share', 'Save'];

/// 选择按钮的状态索引
final selectedIndexProvider = StateProvider<int>((ref) => -1);

/// 按钮组选中状态（多选）
final selectedIndicesProvider = StateProvider<List<int>>((ref) => []);

/// 判断是否选中
bool isIndexSelected(List<int> selectedIndices, int index) {
  return selectedIndices.contains(index);
}

class SelectableButtonGroup extends ConsumerStatefulWidget {
  const SelectableButtonGroup({super.key});

  @override
  ConsumerState<SelectableButtonGroup> createState() =>
      _SelectableButtonGroupState();
}

class _SelectableButtonGroupState extends ConsumerState<SelectableButtonGroup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap(int index) {
    final selectedIndices = ref.read(selectedIndicesProvider);
    final newList = [...selectedIndices];

    if (newList.contains(index)) {
      newList.remove(index);
    } else {
      newList.add(index);
    }

    ref.read(selectedIndicesProvider.notifier).state = newList;

    // Trigger animation
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndices = ref.watch(selectedIndicesProvider);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: buttonLabels.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: SelectableOutlinedButton(
            isSelected: selectedIndices.contains(index),
            icon: Icons.check_circle_outline,
            label: buttonLabels[index],
            onPressed: () => _handleTap(index),
            scaleAnimation: _scaleAnimation,
          ),
        );
      },
    );
  }
}
