import 'dart:convert';

import 'package:common_data_table/common_data_table.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;

class NonCableReport extends StatefulWidget {
  const NonCableReport({super.key});

  @override
  State<NonCableReport> createState() => _NonCableReportState();
}

class _NonCableReportState extends State<NonCableReport> {
  String _date = "Select Date";
  List reportSparekits = [1];

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataReportSpareKits();
    super.initState();
  }

  late PlutoGridStateManager stateManager;

  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'No',
      field: 'no',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Location',
      field: 'location',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Item Name',
      field: 'item_name',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Part Number',
      field: 'part_number',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Serial Number',
      field: 'serial_number',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'System',
      field: 'system',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Qty',
      field: 'qty',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Unit',
      field: 'unit',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
  ];
  void exportToPdf() async {
    final themeData = pluto_grid_export.ThemeData.withFont(
      base: pluto_grid_export.Font.ttf(
        await rootBundle.load('fonts/open_sans/OpenSans-Regular.ttf'),
      ),
      bold: pluto_grid_export.Font.ttf(
        await rootBundle.load('fonts/open_sans/OpenSans-Bold.ttf'),
      ),
    );

    var plutoGridPdfExport = pluto_grid_export.PlutoGridDefaultPdfExport(
      title: "Pluto Grid Sample pdf print",
      creator: "Pluto Grid Rocks!",
      format: pluto_grid_export.PdfPageFormat.a4.landscape,
      themeData: themeData,
    );

    await pluto_grid_export.Printing.sharePdf(
      bytes: await plutoGridPdfExport.export(stateManager),
      filename: plutoGridPdfExport.getFilename(),
    );
  }

  void exportToCsv() async {
    String title = "report_sparekit";

    var exported = const Utf8Encoder()
        .convert(pluto_grid_export.PlutoGridExport.exportCSV(stateManager));

    // // use file_saver from pub.dev
    await FileSaver.instance
        .saveFile(name: "$title", mimeType: MimeType.csv, bytes: exported);
  }

  void getDataReportSpareKits() async {
    try {
      response = await dio.get(getReportSpareKits);

      setState(() {
        reportSparekits = response!.data;
      });
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  InkWell(
                    onTap: exportToCsv,
                    child: Container(
                      width: 170.6,
                      height: 50.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.6),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.download,
                                size: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text("Export to CSV",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.3,
                                      color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: PlutoGrid(
                columns: columns,
                rows: List.generate(
                  reportSparekits.length,
                  (index) => PlutoRow(
                    cells: {
                      'no': PlutoCell(value: '${index + 1}'),
                      'location': PlutoCell(
                          value:
                              '${reportSparekits[index]['location'] == null ? "" : reportSparekits[index]['location']}'),
                      'item_name': PlutoCell(
                          value:
                              '${reportSparekits[index]['item_name'] == null ? "" : reportSparekits[index]['item_name']}'),
                      'part_number': PlutoCell(
                          value:
                              '${reportSparekits[index]['part_number'] == null ? "" : reportSparekits[index]['part_number']}'),
                      'serial_number': PlutoCell(
                          value:
                              '${reportSparekits[index]['serial_number'] == null ? "" : reportSparekits[index]['serial_number']}'),
                      'system': PlutoCell(
                          value:
                              '${reportSparekits[index]['system'] == null ? "" : reportSparekits[index]['system']}'),
                      'qty': PlutoCell(
                          value:
                              '${reportSparekits[index]['qty'] == null ? "" : reportSparekits[index]['qty']}'),
                      'unit': PlutoCell(
                          value:
                              '${reportSparekits[index]['unit'] == null ? "" : reportSparekits[index]['unit']}'),
                    },
                  ),
                ),
                onLoaded: (e) {
                  stateManager = e.stateManager;
                },
                configuration: const PlutoGridConfiguration(
                  enableMoveDownAfterSelecting: true,
                  enterKeyAction: PlutoGridEnterKeyAction.editingAndMoveDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
//     SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: ElevatedButton.icon(
//               //     onPressed: () {
//               //       DatePicker.showDatePicker(context, showTitleActions: true,
//               //           onChanged: (date) {
//               //         print('change $date');
//               //       }, onConfirm: (date) {
//               //         print('confirm $date');
//               //         _date = '${date.year}/${date.month}/${date.day}';
//               //         setState(() {});
//               //       }, currentTime: DateTime.now(), locale: LocaleType.en);
//               //     },
//               //     icon: const Icon(Icons.date_range),
//               //     label: Text(_date),
//               //     style: ElevatedButton.styleFrom(
//               //       backgroundColor: dark,
//               //       // Background color
//               //     ),
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.print),
//                   label: const Text("Print All"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: active, // Background color
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: DataTable2(
//                   columnSpacing: 6,
//                   horizontalMargin: 6,
//                   dataRowHeight: 40,
//                   minWidth: 3000,
//                   border: const TableBorder(
//                       top: BorderSide(), bottom: BorderSide()),
//                   columns: [
//                     DataColumn2(
//                       label: Text(
//                         'No',
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 46,
//                     ),
//                     DataColumn2(
//                       label: Text(
//                         'Location',
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 95.25,
//                     ),
//                     DataColumn2(
//                       label: Text(
//                         'Item Name',
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 200.25,
//                     ),
//                     DataColumn2(
//                       label: Text(
//                         'Part Number',
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 155.25,
//                     ),
//                     DataColumn2(
//                       label: Text(
//                         'Serial Number',
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 155.25,
//                     ),
//                     DataColumn2(
//                       label: Text(
//                         'System',
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 115.25,
//                     ),
//                     DataColumn2(
//                       label: Text(
//                         """Weight
// (Kg)""",
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 115.25,
//                     ),
//                     DataColumn2(
//                       label: Text(
//                         "QTY",
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 95.25,
//                     ),
//                     DataColumn2(
//                       label: Text(
//                         "Unit",
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 95.25,
//                     ),
//                     DataColumn2(
//                       label: Text(
//                         "Remark",
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 135.25,
//                     ),
//                     DataColumn2(
//                       label: Text(
//                         "",
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 115.25,
//                     ),
//                   ],
//                   rows: List.generate(reportSparekits.length,
//                       (index) => _resultsAPI(index, reportSparekits[index]))),
//             ),
//           ),
//         ],
//       ),
//     );
  }
}
