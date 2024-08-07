import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../assets/color_set.dart';

import '../providers/extraordinary_income_items_provider.dart';
import '../items/extraordinary_income_items.dart';

class ExtraordinaryIncomeItemsButton extends ConsumerStatefulWidget {
  const ExtraordinaryIncomeItemsButton({super.key});

  @override
  ConsumerState<ExtraordinaryIncomeItemsButton> createState() =>
      OperatingCostItemsButtonState();
}

class OperatingCostItemsButtonState
    extends ConsumerState<ExtraordinaryIncomeItemsButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final selectedItems = ref.watch(extraordinaryIncomeItemsProvider);
    final notifier = ref.read(extraordinaryIncomeItemsProvider.notifier);

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, // 横に5列
              mainAxisSpacing: 12.0, // 縦の間隔を広げる
              crossAxisSpacing: 12.0, // 横の間隔を広げる
              childAspectRatio: 1.0, // 正方形
            ),
            padding: const EdgeInsets.all(4.0), // 全体のパディング
            itemCount: extraordinaryIncomeItems.length +
                1, // リストの項目数 + 1 for text field
            itemBuilder: (context, index) {
              // 最後のアイテムをテキストフィールドにする
              if (index == extraordinaryIncomeItems.length) {
                return const TextField(
                  cursorColor: ColorSet.outlineColor,
                  cursorWidth: 1.0,
                  decoration: InputDecoration(
                    labelText: "その他",
                    labelStyle: TextStyle(color: ColorSet.outlineColor),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorSet.outlineColor, // ボーダーの色を白に設定
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorSet.outlineColor)),
                  ), // ボーダーの色を白に設定            ),
                );
              } else {
                String itemKey = extraordinaryIncomeItems.keys.elementAt(index);
                bool isSelected = selectedItems.contains(itemKey);

                return SizedBox(
                  height: 400,
                  width: 400,
                  child: MouseRegion(
                    onEnter: (_) => setState(() => isHovered = true),
                    onExit: (_) => setState(() => isHovered = false),
                    child: Tooltip(
                      verticalOffset: 100,
                      message: extraordinaryIncomeItems[itemKey],
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? ColorSet.selectedBackgroundColor
                              : ColorSet.unSelectedBackgroundColor,
                          padding: EdgeInsets.zero, // ボタン内のパディングを小さく
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // 四角形
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (isSelected) {
                              notifier.removeItem(itemKey);
                            } else {
                              notifier.addItem(itemKey);
                            }
                          });
                        },
                        child: Text(
                          itemKey,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected
                                ? ColorSet.selectedTextColor
                                : ColorSet.unSelectedTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
