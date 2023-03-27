import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_armoring_type.dart';
import 'package:telin_project/widgets/order/loading/form/input_length_cable.dart';

import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';

import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableCage extends StatefulWidget {
  const TableCage({super.key});

  @override
  State<TableCage> createState() => _TableCageState();
}

class _TableCageState extends State<TableCage> {
  late List<Cage> cage;
  List<Cage> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    cage = Cage.getCage();
    super.initState();
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
                fixedWidth: 200),
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
                fixedWidth: 300),
          ],
          rows: _createRowsArmoring()),
    );
  }

  List<DataRow> _createRowsArmoring() {
    return cage
        .map((cage) => DataRow(cells: [
              DataCell(Text(cage.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cage.location,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cage.itemName,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cage.partNumber,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cage.serialNumber,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cage.system,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cage.weight,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cage.qty,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cage.unit,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cage.deskripsi,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
            ]))
        .toList();
  }
}

class Cage {
  final String no,
      location,
      system,
      itemName,
      partNumber,
      serialNumber,
      weight,
      qty,
      unit,
      deskripsi;

  const Cage({
    required this.no,
    required this.system,
    required this.location,
    required this.itemName,
    required this.partNumber,
    required this.serialNumber,
    required this.weight,
    required this.qty,
    required this.unit,
    required this.deskripsi,
  });

  static List<Cage> getCage() {
    return <Cage>[
      const Cage(
        no: "1",
        system: "IKK",
        location: "Cage 1",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Cage(
        no: "2",
        system: "IKK",
        location: "Cage 1",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Cage(
        no: "3",
        system: "IKK",
        location: "Cage 1",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Cage(
        no: "4",
        system: "IKK",
        location: "Cage 1",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Cage(
        no: "5",
        system: "IKK",
        location: "Cage 1",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Cage(
        no: "6",
        system: "IKK",
        location: "Cage 1",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Cage(
        no: "7",
        system: "IKK",
        location: "Cage 1",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
    ];
  }
}
