import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;

void createAnnualPL() {
  // 新しいExcelドキュメントを作成
  final xlsio.Workbook workbook = xlsio.Workbook();

  // シート名を設定
  final xlsio.Worksheet annualPL = workbook.worksheets[0];
  annualPL.name = '年次損益';

  // シート全体のフォントを設定
  final xlsio.Style style = workbook.styles.add('ArialStyle');
  style.fontName = 'Arial';
  style.fontSize = 12;

  //テキストを上下中央揃えにする
  style.vAlign = xlsio.VAlignType.center;

  // style を全てのセルに適用
  annualPL.getRangeByName('A1:Z1000').cellStyle = style;

  // 数字に千円単位でカンマ（,）を入れる
  annualPL.getRangeByName('A1:Z1000').numberFormat = '#,##0';

  // マイナスの数字に対してテキストカラーを赤に設定
  final xlsio.ConditionalFormats conditions =
      annualPL.getRangeByName('A1:Z1000').conditionalFormats;
  final xlsio.ConditionalFormat condition = conditions.addCondition();
  condition.formatType = xlsio.ExcelCFType.cellValue;
  condition.operator = xlsio.ExcelComparisonOperator.less;
  condition.firstFormula = '0';
  condition.fontColor = '#FF0000';

  // 行の高さを設定
  for (int row = 1; row <= annualPL.getLastRow(); row++) {
    annualPL.getRangeByIndex(row, 1, row, annualPL.getLastColumn()).rowHeight =
        18;
  }
}
