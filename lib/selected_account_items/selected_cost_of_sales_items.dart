import 'package:flutter/material.dart';

import '../assets/color_set.dart';
import '../providers/cost_of_sales_items_provider.dart';

class SelectedCostOfSalesItems extends StatefulWidget {
  const SelectedCostOfSalesItems(
      {super.key, required this.selectedAccountItems, required this.notifier});

  final List<String> selectedAccountItems;
  final CostOfSalesItemsNotifier notifier;

  @override
  State<SelectedCostOfSalesItems> createState() =>
      _SelectedCostOfSalesItemsState();
}

class _SelectedCostOfSalesItemsState extends State<SelectedCostOfSalesItems> {
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
