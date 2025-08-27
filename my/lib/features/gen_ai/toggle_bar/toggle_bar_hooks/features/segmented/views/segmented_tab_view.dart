import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/tabs_notifier.dart';

class SegmentedTabView extends HookConsumerWidget {
  const SegmentedTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsState = ref.watch(tabsProvider);
    final notifier = ref.read(tabsProvider.notifier);

    // 让 SegmentedButton 水平可滚，tab 很多时也好用
    final scrollCtrl = useScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('フラグメント大強化祭'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // 顶部条：左 <  按钮 + 可滚动 SegmentedButton + 右 >
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
                  tooltip: '前へ',
                  onPressed: tabsState.index > 0 ? notifier.prev : null,
                  icon: const Icon(Icons.chevron_left),
                ),
                const SizedBox(width: 4),
                // 中间的 Segmented 控件可横向滚动
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollCtrl,
                    scrollDirection: Axis.horizontal,
                    child: SegmentedButton<int>(
                      showSelectedIcon: false,
                      segments: List.generate(
                        tabsState.tabs.length,
                        (i) => ButtonSegment<int>(
                          value: i,
                          label: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(tabsState.tabs[i]),
                          ),
                        ),
                      ),
                      selected: {tabsState.index},
                      onSelectionChanged: (set) {
                        notifier.select(set.first);
                      },
                      style: ButtonStyle(
                        // 高度 & 内边距
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        // 选中/未选中配色（接近截图：选中黄底，未选白底）
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>(
                          (states) => states.contains(WidgetState.selected)
                              ? Colors.orange
                              : Colors.white,
                        ),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.black),
                        side: WidgetStateProperty.resolveWith<BorderSide?>(
                          (states) => BorderSide(
                            color: states.contains(WidgetState.selected)
                                ? Colors.orange.shade700
                                : Colors.grey.shade400,
                            width:
                                states.contains(WidgetState.selected) ? 2 : 1,
                          ),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        visualDensity:
                            const VisualDensity(horizontal: -2, vertical: -2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  tooltip: '次へ',
                  onPressed: tabsState.index < tabsState.tabs.length - 1
                      ? notifier.next
                      : null,
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),

          // 内容区：IndexedStack 保持各页状态
          Expanded(
            child: IndexedStack(
              index: tabsState.index,
              children: List.generate(
                tabsState.tabs.length,
                (i) => _TabContent(
                  title: tabsState.tabs[i],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // 示例：动态新增一个 Tab
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

class _TabContent extends StatelessWidget {
  final String title;
  const _TabContent({required this.title});

  @override
  Widget build(BuildContext context) {
    // 这里可以替换成你的真实页面
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        child: Center(
          child: Text(
            '$title のページ：強化したいフラグメントを選んでください。',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
