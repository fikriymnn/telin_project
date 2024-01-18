import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;

import 'package:common_data_table/common_data_table.dart';
import 'package:csv/csv.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/inventory/exportPopUp.dart';
import 'package:telin_project/widgets/report/print_report.dart';
import 'package:telin_project/widgets/searchField.dart';
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

  String? selectionSystem;
  String? selectionArmoringType;
  List system = [];
  List armoringType = [];
  List<DataCableReport> cableReport = [];
  List<DataCableReport> filterData = [];
  late List<DataCableReport> dataTable;

  TextEditingController filename = TextEditingController();

  TextEditingController lableSearch = TextEditingController();
  TextEditingController systemSearch = TextEditingController();
  TextEditingController armoringSearch = TextEditingController();
  TextEditingController cableTypeSearch = TextEditingController();
  TextEditingController manufactureSearch = TextEditingController();
  TextEditingController lengthSearch = TextEditingController();
  TextEditingController coreTypeSearch = TextEditingController();
  TextEditingController tankSearch = TextEditingController();
  TextEditingController EcoreSearch = TextEditingController();
  TextEditingController countSearch = TextEditingController();

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

      if (response!.statusCode == 200) {
        List<dynamic> jsonResponse = response!.data;
        List<DataCableReport> report =
            jsonResponse.map((json) => DataCableReport.fromJson(json)).toList();
        setState(() {
          cableReport = report;
          filterData = report;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response!.statusMessage.toString()),
        ));
      }

      // setState(() {
      //   reportCable = response!.data;
      // });
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

  void onSearchTextChanged(String text) {
    setState(() {
      filterData = cableReport
          .where((data) =>
              data.lable.toString().contains(lableSearch.text) &&
              data.system
                  .toString()
                  .toLowerCase()
                  .contains(systemSearch.text.toLowerCase()) &&
              data.armoring
                  .toString()
                  .toLowerCase()
                  .contains(armoringSearch.text.toLowerCase()) &&
              data.cableType
                  .toString()
                  .toLowerCase()
                  .contains(cableTypeSearch.text.toLowerCase()) &&
              data.manufacture
                  .toString()
                  .toLowerCase()
                  .contains(manufactureSearch.text.toLowerCase()) &&
              data.length
                  .toString()
                  .toLowerCase()
                  .contains(lengthSearch.text.toLowerCase()) &&
              data.coreType
                  .toString()
                  .toLowerCase()
                  .contains(coreTypeSearch.text.toLowerCase()) &&
              data.tank
                  .toString()
                  .toLowerCase()
                  .contains(tankSearch.text.toLowerCase()) &&
              data.core
                  .toString()
                  .toLowerCase()
                  .contains(EcoreSearch.text.toLowerCase()) &&
              data.count
                  .toString()
                  .toLowerCase()
                  .contains(countSearch.text.toLowerCase()))
          .toList();
    });
  }

  DataRow _resultsAPI(index, data) {
    bool id;
    if ((index + 1) % 2 == 1) {
      id = true;
    } else {
      id = false;
    }

    return DataRow(
        color: MaterialStatePropertyAll(id == false ? activeTable : light),
        cells: [
          DataCell(Center(
            child: Text("${index + 1}",
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                )),
          )),
          DataCell(Text(filterData[index].lable.join(", "),
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].system ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].armoring ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].cableType ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].manufacture ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].length.toString() ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].coreType ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].core ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].tank ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].count ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
        ]);
  }

  void exportData(
    List<DataCableReport> data,
  ) {
    try {
      // Membuat list dari list of rows (data model)
      List<List<dynamic>> rows = [
        [
          'LABEL ID',
          'SYSTEM',
          'ARMORING TYPE',
          'CABLE TYPE',
          'MANUFACTURER',
          'LENGTH (METER)',
          'CORE TYPE',
          'Σ CORE',
          'TANK',
          'COUNT',
        ],
        ...data.map((cable) => cable.toList())
      ];

      String csv = const ListToCsvConverter().convert(rows);

      final fileName = '${filename.text}.csv';

      final blob = html.Blob([csv]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..target = 'download'
        ..download = fileName
        ..click();

      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print('Error exporting to CSV: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.3),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("CABLE REPORT",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.black)),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierColor: Colors.black.withOpacity(0.50),
                              builder: (BuildContext context) {
                                return ExportDataPopUp(
                                    controller: filename,
                                    export: () {
                                      if (filename.text == '') {
                                        QuickAlert.show(
                                            context: context,
                                            type: QuickAlertType.error,
                                            title: 'Peringatan',
                                            text:
                                                'Nama File Tidak Boleh Kosong',
                                            width: 400,
                                            confirmBtnColor: Colors.red);
                                      } else {
                                        exportData(filterData);
                                        Navigator.of(context,
                                                rootNavigator: false)
                                            .pop();
                                      }
                                    });
                              });
                        },
                        child: Container(
                          width: 148,
                          height: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: active),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.download,
                                  color: light,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("EXPORT TO CSV",
                                    style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: light))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: light, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: DataTable2(
                      columnSpacing: 0,
                      horizontalMargin: 0,
                      dataRowHeight: 52,
                      minWidth: 2070,
                      headingRowHeight: 75,
                      columns: [
                        DataColumn2(
                          fixedWidth: 77,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'NO',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                height: 40,
                                color: activeTable,
                              )
                            ],
                          ),
                        ),
                        DataColumn2(
                          fixedWidth: 160,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'LABLE',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              BuildSearchField(
                                controller: lableSearch,
                                onChange: onSearchTextChanged,
                              )
                            ],
                          ),
                        ),
                        DataColumn2(
                          fixedWidth: 200,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'SYSTEM',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              BuildSearchField(
                                controller: systemSearch,
                                onChange: onSearchTextChanged,
                              )
                            ],
                          ),
                        ),
                        DataColumn2(
                          fixedWidth: 200,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'ARMORING TYPE',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              BuildSearchField(
                                controller: armoringSearch,
                                onChange: onSearchTextChanged,
                              )
                            ],
                          ),
                        ),
                        DataColumn2(
                          fixedWidth: 200,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'CABLE TYPE',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              BuildSearchField(
                                controller: cableTypeSearch,
                                onChange: onSearchTextChanged,
                              )
                            ],
                          ),
                        ),
                        DataColumn2(
                          fixedWidth: 200,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'MANUFACTURER',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              BuildSearchField(
                                controller: manufactureSearch,
                                onChange: onSearchTextChanged,
                              )
                            ],
                          ),
                        ),
                        DataColumn2(
                          fixedWidth: 200,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'LENGTH (METER)',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              BuildSearchField(
                                controller: lengthSearch,
                                onChange: onSearchTextChanged,
                              )
                            ],
                          ),
                        ),
                        DataColumn2(
                          fixedWidth: 150,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'CORE TYPE',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              BuildSearchField(
                                controller: coreTypeSearch,
                                onChange: onSearchTextChanged,
                              )
                            ],
                          ),
                        ),
                        DataColumn2(
                          fixedWidth: 100,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Σ CORE',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              BuildSearchField(
                                controller: EcoreSearch,
                                onChange: onSearchTextChanged,
                              )
                            ],
                          ),
                        ),
                        DataColumn2(
                          fixedWidth: 150,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'TANK',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              BuildSearchField(
                                controller: tankSearch,
                                onChange: onSearchTextChanged,
                              )
                            ],
                          ),
                        ),
                        DataColumn2(
                          fixedWidth: 100,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'COUNT',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              BuildSearchField(
                                controller: countSearch,
                                onChange: onSearchTextChanged,
                              )
                            ],
                          ),
                        ),
                      ],
                      rows: List.generate(filterData.length,
                          (index) => _resultsAPI(index, filterData))),

                  // PlutoGrid(
                  //   columns: columns,
                  //   rows: List.generate(
                  //     reportCable.length,
                  //     (index) => PlutoRow(
                  //       cells: {
                  //         'no': PlutoCell(value: '${index + 1}'),
                  //         'system': PlutoCell(
                  //             value:
                  //                 '${reportCable[index]['system'] == null ? "" : reportCable[index]['system']}'),
                  //         'cable_type': PlutoCell(
                  //             value:
                  //                 '${reportCable[index]['cable_type'] == null ? "" : reportCable[index]['cable_type']}'),
                  //         'manufacturer': PlutoCell(
                  //             value:
                  //                 '${reportCable[index]['manufacturer'] == null ? "" : reportCable[index]['manufacturer']}'),
                  //         'armoring_type': PlutoCell(
                  //             value:
                  //                 '${reportCable[index]['armoring_type'] == null ? "" : reportCable[index]['armoring_type']}'),
                  //         'core_type': PlutoCell(
                  //             value:
                  //                 '${reportCable[index]['core_type'] == null ? "" : reportCable[index]['core_type']}'),
                  //         'core': PlutoCell(
                  //             value:
                  //                 '${reportCable[index]['sigma_core'] == null ? "" : reportCable[index]['sigma_core']}'),
                  //         'length': PlutoCell(
                  //             value:
                  //                 '${reportCable[index]['length_report'] == null ? "" : reportCable[index]['length_report']}'),
                  //         'tank': PlutoCell(
                  //             value:
                  //                 '${reportCable[index]['tank'] == null ? "" : reportCable[index]['tank']}'),
                  //         'count': PlutoCell(
                  //             value:
                  //                 '${reportCable[index]['count'] == null ? "" : reportCable[index]['count']}'),
                  //       },
                  //     ),
                  //   ),
                  //   onLoaded: (e) {
                  //     stateManager = e.stateManager;
                  //   },
                  //   configuration: const PlutoGridConfiguration(
                  //     enableMoveDownAfterSelecting: true,
                  //     enterKeyAction:
                  //         PlutoGridEnterKeyAction.editingAndMoveDown,
                  //   ),
                  // ),
                ),
              )

              // const SizedBox(
              //   height: 50,
              // ),
              // const Expanded(child: TableSystem())
            ],
          ),
        ),
      ),
    );
  }
}

class DataCableReport {
  dynamic lable;
  dynamic system;
  dynamic armoring;
  dynamic cableType;
  dynamic manufacture;
  dynamic length;
  dynamic coreType;
  dynamic core;
  dynamic tank;
  dynamic tankLocation;
  dynamic tankLevel;
  dynamic count;

  DataCableReport(
      {required this.lable,
      required this.system,
      required this.armoring,
      required this.cableType,
      required this.manufacture,
      required this.length,
      required this.coreType,
      required this.tank,
      required this.tankLevel,
      required this.tankLocation,
      required this.count,
      required this.core});

  factory DataCableReport.fromJson(Map<String, dynamic> json) {
    return DataCableReport(
        armoring: json["armoring_type"],
        cableType: json["cable_type"],
        core: json["sigma_core"],
        coreType: json["core_type"],
        lable: json["label_id"],
        length: json["length_report"],
        manufacture: json["manufacturer"],
        count: json["count"],
        system: json["system"],
        tank: json["tank"],
        tankLevel: json["tank_level"],
        tankLocation: json["tank_location"]);
  }

  List<dynamic> toList() => [
        lable.join(", "),
        system,
        armoring,
        cableType,
        manufacture,
        length,
        coreType,
        core,
        tank,
        count
      ];
}
