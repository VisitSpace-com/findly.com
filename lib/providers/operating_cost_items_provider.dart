import 'package:flutter_riverpod/flutter_riverpod.dart';

final operatingCostItemsProvider =
    StateNotifierProvider<OperatingCostItemsNotifier, List<String>>((ref) {
  return OperatingCostItemsNotifier();
});

class OperatingCostItemsNotifier extends StateNotifier<List<String>> {
  OperatingCostItemsNotifier() : super([]);

  void addItem(String item) {
    if (!state.contains(item)) {
      state = [...state, item];
    }
  }

  void removeItem(String item) {
    if (state.contains(item)) {
      state = state.where((element) => element != item).toList();
    }
  }

  void moveItem(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final items = List<String>.from(state);
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    state = items;
  }
}
