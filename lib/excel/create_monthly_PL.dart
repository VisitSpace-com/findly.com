import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';

import '../excel/create_annual_PL.dart';
import '../excel/PL_items.dart';

Future<void> createMonthlyPL() async {
  // 新しいExcelドキュメントを作成
  final xlsio.Workbook workbook = xlsio.Workbook();

  // シート名を設定
  final xlsio.Worksheet monthlyPL = workbook.worksheets.add();
  monthlyPL.name = '月次損益';

  // 年次損益を作成
  createAnnualPL();

  // シート全体のフォントを設定
  final xlsio.Style style = workbook.styles.add('ArialStyle');
  style.fontName = 'Arial';
  style.fontSize = 12;

  //テキストを上下中央揃えにする
  style.vAlign = xlsio.VAlignType.center;

  // style を全てのセルに適用
  monthlyPL.getRangeByName('A1:Z1000').cellStyle = style;

  // 実績値
  final xlsio.Style pasts = monthlyPL.getRangeByName('H6:J6').cellStyle;
  pasts.backColor = '#C7C8CC';

  // 月を打ち込み
  final xlsio.Style months = monthlyPL.getRangeByName('B6:AN6').cellStyle;
  months.backColor = '#C7C8CC';
  months.hAlign = xlsio.HAlignType.center;
  for (int col = 1; col <= 12; col++) {
    monthlyPL.getRangeByIndex(6, 12 + col).setText(Accounts.titles[col]);
    monthlyPL.getRangeByIndex(6, 12 + col).cellStyle.borders.bottom.lineStyle =
        xlsio.LineStyle.thin;
    monthlyPL.getRangeByIndex(6, 12 + col).cellStyle.borders.all.color =
        '#000000';
  }

  // 各会計科目を設定
  final xlsio.Style netSalesRow = monthlyPL.getRangeByName('B7:AN7').cellStyle;
  netSalesRow.backColor = Accounts.sales[2];
  monthlyPL.getRangeByName(Accounts.sales[0]).setText(Accounts.sales[1]);

  final xlsio.Style costOfSalesRow =
      monthlyPL.getRangeByName('B16:AN16').cellStyle;
  costOfSalesRow.backColor = Accounts.costOfSales[2];
  monthlyPL
      .getRangeByName(Accounts.costOfSales[0])
      .setText(Accounts.costOfSales[1]);

  final xlsio.Style grossProfitRow =
      monthlyPL.getRangeByName('B23:AN23').cellStyle;
  grossProfitRow.backColor = Accounts.grossProfit[2];
  monthlyPL
      .getRangeByName(Accounts.grossProfit[0])
      .setText(Accounts.grossProfit[1]);
  monthlyPL.getRangeByIndex(23, 2, 23, 40).cellStyle.borders.top.lineStyle =
      xlsio.LineStyle.thin;
  monthlyPL.getRangeByIndex(23, 2, 23, 40).cellStyle.borders.bottom.lineStyle =
      xlsio.LineStyle.thin;
  monthlyPL.getRangeByIndex(23, 2, 23, 40).cellStyle.borders.all.color =
      '#000000';

  final xlsio.Style operatingCostRow =
      monthlyPL.getRangeByName('B24:AN24').cellStyle;
  operatingCostRow.backColor = Accounts.operatingCost[2];
  monthlyPL
      .getRangeByName(Accounts.operatingCost[0])
      .setText(Accounts.operatingCost[1]);

  final xlsio.Style operatingProfitRow =
      monthlyPL.getRangeByName('B57:AN57').cellStyle;
  operatingProfitRow.backColor = Accounts.operatingProfit[2];
  monthlyPL
      .getRangeByName(Accounts.operatingProfit[0])
      .setText(Accounts.operatingProfit[1]);
  monthlyPL.getRangeByIndex(57, 2, 57, 40).cellStyle.borders.top.lineStyle =
      xlsio.LineStyle.thin;
  monthlyPL.getRangeByIndex(57, 2, 57, 40).cellStyle.borders.bottom.lineStyle =
      xlsio.LineStyle.thin;
  monthlyPL.getRangeByIndex(57, 2, 57, 40).cellStyle.borders.all.color =
      '#000000';

  final xlsio.Style nonOperatingIncomeRow =
      monthlyPL.getRangeByName('B58:AN58').cellStyle;
  nonOperatingIncomeRow.backColor = Accounts.nonOperatingIncome[2];
  monthlyPL
      .getRangeByName(Accounts.nonOperatingIncome[0])
      .setText(Accounts.nonOperatingIncome[1]);

  final xlsio.Style nonOperatingExpensesRow =
      monthlyPL.getRangeByName('B63:AN63').cellStyle;
  nonOperatingExpensesRow.backColor = Accounts.nonOperatingExpenses[2];
  monthlyPL
      .getRangeByName(Accounts.nonOperatingExpenses[0])
      .setText(Accounts.nonOperatingExpenses[1]);

  final xlsio.Style ordinaryProfitRow =
      monthlyPL.getRangeByName('B65:AN65').cellStyle;
  ordinaryProfitRow.backColor = Accounts.ordinaryProfit[2];
  monthlyPL
      .getRangeByName(Accounts.ordinaryProfit[0])
      .setText(Accounts.ordinaryProfit[1]);
  monthlyPL.getRangeByIndex(65, 2, 65, 40).cellStyle.borders.top.lineStyle =
      xlsio.LineStyle.thin;
  monthlyPL.getRangeByIndex(65, 2, 65, 40).cellStyle.borders.bottom.lineStyle =
      xlsio.LineStyle.thin;
  monthlyPL.getRangeByIndex(65, 2, 65, 40).cellStyle.borders.all.color =
      '#000000';

  final xlsio.Style extraordinaryIncomeRow =
      monthlyPL.getRangeByName('B66:AN66').cellStyle;
  extraordinaryIncomeRow.backColor = Accounts.extraordinaryIncome[2];
  monthlyPL
      .getRangeByName(Accounts.extraordinaryIncome[0])
      .setText(Accounts.extraordinaryIncome[1]);

  final xlsio.Style extraordinaryLossRow =
      monthlyPL.getRangeByName('B67:AN67').cellStyle;
  extraordinaryLossRow.backColor = Accounts.extraordinaryLoss[2];
  monthlyPL
      .getRangeByName(Accounts.extraordinaryLoss[0])
      .setText(Accounts.extraordinaryLoss[1]);

  final xlsio.Style netProfitBeforeTaxesRow =
      monthlyPL.getRangeByName('B68:AN68').cellStyle;
  netProfitBeforeTaxesRow.backColor = Accounts.netProfitBeforeTaxes[2];
  monthlyPL
      .getRangeByName(Accounts.netProfitBeforeTaxes[0])
      .setText(Accounts.netProfitBeforeTaxes[1]);
  monthlyPL.getRangeByIndex(68, 2, 68, 40).cellStyle.borders.top.lineStyle =
      xlsio.LineStyle.thin;
  monthlyPL.getRangeByIndex(68, 2, 68, 40).cellStyle.borders.bottom.lineStyle =
      xlsio.LineStyle.thin;
  monthlyPL.getRangeByIndex(68, 2, 68, 40).cellStyle.borders.all.color =
      '#000000';

  final xlsio.Style taxesRow = monthlyPL.getRangeByName('B69:AN69').cellStyle;
  taxesRow.backColor = Accounts.taxes[2];
  monthlyPL.getRangeByName(Accounts.taxes[0]).setText(Accounts.taxes[1]);

  final xlsio.Style netProfitRow =
      monthlyPL.getRangeByName('B70:AN70').cellStyle;
  netProfitRow.backColor = Accounts.netProfit[2];
  monthlyPL
      .getRangeByName(Accounts.netProfit[0])
      .setText(Accounts.netProfit[1]);
  monthlyPL.getRangeByIndex(70, 2, 70, 40).cellStyle.borders.top.lineStyle =
      xlsio.LineStyle.thin;
  monthlyPL.getRangeByIndex(70, 2, 70, 40).cellStyle.borders.bottom.lineStyle =
      xlsio.LineStyle.thin;
  monthlyPL.getRangeByIndex(70, 2, 70, 40).cellStyle.borders.all.color =
      '#000000';

  // 数字に千円単位でカンマ（,）を入れる
  monthlyPL.getRangeByName('A1:Z1000').numberFormat = '#,##0';

  // マイナスの数字に対してテキストカラーを赤に設定
  final xlsio.ConditionalFormats conditions =
      monthlyPL.getRangeByName('A1:Z1000').conditionalFormats;
  final xlsio.ConditionalFormat condition = conditions.addCondition();
  condition.formatType = xlsio.ExcelCFType.cellValue;
  condition.operator = xlsio.ExcelComparisonOperator.less;
  condition.firstFormula = '0';
  condition.fontColor = '#FF0000';

  // 列の幅を設定
  for (int col = 2; col <= 4; col++) {
    monthlyPL.getRangeByIndex(1, 2, 1, col).columnWidth = 2.5;
  }

  // 行の高さを設定
  for (int row = 1; row <= monthlyPL.getLastRow(); row++) {
    monthlyPL
        .getRangeByIndex(row, 1, row, monthlyPL.getLastColumn())
        .rowHeight = 18;
  }

  // エクセルファイルをバイト配列に変換してファイルに書き込む
  final List<int> bytes = workbook.saveAsStream();

  // メモリを解放
  workbook.dispose();

  // ディレクトリの取得とファイルの保存
  if (kIsWeb) {
    AnchorElement(
        href:
            'data:application/octet-stream;charset=utf-16le;base64, ${base64.encode(bytes)}')
      ..setAttribute('download', 'Findly.com.${DateTime.now()}.xlsx')
      ..click();
  } else {
    final Directory directory = await getApplicationSupportDirectory();
    final String path = directory.path;
    final String fileName = Platform.isWindows
        ? '$path\\Findly.com.${DateTime.now()}.xlsx}'
        : '$path/Findly.com.${DateTime.now()}.xlsx';
    final File file = File(fileName);
    file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }
}
