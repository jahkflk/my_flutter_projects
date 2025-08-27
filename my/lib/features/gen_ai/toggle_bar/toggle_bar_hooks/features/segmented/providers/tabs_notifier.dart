import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/tabs_state.dart';

class TabsNotifier extends Notifier<TabsState> {
  @override
  TabsState build() {
    // 未来只需在这里改 tabs 列表，就能动态增加/减少 tab
    return const TabsState(
      tabs: ['強化', 'スロット再強化', '売却'],
      index: 0,
    );
  }

  void select(int i) {
    if (i < 0 || i >= state.tabs.length) return;
    state = state.copyWith(index: i);
  }

  void prev() => select(state.index - 1);
  void next() => select(state.index + 1);

  void addTab(String name) =>
      state = state.copyWith(tabs: [...state.tabs, name]);
}

final tabsProvider =
    NotifierProvider<TabsNotifier, TabsState>(TabsNotifier.new);
