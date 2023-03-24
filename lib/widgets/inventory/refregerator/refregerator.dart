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

class TableRefregerator extends StatefulWidget {
  const TableRefregerator({super.key});

  @override
  State<TableRefregerator> createState() => _TableRefregeratorState();
}

class _TableRefregeratorState extends State<TableRefregerator> {
  late List<Refregerator> refregerator;
  List<Refregerator> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    refregerator = Refregerator.getRefregerator();
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
                fixedWidth: 250),
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
          rows: _createRowsArmoring()),
    );
  }

  List<DataRow> _createRowsArmoring() {
    return refregerator
        .map((refregerator) => DataRow(cells: [
              DataCell(Text(refregerator.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(refregerator.location,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(refregerator.itemName,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(refregerator.partNumber,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(refregerator.serialNumber,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(refregerator.system,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(refregerator.weight,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(refregerator.qty,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(refregerator.unit,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(refregerator.deskripsi,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
            ]))
        .toList();
  }
}

class Refregerator {
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

  const Refregerator({
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

  static List<Refregerator> getRefregerator() {
    return <Refregerator>[
      const Refregerator(
        no: "1",
        system: "IKK",
        location: "Refregerator",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Refregerator(
        no: "2",
        system: "IKK",
        location: "Refregerator",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Refregerator(
        no: "3",
        system: "IKK",
        location: "Refregerator",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Refregerator(
        no: "4",
        system: "IKK",
        location: "Refregerator ",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Refregerator(
        no: "5",
        system: "IKK",
        location: "Refregerator ",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Refregerator(
        no: "6",
        system: "IKK",
        location: "Refregerator",
        itemName: "OADM BRANCHING UNIT",
        partNumber: "KIT-30032",
        serialNumber: "829476",
        weight: "10.30",
        qty: "1",
        unit: "unit",
        deskripsi: "",
      ),
      const Refregerator(
        no: "7",
        system: "IKK",
        location: "Refregerator",
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
