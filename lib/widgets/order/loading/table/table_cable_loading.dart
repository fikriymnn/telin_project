import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/form/input_length_cable.dart';

import '../../../../api/configAPI.dart';

class TableCableLoading extends StatefulWidget {
  const TableCableLoading({super.key, required this.loadingId});
  final String loadingId;

  @override
  State<TableCableLoading> createState() => _TableCableLoadingState();
}

class _TableCableLoadingState extends State<TableCableLoading> {
  late List<CableLoading> cableLoading;
  List<CableLoading> selectedRow = [];
  @override
  String? selectionSystem;
  String? selectionArmoringType;
  List system = [];
  List armoringType = [];
  List spareCable = [];

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataCable();
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
      DataCell(Text("${data['armoring_type'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['length_report'] ?? "-"}",
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
      DataCell(Text("${data['tank_location'] ?? "-"}",
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
      DataCell(TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return InputLengthCable(
                    idCable: data['_id'],
                    idLoading: widget.loadingId,
                  );
                });
          },
          child: Text("Take",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: active,
              ))))
    ]);
  }

  void getDataCable() async {
    try {
      response = await dio.get(getAllCable);

      setState(() {
        spareCable = response!.data;
      });
    } catch (e) {
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     text: 'Terjadi Kesalahan Pada Server Kami',
      //     title: 'Peringatan',
      //     width: 400,
      //     confirmBtnColor: Colors.red);
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
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     text: 'Terjadi Kesalahan Pada Server Kami',
      //     title: 'Peringatan',
      //     width: 400,
      //     confirmBtnColor: Colors.red);
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
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     text: 'Terjadi Kesalahan Pada Server Kami',
      //     title: 'Peringatan',
      //     width: 400,
      //     confirmBtnColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
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
      const DropdownMenuItem(
          value: "ARMORING TYPE", child: Text("ARMORING TYPE")),
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
                fixedWidth: 100),
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
                  "TANK LOCATION",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 50),
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
                  "ACTION",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 50),
          ],
          rows: List.generate(spareCable.length,
              (index) => _resultsAPI(index, spareCable[index]))),
    );
  }
}

class CableLoading {
  final String no,
      system,
      armoringType,
      length,
      lable,
      inner,
      outer,
      tankLevel,
      remark,
      coreType,
      core;

  const CableLoading({
    required this.no,
    required this.system,
    required this.armoringType,
    required this.length,
    required this.lable,
    required this.inner,
    required this.outer,
    required this.tankLevel,
    required this.remark,
    required this.coreType,
    required this.core,
  });

  static List<CableLoading> getCableLoading() {
    return <CableLoading>[
      const CableLoading(
          no: "1",
          system: "System",
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          remark: "remark",
          coreType: "core type",
          core: "core",
          tankLevel: "22"),
      const CableLoading(
          no: "2",
          system: "System",
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          remark: "remark",
          coreType: "core type",
          core: "core",
          tankLevel: "22"),
      const CableLoading(
          no: "3",
          system: "System",
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          remark: "remark",
          coreType: "core type",
          core: "core",
          tankLevel: "22"),
      const CableLoading(
          no: "4",
          system: "System",
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          remark: "remark",
          coreType: "core type",
          core: "core",
          tankLevel: "22"),
      const CableLoading(
          no: "5",
          system: "System",
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          remark: "remark",
          coreType: "core type",
          core: "core",
          tankLevel: "22"),
      const CableLoading(
          no: "6",
          system: "System",
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          remark: "remark",
          coreType: "core type",
          core: "core",
          tankLevel: "22"),
    ];
  }
}
