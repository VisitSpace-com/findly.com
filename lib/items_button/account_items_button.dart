// import 'package:findly/items/operating_cost_items.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../assets/constants.dart';

// import '../providers/account_items_provider.dart';
// import '../providers/operating_cost_items_provider.dart';

// class AccountItemsButton extends ConsumerStatefulWidget {
//   const AccountItemsButton({super.key});

//   @override
//   ConsumerState<AccountItemsButton> createState() => AccountItemsButtonState();
// }

// class AccountItemsButtonState extends ConsumerState<AccountItemsButton> {
//   bool isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final selectedItems = ref.watch(accountItemsProvider());
//     final notifier = ref.read(AccountItemsNotifier.notifier);

//     return Column(
//       children: [
//         Expanded(
//           child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 5,
//               mainAxisSpacing: 12.0,
//               crossAxisSpacing: 12.0,
//               childAspectRatio: 1.0,
//             ),
//             padding: const EdgeInsets.all(4.0),
//             itemCount: operatingCostItems.length + 1,
//             itemBuilder: (context, index) {
//               if (index == operatingCostItems.length) {
//                 return const TextField(
//                   cursorColor: ColorSet.outlineColor,
//                   cursorWidth: 1.0,
//                   decoration: InputDecoration(
//                     labelText: "その他",
//                     labelStyle: TextStyle(color: ColorSet.outlineColor),
//                     border: OutlineInputBorder(),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: ColorSet.outlineColor, // ボーダーの色を白に設定
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: ColorSet.outlineColor),
//                     ),
//                   ),
//                 );
//               } else {
//                 String itemKey = operatingCostItems.keys.elementAt(index);
//                 bool isSelected = selectedItems.contains(itemKey);

//                 return SizedBox(
//                   height: 400,
//                   width: 400,
//                   child: MouseRegion(
//                     onEnter: (_) => setState(() => isHovered = true),
//                     onExit: (_) => setState(() => isHovered = false),
//                     child: Tooltip(
//                       verticalOffset: 100,
//                       message: operatingCostItems[itemKey],
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: isSelected
//                               ? ColorSet.selectedBackgroundColor
//                               : ColorSet.unSelectedBackgroundColor,
//                           padding: EdgeInsets.zero,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             if (isSelected) {
//                               notifier.removeItem(itemKey);
//                             } else {
//                               notifier.addItem(itemKey);
//                             }
//                           });
//                         },
//                         child: Text(
//                           itemKey,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: isSelected
//                                 ? ColorSet.selectedTextColor
//                                 : ColorSet.unSelectedTextColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
