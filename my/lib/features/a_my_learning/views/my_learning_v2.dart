import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/selectable_button_group.dart';
import '../../../core/widgets/selectable_outlined_button_0713_v003.dart';

class myLearningPage_0713_v003 extends ConsumerWidget {
  const myLearningPage_0713_v003({super.key});

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
              child: const Text('Create an account'),
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
