import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/tabs_notifier_ud.dart';

class SegmentedTabsPage extends HookConsumerWidget {
  const SegmentedTabsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsState = ref.watch(tabsProvider);
    final notifier = ref.read(tabsProvider.notifier);

    final scrollCtrl = useScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('フラグメント大強化祭'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // 顶部条：< SegmentedButton >
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  tooltip: '前へ（循环）',
                  onPressed:
                      tabsState.tabs.isNotEmpty ? notifier.prevLoop : null,
                  icon: const Icon(Icons.chevron_left),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollCtrl,
                    scrollDirection: Axis.horizontal,
                    child: tabsState.tabs.isEmpty
                        ? const Center(child: Text('タブがありません'))
                        : SegmentedButton<int>(
                            showSelectedIcon: false,
                            segments: List.generate(
                              tabsState.tabs.length,
                              (i) => ButtonSegment<int>(
                                value: i,
                                label: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(tabsState.tabs[i]),
                                ),
                              ),
                            ),
                            selected: {tabsState.index},
                            onSelectionChanged: (set) {
                              notifier.select(set.first);
                            },
                            style: ButtonStyle(
                              padding: const WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                              ),
                              backgroundColor:
                                  WidgetStateProperty.resolveWith<Color?>(
                                (states) =>
                                    states.contains(WidgetState.selected)
                                        ? Colors.orange
                                        : Colors.white,
                              ),
                              foregroundColor:
                                  const WidgetStatePropertyAll(Colors.black),
                              side:
                                  WidgetStateProperty.resolveWith<BorderSide?>(
                                (states) => BorderSide(
                                  color: states.contains(WidgetState.selected)
                                      ? Colors.orange.shade700
                                      : Colors.grey.shade400,
                                  width: states.contains(WidgetState.selected)
                                      ? 2
                                      : 1,
                                ),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              visualDensity: const VisualDensity(
                                  horizontal: -2, vertical: -2),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  tooltip: '次へ（循环）',
                  onPressed:
                      tabsState.tabs.isNotEmpty ? notifier.nextLoop : null,
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),

          // 内容区：IndexedStack 保持各页状态
          Expanded(
            child: tabsState.tabs.isEmpty
                ? const Center(child: Text('タブがありません'))
                : IndexedStack(
                    index: tabsState.index,
                    children: List.generate(
                      tabsState.tabs.length,
                      (i) => _TabContent(
                        index: i,
                        title: tabsState.tabs[i],
                      ),
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final n = tabsState.tabs.length + 1;
          notifier.addTab('タブ$n');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('新しいタブを追加しました：タブ$n')),
          );
        },
        label: const Text('Add Tab'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class _TabContent extends ConsumerWidget {
  final String title;
  final int index;
  const _TabContent({required this.title, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(tabsProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$title のページ：強化したいフラグメントを選んでください。',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  notifier.removeTab(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$title を削除しました')),
                  );
                },
                icon: const Icon(Icons.delete),
                label: const Text('このタブを削除'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
