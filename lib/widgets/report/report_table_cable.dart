import 'dart:convert';
import 'dart:io';

import 'package:common_data_table/common_data_table.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/report/print_report.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;

class CableReport extends StatefulWidget {
  const CableReport({super.key});

  @override
  State<CableReport> createState() => _CableReportState();
}

class _CableReportState extends State<CableReport> {
  List reportCable = [1];

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataReportCable();
    super.initState();
  }

  void getDataReportCable() async {
    try {
      response = await dio.get(getReportCable);

      setState(() {
        reportCable = response!.data;
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

  late PlutoGridStateManager stateManager;

  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'No',
      field: 'no',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Lable Id',
      field: 'lable_id',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'System',
      field: 'system',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Cable Type',
      field: 'cable_type',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Manufacturer',
      field: 'manufacturer',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Armoring_Type',
      field: 'armoring_type',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Core Type',
      field: 'core_type',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: '\u03A3 Core',
      field: 'core',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Length(Meter)',
      field: 'length',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Tank',
      field: 'tank',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Count',
      field: 'count',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Remark',
      field: 'remark',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'Evidence',
      field: 'evidence',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
  ];
//  final List<PlutoRow> rows = [
//     PlutoRow(
//       cells: {
//         'column_1': PlutoCell(value: 'cell 1-1'),
//         'column_2': PlutoCell(value: 'cell 1-2'),
//         'column_3': PlutoCell(value: 'cell 1-3'),
//       },
//     ),
//     PlutoRow(
//       cells: {
//         'column_1': PlutoCell(value: 'cell 2-1'),
//         'column_2': PlutoCell(value: 'cell 2-2'),
//         'column_3': PlutoCell(value: 'cell 2-3'),
//       },
//     ),
//     PlutoRow(
//       cells: {
//         'column_1': PlutoCell(value: 'cell 3-1'),
//         'column_2': PlutoCell(value: 'cell 3-2'),
//         'column_3': PlutoCell(value: 'cell 3-3'),
//       },
//     ),
//   ];

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
    String title = "pluto_grid_export";

    var exported = const Utf8Encoder()
        .convert(pluto_grid_export.PlutoGridExport.exportCSV(stateManager));

    // // use file_saver from pub.dev
    await FileSaver.instance
        .saveFile(name: "$title", mimeType: MimeType.csv, bytes: exported);
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
                  TextButton(
                    onPressed: exportToPdf,
                    child: const Text('Export to PDF'),
                  ),
                  TextButton(
                    onPressed: exportToCsv,
                    child: const Text('Export to CSV'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PlutoGrid(
                columns: columns,
                rows: List.generate(
                  reportCable.length,
                  (index) => PlutoRow(
                    cells: {
                      'no': PlutoCell(value: '${index + 1}'),
                      'lable_id': PlutoCell(
                          value:
                              '${reportCable[index]['lable_id'] == null ? "" : reportCable[index]['lable_id']}'),
                      'system': PlutoCell(
                          value:
                              '${reportCable[index]['system'] == null ? "" : reportCable[index]['system']}'),
                      'cable_type': PlutoCell(
                          value:
                              '${reportCable[index]['cable_type'] == null ? "" : reportCable[index]['cable_type']}'),
                      'manufacturer': PlutoCell(
                          value:
                              '${reportCable[index]['manufacturer'] == null ? "" : reportCable[index]['manufacturer']}'),
                      'armoring_type': PlutoCell(
                          value:
                              '${reportCable[index]['armoring_type'] == null ? "" : reportCable[index]['armoring_type']}'),
                      'core_type': PlutoCell(
                          value:
                              '${reportCable[index]['core_type'] == null ? "" : reportCable[index]['core_type']}'),
                      'core': PlutoCell(
                          value:
                              '${reportCable[index]['sigma_core'] == null ? "" : reportCable[index]['sigma_core']}'),
                      'length': PlutoCell(
                          value:
                              '${reportCable[index]['length_report'] == null ? "" : reportCable[index]['length_report']}'),
                      'tank': PlutoCell(
                          value:
                              '${reportCable[index]['tank'] == null ? "" : reportCable[index]['tank']}'),
                      'count': PlutoCell(
                          value:
                              '${reportCable[index]['count'] == null ? "" : reportCable[index]['count']}'),
                      'remark': PlutoCell(
                          value:
                              '${reportCable[index]['remark'] == null ? "" : reportCable[index]['remark']}'),
                      'evidence': PlutoCell(
                          value:
                              '${reportCable[index]['evidence'] == null ? "" : reportCable[index]['evidence']}'),
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
  }
}











































// class CableReport extends StatefulWidget {
//   const CableReport({super.key});

//   @override
//   State<CableReport> createState() => _CableReportState();
// }

// class _CableReportState extends State<CableReport> {
//   String _from = "From";
//   String _to = "To";
//   List reportCable = [];

//   Response? response;

//   var dio = Dio();

//   @override
//   void initState() {
//     // TODO: implement initState
//     getDataReportCable();
//     super.initState();
//   }

//   DataRow _resultsAPI(index, data) {
//     return DataRow(
//       cells: [
//         DataCell(Text('${index + 1}',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('-',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('${data['system'] ?? "-"}',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('${data['cable_type'] ?? "-"}',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('${data['manufacturer'] ?? "-"}',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('${data['armoring_type'] ?? "-"}',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('${data['core_type'] ?? "-"}',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('${data['sigma_core'] ?? "-"}',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('${data['length_report'] ?? "-"}',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('${data['tank'] ?? "-"}',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('${data['count'] ?? "-"}',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('IGG-S14.5 # S146C01-3',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(Text('SCRAP',
//             style: GoogleFonts.montserrat(
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ))),
//         DataCell(
//           Center(
//             child: InkWell(
//               onTap: () {},
//               child: Container(
//                 width: 66.6,
//                 height: 28.6,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6.6),
//                     color: const Color(0xFFDDDDDD)),
//                 child: Center(
//                   child: Text(
//                     "Print",
//                     style: GoogleFonts.roboto(
//                       fontSize: 13.3,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   void getDataReportCable() async {
//     try {
//       response = await dio.get(getReportCable);

//       setState(() {
//         reportCable = response!.data;
//       });
//     } catch (e) {
//       QuickAlert.show(
//           context: context,
//           type: QuickAlertType.error,
//           text: 'Terjadi Kesalahan Pada Server Kami',
//           title: 'Peringatan',
//           width: 400,
//           confirmBtnColor: Colors.red);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
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
//               //         _from = '${date.year}/${date.month}/${date.day}';
//               //         setState(() {});
//               //       }, currentTime: DateTime.now(), locale: LocaleType.en);
//               //     },
//               //     icon: const Icon(Icons.date_range),
//               //     label: Text(_from),
//               //     style: ElevatedButton.styleFrom(
//               //       backgroundColor: dark,
//               //       // Background color
//               //     ),
//               //   ),
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: ElevatedButton.icon(
//               //     onPressed: () {
//               //       DatePicker.showDatePicker(context, showTitleActions: true,
//               //           onChanged: (date) {
//               //         print('change $date');
//               //       }, onConfirm: (date) {
//               //         print('confirm $date');
//               //         _to = '${date.year}/${date.month}/${date.day}';
//               //         setState(() {});
//               //       }, currentTime: DateTime.now(), locale: LocaleType.en);
//               //     },
//               //     icon: const Icon(Icons.date_range),
//               //     label: Text(_to),
//               //     style: ElevatedButton.styleFrom(
//               //       backgroundColor: dark,
//               //       // Background color
//               //     ),
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     printReport().ReportPrinttt();
//                   },
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
//                         'Label ID',
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
//                         'Cable Type',
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
//                         'Manuacturer',
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
//                         'Armoring Type',
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
//                         'Core Type',
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
//                         "\u03A3 Core",
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
//                         """Length
// (Meter)""",
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
//                         "Tank",
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
//                         "Count",
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
//                         "Remark",
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
//                         "Evidence",
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
//                         " ",
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       fixedWidth: 95.25,
//                     ),
//                   ],
//                   rows: List.generate(reportCable.length,
//                       (index) => _resultsAPI(index, reportCable[index]))),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
