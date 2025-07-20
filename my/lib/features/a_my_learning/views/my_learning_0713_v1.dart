import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 选中按钮的状态 Provider
final selectedIndexProvider = StateProvider<int>((ref) => -1);

class myLearningPage extends ConsumerWidget {
  const myLearningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('myLearning')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // 自定义选择按钮
            SelectableOutlinedButton(
              isSelected: selectedIndex == 0,
              icon: Icons.chat,
              label: "Custom Style",
              onPressed: () {
                ref.read(selectedIndexProvider.notifier).state = 0;
              },
              selectedBackgroundColor: Colors.black,
              unselectedBackgroundColor: Colors.grey.shade200,
              selectedTextColor: Colors.yellow,
              unselectedTextColor: Colors.black,
              selectedIconColor: Colors.yellow,
              unselectedIconColor: Colors.black45,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              borderSide: const BorderSide(color: Colors.black),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => context.push('/login'),
              child: const Text('Go to login'),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () => context.push('/flutter-learning'),
              child: const Text('Go to flutter-learning'),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () => context.push('/selection-page'),
              child: const Text('Go to selection-page'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 可选按钮组件封装
class SelectableOutlinedButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final TextStyle textStyle;
  final BorderSide borderSide;

  const SelectableOutlinedButton({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.selectedBackgroundColor,
    required this.unselectedBackgroundColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.selectedIconColor,
    required this.unselectedIconColor,
    required this.textStyle,
    required this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        backgroundColor:
            isSelected ? selectedBackgroundColor : unselectedBackgroundColor,
        side: borderSide,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: isSelected ? selectedIconColor : unselectedIconColor,
      ),
      label: Text(
        label,
        style: textStyle.copyWith(
          color: isSelected ? selectedTextColor : unselectedTextColor,
        ),
      ),
    );
  }
}
