import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/tabs_notifier_ud.dart';
import '../widgets/tab_enhance.dart';
import '../widgets/tab_rein_force.dart';
import '../widgets/tab_sell.dart';

class SegmentedTabsView extends HookConsumerWidget {
  const SegmentedTabsView({super.key});

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
          // 顶部 Segmented 控件
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.grey.shade200,
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

          // 内容区
          Expanded(
            child: IndexedStack(
              index: tabsState.index,
              children: [
                const TabEnhance(), // 強化
                const TabReinforce(), // スロット再強化
                const TabSell(), // 売却
              ],
            ),
          ),
        ],
      ),
    );
  }
}
