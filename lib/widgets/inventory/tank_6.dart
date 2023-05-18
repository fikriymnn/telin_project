import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';



class TableTank6 extends StatefulWidget {
  const TableTank6({super.key});

  @override
  State<TableTank6> createState() => _TableTank6State();
}

class _TableTank6State extends State<TableTank6> {
  String? selectionSystem;
  String? selectionArmoringType;
  List system = [];
  List armoringType = [];
  List tank6 = [];

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataTank6();
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
      DataCell(Text('',
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['system'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['armoring_type'] ?? "-"}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(Text("${data['cable_type'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['manufacturer'] ?? "-"}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(
          Text("${data['length_report'] ?? "-"}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(Text("${data['core_type'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['core'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['tank'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['tank_location'] ?? "-"}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(Text("${data['tank_level'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['remark'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['description'] ?? "-"}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              )))
    ]);
  }

  void getDataTank6() async {
    try {
      response = await dio.get(getTank6);

      setState(() {
        tank6 = response!.data;
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
      const DropdownMenuItem(value: "SYSTEM", child: Text("SYSTEM")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsArmoring {
    List<DropdownMenuItem<String>> menuItemsArmoring = [
      const DropdownMenuItem(value: "ARMORING TYPE", child: Text("ARMORING TYPE")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
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
                          value: system['_id'].toString(),
                          child: Text(
                            system['system'],
                            overflow: TextOverflow.ellipsis,
                          ),
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
                        value: armoringType['_id'].toString(),
                        child: Text(armoringType['armoring_type']),
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
              tank6.length, (index) => _resultsAPI(index, tank6[index]))),
    );
  }
}
