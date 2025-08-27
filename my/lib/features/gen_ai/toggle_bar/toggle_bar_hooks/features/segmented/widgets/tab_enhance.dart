import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TabEnhance extends HookWidget {
  const TabEnhance({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedFragments = useState<List<String>>([]);

    final fragments = ['フラグメントA', 'フラグメントB', 'フラグメントC'];

    void toggleFragment(String f) {
      if (selectedFragments.value.contains(f)) {
        selectedFragments.value = List.from(selectedFragments.value)..remove(f);
      } else {
        selectedFragments.value = [...selectedFragments.value, f];
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('強化したいフラグメントを選択してください：'),
          Wrap(
            spacing: 8,
            children: fragments.map((f) {
              final selected = selectedFragments.value.contains(f);
              return FilterChip(
                label: Text(f),
                selected: selected,
                onSelected: (_) => toggleFragment(f),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: selectedFragments.value.isEmpty
                ? null
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              '強化しました：${selectedFragments.value.join(", ")}')),
                    );
                  },
            child: const Text('強化開始'),
          ),
        ],
      ),
    );
  }
}
