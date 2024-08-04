import 'package:findly/providers/account_items_provider.dart';
import 'package:flutter/material.dart';

import '../assets/constants.dart';

import '../providers/operating_cost_items_provider.dart';

Widget listSelectedAccountItems(List<String> selectedAccountItems,
    BuildContext context, OperatingCostItemsNotifier notifier) {
  final ScrollController _scrollController = ScrollController();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  });

  return SizedBox(
    height:
        selectedAccountItems.isEmpty ? 0 : selectedAccountItems.length * 48.0,
    child: ReorderableListView(
      primary: false,
      scrollController: _scrollController,
      padding: const EdgeInsets.only(right: 24, left: 24),
      children: selectedAccountItems.map((item) {
        return Material(
          key: ValueKey(item),
          elevation: 4.0,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: ColorSet.canvasColor,
              width: 0.5,
            )),
            child: ListTile(
              textColor: ColorSet.yourtoryNavy,
              tileColor: Colors.white,
              trailing: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.delete_outlined,
                    color: ColorSet.yourtoryNavy,
                  ),
                  onPressed: () {
                    notifier.removeItem(item);
                  },
                ),
              ),
              title: Text(item),
            ),
          ),
        );
      }).toList(),
      onReorder: (oldIndex, newIndex) {
        notifier.moveItem(oldIndex, newIndex);
      },
    ),
  );
}
