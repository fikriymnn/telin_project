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

class CableReport extends StatefulWidget {
  const CableReport({super.key});

  @override
  State<CableReport> createState() => _CableReportState();
}

class _CableReportState extends State<CableReport> {
  List reportCable = [];

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

  @override
  Widget build(BuildContext context) {
    final titleStyle = <int, TextStyle>{
      0: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      1: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      2: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      3: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      4: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      5: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      6: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      7: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      8: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      9: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      10: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      11: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      12: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    };
    return Scaffold(
      body: CommonDataTable(
        isSearchAble: true,
        sortColumn: [1],
        title: "Cable Report",
        titleBgColor: Colors.black,
        headingTextStyle: Map.of(titleStyle),
        titleStyle: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        heading: [
          'NO',
          'Label ID',
          'System',
          'Cable Type',
          'Manuacturer',
          'Armoring Type',
          'Core Type',
          '\u03A3 Core',
          """Length
(Meter)""",
          'Tank',
          'Count',
          'Remark',
          'Evidence'
        ],
        data: List.generate(
            reportCable.length,
            (index) => [
                  '${index + 1}',
                  'Lable ${index + 1} ',
                  '${reportCable[index]['system']}',
                  '${reportCable[index]['cable_type']}',
                  '${reportCable[index]['manufacturer']}',
                  '${reportCable[index]['armoring_type']}',
                  '${reportCable[index]['core_type']}',
                  '${reportCable[index]['sigma_core']}',
                  '${reportCable[index]['length_report']}',
                  '${reportCable[index]['tank']}',
                  '${reportCable[index]['count']}',
                  'Remark ${index + 1}',
                  'Evidence ${index + 1}'
                ]),
        headingAlign: {
          0: TblAlign.center,
          1: TblAlign.center,
        },
        dataAlign: {
          0: TblAlign.center,
        },
        disabledDeleteButtons: [1, 3, 5],
        disabledEditButtons: [0, 2, 4],
        dataTextStyle: (row) {
          if (row[0] != '0.') {
            return {
              0: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              1: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              2: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              3: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              4: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              5: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              6: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              7: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              8: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              9: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              10: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              11: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              12: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            };
          }
        },
        onExportExcel: (file) async {
          await launchUrl(Uri.file(file.path));
        },
        onExportPDF: (file) async {
          await launchUrl(Uri.file(file.path));
        },
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
