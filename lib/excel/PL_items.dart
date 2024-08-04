class Accounts {
  Accounts._();

  // 積算根拠と月の行
  static const List<String> titles = [
    '---',
    '1月',
    '2月',
    '3月',
    '4月',
    '5月',
    '6月',
    '7月',
    '8月',
    '9月',
    '10月',
    '11月',
    '12月',
  ];

  // 売上高の行 --
  static const List<String> sales = ['B7', '売上高', '#F7C7AC'];

  // 売上原価の行 --
  static const List<String> costOfSales = ['B16', '売上原価', '#CAEDFB'];

  // 売上総利益の行
  static const List<String> grossProfit = ['B23', '売上総利益', '#FFDD95'];

  // 販売費及び一般管理費の行 --
  static const List<String> operatingCost = ['B24', '販売費及び一般管理費', '#CAEDFB'];

  // 営業利益の行
  static const List<String> operatingProfit = ['B57', '営業利益', '#FFDD95'];

  // 営業外収益の行 --
  static const List<String> nonOperatingIncome = ['B58', '営業外収益', '#F7C7AC'];

  // 営業外費用の行 --
  static const List<String> nonOperatingExpenses = ['B63', '営業外費用', '#CAEDFB'];

  // 経常利益の行
  static const List<String> ordinaryProfit = ['B65', '経常利益', '#FFDD95'];

  // 特別利益の行 --
  static const List<String> extraordinaryIncome = ['B66', '特別利益', '#F7C7AC'];

  // 特別損失の行 --
  static const List<String> extraordinaryLoss = ['B67', '特別損失', '#CAEDFB'];

  // 税引前当期純利益の行
  static const List<String> netProfitBeforeTaxes = [
    'B68',
    '税引前当期純利益',
    '#FFDD95'
  ];

  // 法人税の行
  static const List<String> taxes = ['B69', '法人税', '#CAEDFB'];

  // 当期純利益の行
  static const List<String> netProfit = ['B70', '当期純利益', '#FFDD95'];
}
