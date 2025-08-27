/// -------------------- Riverpod State --------------------
class TabsState {
  final List<String> tabs;
  final int index;
  const TabsState({required this.tabs, required this.index});

  TabsState copyWith({List<String>? tabs, int? index}) =>
      TabsState(tabs: tabs ?? this.tabs, index: index ?? this.index);
}
