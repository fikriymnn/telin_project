import 'dart:math';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class printReport {
  Future<void> ReportPrinttt() async {
    final doc = pw.Document();
    final rnd = new Random();
    var value = rnd.nextInt(10000);
    doc.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Chart(title: pw.Text("kfcui"), grid: pw.PieGrid(), datasets: [])
          ];
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }
}
