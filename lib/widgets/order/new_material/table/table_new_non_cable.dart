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

class TableNewNonCable extends StatefulWidget {
  const TableNewNonCable({super.key});

  @override
  State<TableNewNonCable> createState() => _TableNewNonCableState();
}

class _TableNewNonCableState extends State<TableNewNonCable> {
  late List<NewNonCable> newNonCable;
  List<NewNonCable> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    newNonCable = NewNonCable.getNewNonCable();
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
                      'itemName',
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
                      'partNumber',
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
                      'Serial Number',
                      
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
                      'weight',
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
                      'qty',
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
                      "system",
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
                      "unit",
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
    return newNonCable
        .map((newNonCable) => DataRow(cells: [
              DataCell(Text(newNonCable.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(newNonCable.itemName,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
               DataCell(Text(newNonCable.location,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newNonCable.partNumber,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newNonCable.serialNumber,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newNonCable.weight,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newNonCable.qty,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newNonCable.system,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newNonCable.unit,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newNonCable.evidence,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   DataCell(Text(newNonCable.remark,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                   
                   DataCell(Text(newNonCable.date,
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
                  )))),
                  
                  
              
            ]))
        .toList();
  }
}

class NewNonCable {
  final String no,
      itemName,
      location,
      partNumber,
      serialNumber,
      weight,
      qty,
      system,
      unit,
      evidence,
      remark,
      
      date;

  const NewNonCable(
    {
    required this.no,
    required this.itemName,
    required this.location,
    required this.partNumber,
    required this.serialNumber,
    required this.weight,
    required this.qty,
    required this.system,
    required this.unit,
    required this.evidence,
    required this.remark,
    
    required this.date
  });

  static List<NewNonCable> getNewNonCable() {
    return <NewNonCable>[
      const NewNonCable(
        no: "1",
        itemName: "itemName",
        location: "location",
        partNumber: "partNumber",
        serialNumber: "Serial Number",
        weight: "1000",
        qty: "qty",
        system: "system",
        unit: "-",
        evidence: "evidence",
        remark: "remark",
        
        date: "06/02/2023"
      ),
      const NewNonCable(
        no: "2",
        itemName: "itemName",
        location: "location",
        partNumber: "partNumber",
        serialNumber: "Serial Number",
        weight: "1000",
        qty: "qty",
        system: "system",
        unit: "-",
        evidence: "evidence",
        remark: "remark",
        
         date: "06/02/2023"
      ),
      const NewNonCable(
        no: "3",
        itemName: "itemName",
        location: "location",
        partNumber: "partNumber",
        serialNumber: "Serial Number",
        weight: "1000",
        qty: "qty",
        system: "system",
        unit: "-",
        evidence: "evidence",
        remark: "remark",
        
         date: "06/02/2023"
      ),
      const NewNonCable(
        no: "4",
        itemName: "itemName",
        location: "location",
        partNumber: "partNumber",
        serialNumber: "Serial Number",
        weight: "1000",
        qty: "qty",
        system: "system",
        unit: "-",
        evidence: "evidence",
        remark: "remark",
        
         date: "06/02/2023"
      ),
      const NewNonCable(
        no: "5",
        itemName: "itemName",
        location: "location",
        partNumber: "partNumber",
        serialNumber: "Serial Number",
        weight: "1000",
        qty: "qty",
        system: "system",
        unit: "-",
        evidence: "evidence",
        remark: "remark",
        
         date: "06/02/2023"
      ),
      const NewNonCable(
        no: "6",
        itemName: "itemName",
        location: "location",
        partNumber: "partNumber",
        serialNumber: "Serial Number",
        weight: "1000",
        qty: "qty",
        system: "system",
        unit: "-",
        evidence: "evidence",
        remark: "remark",
       
         date: "06/02/2023"
      ),
    ];
  }
}
