import 'dart:io';
import 'package:path/path.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'dart:convert';
import 'dart:html';

class printReport {
  Future<void> ReportPrinttt() async {
    // Create a new Excel document.
    final Workbook workbook = new Workbook();
//Accessing worksheet via index.
    final Worksheet sheet = workbook.worksheets[0];

//Add Text.

    sheet.getRangeByName('A1').setText('No');
    sheet.getRangeByName('B1').setText('Lable ID');
    sheet.getRangeByName('C1').setText('System');
    sheet.getRangeByName('D1').setText('Cable Type');
    sheet.getRangeByName('E1').setText('Manufacturer');
    sheet.getRangeByName('F1').setText('Armoring Type');
    sheet.getRangeByName('G1').setText('Core Type');
    sheet.getRangeByName('H1').setText('Core');
    sheet.getRangeByName('I1').setText('Length (Meter)');
    sheet.getRangeByName('J1').setText('Tank');
    sheet.getRangeByName('K1').setText('Count');

// Save the document.
    final List<int> bytes = workbook.saveAsStream();

//Dispose the workbook.
    workbook.dispose();
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "output1.xlsx")
      ..click();
  }
}
