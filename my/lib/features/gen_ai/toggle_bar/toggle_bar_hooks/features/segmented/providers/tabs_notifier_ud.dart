import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/tabs_state.dart';

class TabsNotifier extends Notifier<TabsState> {
  @override
  TabsState build() {
    return const TabsState(
      tabs: ['強化', 'スロット再強化', '売却'],
      index: 0,
    );
  }

  void select(int i) {
    if (state.tabs.isEmpty) return;
    final newIndex = i.clamp(0, state.tabs.length - 1);
    state = state.copyWith(index: newIndex);
  }

  void nextLoop() {
    if (state.tabs.isEmpty) return;
    final newIndex = (state.index + 1) % state.tabs.length;
    state = state.copyWith(index: newIndex);
  }

  void prevLoop() {
    if (state.tabs.isEmpty) return;
    final newIndex = (state.index - 1 + state.tabs.length) % state.tabs.length;
    state = state.copyWith(index: newIndex);
  }

  void addTab(String name) {
    final newTabs = [...state.tabs, name];
    state = state.copyWith(tabs: newTabs, index: newTabs.length - 1);
  }

  void removeTab(int i) {
    if (i < 0 || i >= state.tabs.length) return;
    final newTabs = [...state.tabs]..removeAt(i);
    int newIndex = state.index;
    if (newTabs.isEmpty) {
      newIndex = 0;
    } else if (newIndex >= newTabs.length) {
      newIndex = newTabs.length - 1;
    }
    state = TabsState(tabs: newTabs, index: newIndex);
  }
}

final tabsProvider =
    NotifierProvider<TabsNotifier, TabsState>(TabsNotifier.new);
