import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/selectable_button_group.dart';

class myLearningPage_V100 extends ConsumerWidget {
  const myLearningPage_V100({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Group + Animation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Text(
              '请选择你感兴趣的内容',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SelectableButtonGroup(),
            ),
          ],
        ),
      ),
    );
  }
}
