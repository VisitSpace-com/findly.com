// import 'package:findly/items/operating_cost_items.dart';
// import 'package:findly/items_button/cost_of_sales_items_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../assets/pl_items.dart';

// やっぱfamilyでまとめたいね
//

final accountItemsProvider =
    StateNotifierProvider.family<AccountItemsNotifier, List<String>, PLItems>(
        (ref, plItems) {
  return AccountItemsNotifier(plItems);
});

class AccountItemsNotifier extends StateNotifier<List<String>> {
  AccountItemsNotifier(this.plItems) : super([]);

  final PLItems plItems;

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
    if (oldIndex < 0 ||
        oldIndex >= state.length ||
        newIndex < 0 ||
        newIndex >= state.length) {
      newIndex -= 1;
    }
    final items = List<String>.from(state);
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    state = items;
  }
}

// String を引数にしない
// enum Items {
//   operatingCostItems,
//   costOfSalesItems,
// }
