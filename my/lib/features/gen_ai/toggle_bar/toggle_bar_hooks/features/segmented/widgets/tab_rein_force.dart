import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TabReinforce extends HookWidget {
  const TabReinforce({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedSlot = useState<String?>(null);
    final slots = ['スロット1', 'スロット2', 'スロット3'];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('再強化するスロットを選んでください：'),
          Wrap(
            spacing: 8,
            children: slots.map((s) {
              return ChoiceChip(
                label: Text(s),
                selected: selectedSlot.value == s,
                onSelected: (_) => selectedSlot.value = s,
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: selectedSlot.value == null
                ? null
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${selectedSlot.value} を再強化しました')),
                    );
                  },
            child: const Text('再強化開始'),
          ),
        ],
      ),
    );
  }
}
