import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';

class TableRakA2 extends StatefulWidget {
  const TableRakA2({super.key});

  @override
  State<TableRakA2> createState() => _TableRakA2State();
}

class _TableRakA2State extends State<TableRakA2> {
  List rakA2 = [];
  late List<RakCoba> rakCoba;

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState

    getDataRakA2();
    super.initState();
  }

  DataRow _resultsAPI(index, data) {
    return DataRow(cells: [
      DataCell(Text("${data['no'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['rak_number'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['item_name'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['part_number'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['serial_number'] ?? "-"}",
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
      DataCell(Text("${data['weight_kg'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['qty'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['unit'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['description'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
    ]);
  }

  void getDataRakA2() async {
    try {
      response = await dio.get(getRak);

      setState(() {
        rakA2 = response!.data;
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
          dataRowHeight: 40,
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
                  'LOCATION',
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: Text(
                  'ITEM NAME',
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 300),
            DataColumn2(
                label: Text(
                  'PART NUMBER',
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: Text(
                  "SERIAL NUMBER",
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
                label: Text(
                  "WEIGHT (KG)",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: Text(
                  "QTY",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: Text(
                  "UNIT",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                fixedWidth: 100),
            DataColumn2(
                label: Center(
                  child: Text(
                    "DESCRIPTION",
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                fixedWidth: 250),
          ],
          rows:
              // RakCoba.fromJson(rakA2[1])
              //     .map((RakCoba) => DataRow(cells: [
              //           DataCell(Text("${RakCoba.no == null ? "-" : RakCoba.no}",
              //               style: GoogleFonts.montserrat(
              //                 fontSize: 10,
              //                 fontWeight: FontWeight.w400,
              //                 color: Colors.black,
              //               ))),
              //           DataCell(Text(
              //               "${RakCoba.location == null ? "-" : RakCoba.location}",
              //               style: GoogleFonts.montserrat(
              //                 fontSize: 10,
              //                 fontWeight: FontWeight.w400,
              //                 color: Colors.black,
              //               ))),
              //           DataCell(Text(
              //               "${RakCoba.itemName == null ? "-" : RakCoba.itemName}",
              //               style: GoogleFonts.montserrat(
              //                 fontSize: 10,
              //                 fontWeight: FontWeight.w400,
              //                 color: Colors.black,
              //               ))),
              //           DataCell(Text(
              //               "${RakCoba.partNumber == null ? "-" : RakCoba.partNumber}",
              //               style: GoogleFonts.montserrat(
              //                 fontSize: 10,
              //                 fontWeight: FontWeight.w400,
              //                 color: Colors.black,
              //               ))),
              //           DataCell(Text(
              //               "${RakCoba.serialNumber == null ? "-" : RakCoba.serialNumber}",
              //               style: GoogleFonts.montserrat(
              //                 fontSize: 10,
              //                 fontWeight: FontWeight.w400,
              //                 color: Colors.black,
              //               ))),
              //           DataCell(
              //               Text("${RakCoba.system == null ? "-" : RakCoba.system}",
              //                   style: GoogleFonts.montserrat(
              //                     fontSize: 10,
              //                     fontWeight: FontWeight.w400,
              //                     color: Colors.black,
              //                   ))),
              //           DataCell(
              //               Text("${RakCoba.weight == null ? "-" : RakCoba.weight}",
              //                   style: GoogleFonts.montserrat(
              //                     fontSize: 10,
              //                     fontWeight: FontWeight.w400,
              //                     color: Colors.black,
              //                   ))),
              //           DataCell(Text("${RakCoba.qty == null ? "-" : RakCoba.qty}",
              //               style: GoogleFonts.montserrat(
              //                 fontSize: 10,
              //                 fontWeight: FontWeight.w400,
              //                 color: Colors.black,
              //               ))),
              //           DataCell(
              //               Text("${RakCoba.unit == null ? "-" : RakCoba.unit}",
              //                   style: GoogleFonts.montserrat(
              //                     fontSize: 10,
              //                     fontWeight: FontWeight.w400,
              //                     color: Colors.black,
              //                   ))),
              //           DataCell(Text(
              //               "${RakCoba.deskripsi == null ? "-" : RakCoba.deskripsi}",
              //               style: GoogleFonts.montserrat(
              //                 fontSize: 10,
              //                 fontWeight: FontWeight.w400,
              //                 color: Colors.black,
              //               )))
              //         ]))
              //     .toList()
              List.generate(
                  rakA2.length, (index) => _resultsAPI(index, rakA2[index]))),
    );
  }
}

class RakCoba {
  final String no,
      system,
      location,
      itemName,
      partNumber,
      serialNumber,
      weight,
      qty,
      unit,
      deskripsi;

  const RakCoba({
    required this.no,
    required this.system,
    required this.itemName,
    required this.location,
    required this.partNumber,
    required this.serialNumber,
    required this.weight,
    required this.qty,
    required this.unit,
    required this.deskripsi,
  });

  static List<RakCoba> fromJson(json) {
    return <RakCoba>[
      RakCoba(
        deskripsi: json['description'],
        itemName: json['item_name'],
        no: json['no'],
        location: json['location'],
        partNumber: json['part_number'],
        qty: json['qty'],
        serialNumber: json['serial_number'],
        system: json['system'],
        unit: json['unit'],
        weight: json['weight_kg'],
      )
    ];
  }
}
