import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';

class printReport {
  Future<void> ReportPrinttt() async {
    var excel = Excel.createExcel();
    // or
    //var excel = Excel.decodeBytes(bytes);

    ///
    ///
    /// reading excel file values
    ///
    ///
    for (var table in excel.tables.keys) {
      print(table);
      print(excel.tables[table]!.maxCols);
      print(excel.tables[table]!.maxRows);
      for (var row in excel.tables[table]!.rows) {
        print("${row.map((e) => e?.value)}");
      }
    }

    ///
    ///
    /// declaring a cellStyle object
    ///
    ///
    CellStyle cellStyle = CellStyle(
      bold: true,
      italic: true,
      textWrapping: TextWrapping.WrapText,
      fontFamily: getFontFamily(FontFamily.Comic_Sans_MS),
      rotation: 0,
    );

    var sheet = excel['mySheet'];

    var cell = sheet.cell(CellIndex.indexByString("A1"));
    cell.value = "Heya How are you I am fine ok goood night";
    cell.cellStyle = cellStyle;

    var cell2 = sheet.cell(CellIndex.indexByString("E5"));
    cell2.value = "Heya How night";
    cell2.cellStyle = cellStyle;

    var colIterableSheet = excel['ColumnIterables'];

    var colIterables = ['A', 'B', 'C', 'D', 'E'];
    int colIndex = 0;

    colIterables.forEach((colValue) {
      colIterableSheet.cell(CellIndex.indexByColumnRow(
        rowIndex: colIterableSheet.maxRows,
        columnIndex: colIndex,
      ))
        ..value = colValue;
    });

    // Saving the file

    String outputFile = "/Users/kawal/Desktop/git_projects/r.xlsx";
  }
}
