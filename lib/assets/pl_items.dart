// String を引数にしない
enum PLItems {
  salesItems(japaneseName: '売上高'),
  costOfSalesItems(japaneseName: '原価'),
  operatingCostItems(japaneseName: '販売費及び一般管理費'),
  nonOperatingIncomeItems(japaneseName: '営業外収益'),
  nonOperatingExpenseItems(japaneseName: '営業外費用'),
  extraordinaryIncomeItems(japaneseName: '特別利益'),
  extraordinaryExpenseItems(japaneseName: '特別損失');

  const PLItems({required this.japaneseName});
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