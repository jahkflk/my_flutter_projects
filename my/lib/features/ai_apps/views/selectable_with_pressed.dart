import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/selectable_outlined_button_with_pressed.dart';

final selectedButtonIndexProvider = StateProvider<int>((ref) => -1);

class SelectableButtonWithPressDemo extends ConsumerWidget {
  const SelectableButtonWithPressDemo({super.key});

  Future<void> _showCupertinoDialog(BuildContext context, WidgetRef ref) async {
    await showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Apple Style Dialog'),
        content: const Text('Do you want to continue?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          CupertinoDialogAction(
            child: const Text('OK'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );

    // Reset the pressed state after dialog closes
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(selectedButtonIndexProvider.notifier).state = -1;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedButtonIndexProvider);

    final buttonData = [
      ('Login', Icons.login),
      ('Sign Up', Icons.person_add),
      ('Help', Icons.help_outline),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('iOS Style Dialog + Button Press')),
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
                isSelected: false,
                isPressedOverride: selectedIndex == index,
                icon: icon,
                label: label,
                onPressed: () {
                  ref.read(selectedButtonIndexProvider.notifier).state = index;
                  _showCupertinoDialog(context, ref);
                },
                selectedBackgroundColor: Colors.blue.shade900,
                unselectedBackgroundColor: Colors.white,
                pressedBackgroundColor: Colors.blue.shade900,
                selectedTextColor: Colors.white,
                unselectedTextColor: Colors.black87,
                pressedTextColor: Colors.white,
                selectedIconColor: Colors.white,
                unselectedIconColor: Colors.black54,
                pressedIconColor: Colors.white,
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
