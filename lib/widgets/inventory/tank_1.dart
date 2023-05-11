import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_armoring_type.dart';
import 'package:telin_project/widgets/order/loading/form/input_length_cable.dart';
import 'package:http/http.dart' as http;

import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';

import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableTank1 extends StatefulWidget {
  const TableTank1({super.key});

  @override
  State<TableTank1> createState() => _TableTank1State();
}

class _TableTank1State extends State<TableTank1> {
  late Future<List<DataTank>> dataTank;

  static Future<List<DataTank>> getDataTank() async {
    String url = getTank1;
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    return body.map<DataTank>(DataTank.fromJson).toList();
  }

  String? selectionSystem;
  String? selectionArmoringType;
  List system = [];
  List armoringType = [];
  List tank1 = [];
  late List<DataTank> dataTable;

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    dataTank = getDataTank();
    getDataTank1();
    getDataSystem();
    getDataArmoringType();

    super.initState();
  }

  DataRow _resultsAPI(index, data) {
    return DataRow(cells: [
      DataCell(Text("${index + 1}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${''}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['system'] == null ? "-" : data['system']}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['armoring_type'] == null ? "-" : data['armoring_type']}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(Text("${data['cable_type'] == null ? "-" : data['cable_type']}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['manufacturer'] == null ? "-" : data['manufacturer']}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(
          Text("${data['length_report'] == null ? "-" : data['length_report']}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(Text("${data['core_type'] == null ? "-" : data['core_type']}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['core'] == null ? "-" : data['core']}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['tank'] == null ? "-" : data['tank']}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['tank_location'] == null ? "-" : data['tank_location']}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(Text("${data['tank_level'] == null ? "-" : data['tank_level']}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['remark'] == null ? "-" : data['remark']}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['description'] == null ? "-" : data['description']}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              )))
    ]);
  }

  void getDataTank1() async {
    try {
      response = await dio.get(getTank1);

      setState(() {
        tank1 = response!.data;
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
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
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
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }

  List<DropdownMenuItem<String>> get dropdownItemsSystem {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("SYSTEM"), value: "SYSTEM"),
    ];

    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsArmoring {
    List<DropdownMenuItem<String>> menuItemsArmoring = [
      DropdownMenuItem(child: Text("ARMORING TYPE"), value: "ARMORING TYPE"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsArmoring;
  }

  String selectedValueSystem = "SYSTEM";
  String selectedValueArmoring = "ARMORING TYPE";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DataTable2(
          columnSpacing: 6,
          horizontalMargin: 6,
          dataRowHeight: 30,
          showBottomBorder: false,
          minWidth: 3000,
          columns: [
            DataColumn2(
                label: Text(
                  'NO',
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 50),
            DataColumn2(
                label: Text(
                  'LABLE',
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      isExpanded: true,
                      hint: Text(
                        "SYSTEM",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectionSystem = newValue!;
                        });
                      },
                      value: selectionSystem,
                      items: system.map((system) {
                        return DropdownMenuItem(
                          child: Text(
                            system['system'],
                            overflow: TextOverflow.ellipsis,
                          ),
                          value: system['_id'].toString(),
                        );
                      }).toList()),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text(
                      "ARMORING TYPE",
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectionArmoringType = newValue!;
                      });
                    },
                    value: selectionArmoringType,
                    items: armoringType.map((armoringType) {
                      return DropdownMenuItem(
                        child: Text(armoringType['armoring_type']),
                        value: armoringType['_id'].toString(),
                      );
                    }).toList(),
                  ),
                ),
                fixedWidth: 120),
            DataColumn2(
                label: Text(
                  "CABLE TYPE",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: Text(
                  "MANUFACTURE",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: Text(
                  """LENGTH
      (METER)
              """,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: Text(
                  "CORE TYPE",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: Text(
                  "\u03A3 CORE",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 90),
            DataColumn2(
                label: Text(
                  "TANK",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 50),
            DataColumn2(
                label: Text(
                  """TANK
      LOCATION""",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 60),
            DataColumn2(
                label: Text(
                  "TANK LEVEL",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: Text(
                  "REMARK",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 150),
            DataColumn2(
                label: Text(
                  "DESKRIPTION",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 80),
          ],
          rows: List.generate(
              tank1.length, (index) => _resultsAPI(index, tank1[index]))),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class DataTank {
  String lable;
  String system;
  String armoring;
  String cableType;
  String manufacture;
  String length;
  String coreType;
  String core;
  String tank;
  String tankLocation;
  String tankLevel;
  String remark;
  String deskription;

  DataTank(
      {required this.lable,
      required this.system,
      required this.armoring,
      required this.cableType,
      required this.manufacture,
      required this.length,
      required this.coreType,
      required this.tank,
      required this.tankLocation,
      required this.tankLevel,
      required this.remark,
      required this.deskription,
      required this.core});

  static DataTank fromJson(json) => DataTank(
      lable: json['lable'],
      system: json['system'],
      armoring: json['armoring_type'],
      cableType: json['cable_type'],
      manufacture: json['manufacture'],
      length: json['length'],
      coreType: json['core_type'],
      tank: json['tank'],
      tankLocation: json['tank_location'],
      tankLevel: json['tank_level'],
      remark: json['remark'],
      deskription: json['description'],
      core: json['core']);
}

class getData {
  var data = [];
  String feachurl = getTank1;
  getDataTank1() async {
    var url = Uri.parse(feachurl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
    }
  }
}
