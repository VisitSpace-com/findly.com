import 'package:flutter/material.dart';

class ColorSet {
  static const canvasColor = Color(0xFF2C2C2C);
  static const outlineColor = Color(0xFFFFFFFF);

  static const unSelectedBackgroundColor = Color(0xFFFFFFFF);
  static const selectedBackgroundColor = Color(0xFFB9F8D3);
  static const selectedTextColor = Color(0xFF101649);
  static const unSelectedTextColor = Color(0xFF101649);

  static const yourtoryNavy = Color(0xFF101649);
  static const cosmicLatte = Color(0xFFFFF8E7);
}

class Size {}

// String を引数にしない
enum AccountItems {
  salesItems(japaneseName: '売上高'),
  costOfSalesItems(japaneseName: '原価'),
  operatingCostItems(japaneseName: '販売費及び一般管理費'),
  nonOperatingIncomeItems(japaneseName: '営業外収益'),
  nonOperatingExpenseItems(japaneseName: '営業外費用'),
  extraordinaryIncomeItems(japaneseName: '特別利益'),
  extraordinaryExpenseItems(japaneseName: '特別損失');

  const AccountItems({required this.japaneseName});
  final String japaneseName;
}

// final values = AccountItems.values;

// final a = values
//     .map((e) => Column(
//           children: [
//             Text(e.japaneseName),
//           ],
//         ))
//     .toList();

// final b = Column(children: [...a]);
