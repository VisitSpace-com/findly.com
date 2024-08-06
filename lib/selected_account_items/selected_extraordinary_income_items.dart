import 'package:flutter/material.dart';

import '../providers/extraordinary_income_items_provider.dart';
import '../assets/color_set.dart';

class SelectedExtraordinaryIncomeItems extends StatefulWidget {
  const SelectedExtraordinaryIncomeItems(
      {super.key, required this.selectedAccountItems, required this.notifier});

  final List<String> selectedAccountItems;
  final ExtraordinaryIncomeItemsNotifier notifier;

  @override
  State<SelectedExtraordinaryIncomeItems> createState() =>
      _SelectedExtraordinaryIncomeItemsState();
}

class _SelectedExtraordinaryIncomeItemsState
    extends State<SelectedExtraordinaryIncomeItems> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      height: widget.selectedAccountItems.isEmpty
          ? 0
          : widget.selectedAccountItems.length * 48.0,
      child: ReorderableListView(
        primary: false,
        scrollController: _scrollController,
        padding: const EdgeInsets.only(right: 24, left: 24),
        children: widget.selectedAccountItems.map((item) {
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
                      widget.notifier.removeItem(item);
                    },
                  ),
                ),
                title: Text(item),
              ),
            ),
          );
        }).toList(),
        onReorder: (oldIndex, newIndex) {
          widget.notifier.moveItem(oldIndex, newIndex);
        },
      ),
    );
  }
}
