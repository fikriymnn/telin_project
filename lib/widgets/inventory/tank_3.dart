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

import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';

import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableTank3 extends StatefulWidget {
  const TableTank3({super.key});

  @override
  State<TableTank3> createState() => _TableTank3State();
}

class _TableTank3State extends State<TableTank3> {
  List tank3 = [];

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataTank3();
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

  void getDataTank3() async {
    try {
      response = await dio.get(getTank3);

      setState(() {
        tank3 = response!.data;
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

  List<DropdownMenuItem<String>> get dropdownItemsSystem {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("SYSTEM"), value: "SYSTEM"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
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
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValueSystem = newValue!;
                        });
                      },
                      value: selectedValueSystem,
                      items: dropdownItemsSystem),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValueArmoring = newValue!;
                        });
                      },
                      value: selectedValueArmoring,
                      items: dropdownItemsArmoring),
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
              tank3.length, (index) => _resultsAPI(index, tank3[index]))),
    );
  }
}
