import 'dart:convert';
import 'dart:html' as html;

import 'package:csv/csv.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/inventory/exportPopUp.dart';
import 'package:telin_project/widgets/searchField.dart';

import '../order/loading/form/input_length_cable.dart';

class TableListview extends StatefulWidget {
  const TableListview({super.key});

  @override
  State<TableListview> createState() => _TableListviewState();
}

class _TableListviewState extends State<TableListview> {
  String? selectionSystem;
  String? selectionArmoringType;
  List system = [];
  List armoringType = [];
  List<DataTank> tank1 = [];
  List<DataTank> filterData = [];
  late List<DataTank> dataTable;

  TextEditingController filename = TextEditingController();

  TextEditingController lableSeach = TextEditingController();
  TextEditingController systemSearch = TextEditingController();
  TextEditingController armoringSearch = TextEditingController();
  TextEditingController cableTypeSearch = TextEditingController();
  TextEditingController manufactureSearch = TextEditingController();
  TextEditingController lengthSearch = TextEditingController();
  TextEditingController coreTypeSearch = TextEditingController();
  TextEditingController tankSearch = TextEditingController();
  TextEditingController tankLocationSearch = TextEditingController();
  TextEditingController tankLevelSearch = TextEditingController();

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataListview();
    getDataSystem();
    getDataArmoringType();

    super.initState();
  }

  void getDataListview() async {
    try {
      response = await dio.get(getListview);
      if (response!.statusCode == 200) {
        List<dynamic> jsonResponse = response!.data;
        List<DataTank> tank =
            jsonResponse.map((json) => DataTank.fromJson(json)).toList();
        setState(() {
          tank1 = tank;
          filterData = tank;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response!.statusMessage.toString()),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  void getDataArmoringType() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllArmoring);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          armoringType = response!.data['data'];
        });
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: '$msg',
            title: 'Peringatan',
            width: 400,
            confirmBtnColor: Colors.red);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  void getDataSystem() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllSystem);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          system = response!.data['data'];
        });
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: '$msg',
            title: 'Peringatan',
            width: 400,
            confirmBtnColor: Colors.red);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
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
          DataCell(Text("${index + 1}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].lable}",
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
          DataCell(Text("${filterData[index].tank ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].tankLocation ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text("${filterData[index].tankLevel ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
        ]);
  }

  void exportData() {
    try {
      String csv = const ListToCsvConverter().convert([
        [
          "LABEL ID",
          "SYSTEM",
          "ARMORING TYPE",
          "CABLE TYPE",
          "MANUFACTURER",
          "LENGTH (METER)",
          "CORE TYPE",
          "TANK",
          "TANK LOCATION",
          "TANK LEVEL"
        ],
        filterData
            .map((e) => {
                  e.lable,
                  e.system,
                  e.armoring,
                  e.cableType,
                  e.manufacture,
                  e.length,
                  e.coreType,
                  e.tank,
                  e.tankLocation,
                  e.tankLevel
                })
            .toList()
      ]);

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

    // try {
    //   String csvData = ListToCsvConverter().convert(
    //     filterData.map((e) => null).toList(),
    //   );
    //   print(csvData);

    //   // Unduh file CSV
    //   FileSaver.instance.saveFile(
    //       name: "tess.csv", filePath: csvData, mimeType: MimeType.csv);
    // } catch (e) {
    //   print(e);
    // }
    // Tulis data ke dalam file CSV
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () => {
                  print(
                      filterData.map((e) => {e.armoring, e.cableType}).toList())
                },
            child: Text("data")),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
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
                                text: 'Nama File Tidak Boleh Kosong',
                                width: 400,
                                confirmBtnColor: Colors.red);
                          } else {
                            exportData();
                          }
                        });
                  });
            },
            child: Container(
              width: 146,
              height: 33,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: active),
              child: Center(
                child: Text("EXPORT DATA",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: light)),
              ),
            ),
          ),
        ),
        Expanded(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        controller: lableSeach,
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
                  fixedWidth: 200,
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'TANK LOCATION',
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
                        controller: tankLocationSearch,
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
                        'TANK LEVEL',
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
                        controller: tankLevelSearch,
                        onChange: onSearchTextChanged,
                      )
                    ],
                  ),
                ),
              ],
              rows: List.generate(filterData.length,
                  (index) => _resultsAPI(index, filterData))),
        ),
      ],
    );
  }

  void onSearchTextChanged(String text) {
    setState(() {
      filterData = tank1
          .where((data) =>
              data.lable.toString().contains(lableSeach.text) &&
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
              data.tankLocation
                  .toString()
                  .toLowerCase()
                  .contains(tankLocationSearch.text.toLowerCase()) &&
              data.tankLevel
                  .toString()
                  .toLowerCase()
                  .contains(tankLevelSearch.text.toLowerCase()))
          .toList();
    });
  }
}

class DataTank {
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
  dynamic remark;
  dynamic deskription;

  DataTank(
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
      required this.remark,
      required this.deskription,
      required this.core});

  factory DataTank.fromJson(Map<String, dynamic> json) {
    return DataTank(
        armoring: json["armoring_type"],
        cableType: json["cable_type"],
        core: json["core"],
        coreType: json["core_type"],
        deskription: json["description"],
        lable: json["label_id"],
        length: json["length_report"],
        manufacture: json["manufacturer"],
        remark: json["remark"],
        system: json["system"],
        tank: json["tank"],
        tankLevel: json["tank_level"],
        tankLocation: json["tank_location"]);
  }
}
