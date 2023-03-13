import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_armoring_type.dart';
import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';

import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableNewCable extends StatefulWidget {
  const TableNewCable({super.key});

  @override
  State<TableNewCable> createState() => _TableNewCableState();
}

class _TableNewCableState extends State<TableNewCable> {
  late List<NewCable> newCable;
  List<NewCable> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    newCable = NewCable.getNewCable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 30,
        minWidth: 3000,
        border: TableBorder(top: BorderSide(), bottom: BorderSide()),
        showBottomBorder: false,
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
                      'Cable Type',
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
                      'Manufacture',
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
                      'Armoring Type',
                      
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
                      'Length',
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
                      'Lable',
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
                      "Inner",
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
                      "Outer",
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
                      "evidence",
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
                      "Core Type",
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
                      "\u03A3 Core",
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
                      "Date",
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
                      " ",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 95.25,
                  ),
         
        ],
        rows: _createRowsArmoring());
  }

  List<DataRow> _createRowsArmoring() {
    return newCable
        .map((newCable) => DataRow(cells: [
              DataCell(Text(newCable.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(newCable.system,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
               DataCell(Text(newCable.cableType,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.manufacture,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.armoringType,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.length,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.lable,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.inner,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.outer,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.evidence,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.remark,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.coreType,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.core,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newCable.date,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BastNewMaterial()));
                  }, child:  Text("detail..",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )))
                   ),
                  
                  
              
            ]))
        .toList();
  }
}

class NewCable {
  final String no,
      system,
      cableType,
      manufacture,
      armoringType,
      length,
      lable,
      inner,
      outer,
      evidence,
      remark,
      coreType,
      core,
      date;

  const NewCable(
    {
    required this.no,
    required this.system,
    required this.cableType,
    required this.manufacture,
    required this.armoringType,
    required this.length,
    required this.lable,
    required this.inner,
    required this.outer,
    required this.evidence,
    required this.remark,
    required this.coreType,
    required this.core,
    required this.date
  });

  static List<NewCable> getNewCable() {
    return <NewCable>[
      const NewCable(
        no: "1",
        system: "System",
        cableType: "CableType",
        manufacture: "Manufacture",
        armoringType: "armoring Type",
        length: "1000",
        lable: "Lable",
        inner: "inner",
        outer: "-",
        evidence: "evidence",
        remark: "remark",
        coreType: "core type",
        core: "core",
        date: "06/02/2023"
      ),
      const NewCable(
        no: "2",
        system: "System",
        cableType: "CableType",
        manufacture: "Manufacture",
        armoringType: "armoring Type",
        length: "1000",
        lable: "Lable",
        inner: "inner",
        outer: "-",
        evidence: "evidence",
        remark: "remark",
        coreType: "core type",
        core: "core",
         date: "06/02/2023"
      ),
      const NewCable(
        no: "3",
        system: "System",
        cableType: "CableType",
        manufacture: "Manufacture",
        armoringType: "armoring Type",
        length: "1000",
        lable: "Lable",
        inner: "inner",
        outer: "-",
        evidence: "evidence",
        remark: "remark",
        coreType: "core type",
        core: "core",
         date: "06/02/2023"
      ),
      const NewCable(
        no: "4",
        system: "System",
        cableType: "CableType",
        manufacture: "Manufacture",
        armoringType: "armoring Type",
        length: "1000",
        lable: "Lable",
        inner: "inner",
        outer: "-",
        evidence: "evidence",
        remark: "remark",
        coreType: "core type",
        core: "core",
         date: "06/02/2023"
      ),
      const NewCable(
        no: "5",
        system: "System",
        cableType: "CableType",
        manufacture: "Manufacture",
        armoringType: "armoring Type",
        length: "1000",
        lable: "Lable",
        inner: "inner",
        outer: "-",
        evidence: "evidence",
        remark: "remark",
        coreType: "core type",
        core: "core",
         date: "06/02/2023"
      ),
      const NewCable(
        no: "6",
        system: "System",
        cableType: "CableType",
        manufacture: "Manufacture",
        armoringType: "armoring Type",
        length: "1000",
        lable: "Lable",
        inner: "inner",
        outer: "-",
        evidence: "evidence",
        remark: "remark",
        coreType: "core type",
        core: "core",
         date: "06/02/2023"
      ),
    ];
  }
}
