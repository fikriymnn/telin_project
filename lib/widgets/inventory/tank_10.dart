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

class TableTank10 extends StatefulWidget {
  const TableTank10({super.key});

  @override
  State<TableTank10> createState() => _TableTank10State();
}

class _TableTank10State extends State<TableTank10> {
  late List<Tank10> tank10;
  List<Tank10> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    tank10 = Tank10.getTank10();
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
              fixedWidth: 50
            ),
            DataColumn2(
              label: Text(
                'LABLE',
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
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
              fixedWidth: 100
            ),
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
              fixedWidth: 120
            ),
            DataColumn2(
              label: Text(
                "CABLE TYPE",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: Text(
                "MANUFACTURE",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
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
              fixedWidth: 100
            ),
            DataColumn2(
              label: Text(
                "CORE TYPE",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: Text(
                "\u03A3 CORE",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: Text(
                "INNER",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 50
            ),
            DataColumn2(
              label: Text(
                "OUTER",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 50
            ),
            DataColumn2(
              label: Text(
                "TANK LEVEL",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: Text(
                "REMARK",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 150
            ),
            DataColumn2(
              label: Text(
                "DESKRIPTION",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 80
            ),
           
          ],
          rows: _createRowsArmoring()),
    );
  }

  List<DataRow> _createRowsArmoring() {
    return tank10
        .map((tank10) => DataRow(cells: [
              DataCell(Text(tank10.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(tank10.lable,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(tank10.system,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(tank10.armoringType,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank10.cabletype,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank10.manufacturer,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(tank10.length,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(tank10.coreType,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank10.core,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank10.inner,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank10.outer,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank10.tankLevel,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank10.remark,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              
              DataCell(
                Text(tank10.deskripsi,
                            style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))
               
              )
            ]))
        .toList();
  }
}

class Tank10 {
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
      core,
      deskripsi,
      cabletype,
      manufacturer
      ;
      

  const Tank10(
      {required this.no,
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
      required this.deskripsi,
      required this.cabletype,
      required this.manufacturer
      
     });

  static List<Tank10> getTank10() {
    return <Tank10>[
      const Tank10(
          no: "1",
      lable: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      armoringType: "SA",
      coreType: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tankLevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      deskripsi: "SCRAP",
          ),
          const Tank10(
          no: "2",
      lable: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      armoringType: "SA",
      coreType: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tankLevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      deskripsi: "SCRAP",
          ),
          const Tank10(
          no: "3",
      lable: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      armoringType: "SA",
      coreType: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tankLevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      deskripsi: "SCRAP",
          ),
          const Tank10(
          no: "4",
      lable: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      armoringType: "SA",
      coreType: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tankLevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      deskripsi: "SCRAP",
          ),
          const Tank10(
          no: "5",
      lable: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      armoringType: "SA",
      coreType: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tankLevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      deskripsi: "SCRAP",
          ),
          const Tank10(
          no: "6",
      lable: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      armoringType: "SA",
      coreType: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tankLevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      deskripsi: "SCRAP",
          ),
          const Tank10(
          no: "7",
      lable: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      armoringType: "SA",
      coreType: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tankLevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      deskripsi: "SCRAP",
          ),
          const Tank10(
          no: "8",
      lable: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      armoringType: "SA",
      coreType: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tankLevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      deskripsi: "SCRAP",
          ),
          const Tank10(
          no: "9",
      lable: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      armoringType: "SA",
      coreType: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tankLevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      deskripsi: "SCRAP",
          ),
          const Tank10(
          no: "10",
      lable: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      armoringType: "SA",
      coreType: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tankLevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      deskripsi: "SCRAP",
          ),
      
      
      
    ];
  }
}
