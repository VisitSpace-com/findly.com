import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/account_item_index_provider.dart';

import '../assets/constants.dart';

class AccountItemsBox extends ConsumerStatefulWidget {
  const AccountItemsBox({super.key});

  @override
  ConsumerState<AccountItemsBox> createState() => _AccountItemsBoxState();
}

class _AccountItemsBoxState extends ConsumerState<AccountItemsBox> {
  @override
  Widget build(BuildContext context) {
    final selectedAccountItemIndex =
        ref.watch(selectedAccountItemIndexProvider);

    final List<String> buttonLabels = [
      '売上高',
      '売上原価',
      '販売費及び一般管理費',
      '営業外収益',
      '営業外費用',
      '特別利益',
      '特別損失',
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width * 0.20,
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buttonLabels.asMap().entries.map((entry) {
          int idx = entry.key;
          String label = entry.value;
          bool isSelected = idx == selectedAccountItemIndex;
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected
                    ? ColorSet.selectedBackgroundColor
                    : ColorSet.unSelectedBackgroundColor,
              ),
              onPressed: () {
                setState(() {
                  ref.read(selectedAccountItemIndexProvider.notifier).state =
                      idx;
                });
              },
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? ColorSet.selectedTextColor
                      : ColorSet.unSelectedTextColor,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
