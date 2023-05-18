import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';

import '../../constants/style.dart';

class NonCableReport extends StatefulWidget {
  const NonCableReport({super.key});

  @override
  State<NonCableReport> createState() => _NonCableReportState();
}

class _NonCableReportState extends State<NonCableReport> {
  String _date = "Select Date";
  List reportSparekits = [];

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataReportSpareKits();
    super.initState();
  }

  DataRow _resultsAPI(index, data) {
    return DataRow(
      cells: [
        DataCell(Text('${index + 1}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))),
        DataCell(Text('${data['location'] ?? "-"}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))),
        DataCell(Text('${data['item_name'] ?? "-"}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))),
        DataCell(Text('${data['part_number'] ?? "-"}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))),
        DataCell(Text('${data['serial_number'] ?? "-"}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))),
        DataCell(Text('${data['system'] ?? "-"}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))),
        DataCell(Text('${data['weight'] ?? "-"}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))),
        DataCell(Text('${data['qty'] ?? "-"}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))),
        DataCell(Text('${data['unit'] ?? "-"}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))),
        DataCell(Text('${data['remark'] ?? "-"}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))),
        DataCell(
          Center(
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 66.6,
                height: 28.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.6),
                    color: const Color(0xFFDDDDDD)),
                child: Center(
                  child: Text(
                    "Print",
                    style: GoogleFonts.roboto(
                      fontSize: 13.3,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ElevatedButton.icon(
              //     onPressed: () {
              //       DatePicker.showDatePicker(context, showTitleActions: true,
              //           onChanged: (date) {
              //         print('change $date');
              //       }, onConfirm: (date) {
              //         print('confirm $date');
              //         _date = '${date.year}/${date.month}/${date.day}';
              //         setState(() {});
              //       }, currentTime: DateTime.now(), locale: LocaleType.en);
              //     },
              //     icon: const Icon(Icons.date_range),
              //     label: Text(_date),
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: dark,
              //       // Background color
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.print),
                  label: const Text("Print All"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: active, // Background color
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable2(
                  columnSpacing: 6,
                  horizontalMargin: 6,
                  dataRowHeight: 40,
                  minWidth: 3000,
                  border: const TableBorder(
                      top: BorderSide(), bottom: BorderSide()),
                  columns: [
                    DataColumn2(
                      label: Text(
                        'No',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 46,
                    ),
                    DataColumn2(
                      label: Text(
                        'Location',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 95.25,
                    ),
                    DataColumn2(
                      label: Text(
                        'Item Name',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 200.25,
                    ),
                    DataColumn2(
                      label: Text(
                        'Part Number',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 155.25,
                    ),
                    DataColumn2(
                      label: Text(
                        'Serial Number',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 155.25,
                    ),
                    DataColumn2(
                      label: Text(
                        'System',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 115.25,
                    ),
                    DataColumn2(
                      label: Text(
                        """Weight
(Kg)""",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 115.25,
                    ),
                    DataColumn2(
                      label: Text(
                        "QTY",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 95.25,
                    ),
                    DataColumn2(
                      label: Text(
                        "Unit",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 95.25,
                    ),
                    DataColumn2(
                      label: Text(
                        "Remark",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 135.25,
                    ),
                    DataColumn2(
                      label: Text(
                        "",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 115.25,
                    ),
                  ],
                  rows: List.generate(reportSparekits.length,
                      (index) => _resultsAPI(index, reportSparekits[index]))),
            ),
          ),
        ],
      ),
    );
  }
}
