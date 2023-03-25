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

class TableTank4 extends StatefulWidget {
  const TableTank4({super.key});

  @override
  State<TableTank4> createState() => _TableTank4State();
}

class _TableTank4State extends State<TableTank4> {
  late List<Tank4> tank4;
  List<Tank4> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    tank4 = Tank4.getTank4();
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
    return tank4
        .map((tank4) => DataRow(cells: [
              DataCell(Text(tank4.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(tank4.lable,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(tank4.system,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(tank4.armoringType,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank4.cabletype,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank4.manufacturer,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(tank4.length,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(tank4.coreType,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank4.core,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank4.inner,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank4.outer,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank4.tankLevel,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(tank4.remark,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              
              DataCell(
                Text(tank4.deskripsi,
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

class Tank4 {
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
      

  const Tank4(
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

  static List<Tank4> getTank4() {
    return <Tank4>[
      const Tank4(
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
          const Tank4(
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
          const Tank4(
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
          const Tank4(
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
          const Tank4(
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
          const Tank4(
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
          const Tank4(
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
          const Tank4(
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
          const Tank4(
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
          const Tank4(
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
