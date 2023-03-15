import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_armoring_type.dart';
import 'package:telin_project/widgets/order/loading/input_length_cable.dart';
import 'package:telin_project/widgets/order/loading/input_qty_non_cable.dart';
import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';

import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableNonCableLoading extends StatefulWidget {
  const TableNonCableLoading({super.key});

  @override
  State<TableNonCableLoading> createState() => _TableNonCableLoadingState();
}

class _TableNonCableLoadingState extends State<TableNonCableLoading> {
  late List<NonCableLoading> nonCableLoading;
  List<NonCableLoading> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    nonCableLoading = NonCableLoading.getNonCableLoading();
    super.initState();
  }

   List<DropdownMenuItem<String>> get dropdownItemsLocation {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("LOCATION"), value: "LOCATION"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
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

  List<DropdownMenuItem<String>> get dropdownItemsUnit {
    List<DropdownMenuItem<String>> menuItemsUnit = [
      DropdownMenuItem(child: Text("UNIT"), value: "UNIT"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsUnit;
  }
   String selectedValueLocation = "LOCATION";
   String selectedValueSystem = "SYSTEM";
  String selectedValueUnit = "UNIT";

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
              label: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                
                                style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValueLocation = newValue!;
                                    });
                                  },
                                  value: selectedValueLocation,
                                  items: dropdownItemsLocation),
                            ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: Text(
                "ITEM NAME",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 220
            ),
            DataColumn2(
              label: Text(
                "PART NUMBER",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 200
            ),
            DataColumn2(
              label: Text(
                "SERIAL NUMBER",
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
              label: Text(
                '''WIGHT 
(KG)''',
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
                "QTY",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 50
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
                                      selectedValueUnit = newValue!;
                                    });
                                  },
                                  value: selectedValueUnit,
                                  items: dropdownItemsUnit),
                            ),
              fixedWidth: 100
            ),
           
            DataColumn2(
              label: Text(
                "ACTION",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 50
            ),
           
          ],
          rows: _createRowsArmoring()),
    );
  }

  List<DataRow> _createRowsArmoring() {
    return nonCableLoading
        .map((nonCableLoading) => DataRow(cells: [
              DataCell(Text(nonCableLoading.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(nonCableLoading.location,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(nonCableLoading.itemName,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(nonCableLoading.partNumber,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(nonCableLoading.serialNumber,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(nonCableLoading.system,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(nonCableLoading.weight.toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(nonCableLoading.qty.toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(nonCableLoading.unit,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                 
              
              DataCell(
                TextButton(onPressed: (){
                  showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return InputQtyNonCable();
                                        });
                }, child: Text("Take",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: active,
                            )) )
               
              )
            ]))
        .toList();
  }
}

class NonCableLoading {
  final String no,
      system,
      location,
      itemName,
      partNumber,
      serialNumber,
      
      unit;
  final double weight;
  final int qty;
      
      
      

  const NonCableLoading(
      {required this.no,
      required this.system,
      required this.location,
      required this.itemName,
      required this.partNumber,
      required this.serialNumber,
      required this.unit,
      required this.weight,
      required this.qty

    
      
     });

  static List<NonCableLoading> getNonCableLoading() {
    return <NonCableLoading>[
      const NonCableLoading(
          no: "1",
          system: "System",
          
          itemName: "MPJC JOINTING TOOL SET NEXAN DA TO PIRELLI HRA-E",
          location: "Cage 1",
          partNumber:"4FP#5-91E RP24 730 AAA" ,
          qty: 1,
          serialNumber: "NA",
          unit: "UNIT",

          weight: 3000
          ),
      const NonCableLoading(
          no: "2",
          system: "System",
         
          itemName: "MPJC JOINTING TOOL SET NEXAN DA TO PIRELLI HRA-E",
          location: "Cage 1",
          partNumber:"4FP#5-91E RP24 730 AAA" ,
          qty: 1,
          serialNumber: "NA",
          unit: "UNIT",

          weight: 3000
          ),
      const NonCableLoading(
          no: "3",
          system: "System",
         
          itemName: "MPJC JOINTING TOOL SET NEXAN DA TO PIRELLI HRA-E",
          location: "Cage 1",
          partNumber:"4FP#5-91E RP24 730 AAA" ,
          qty: 1,
          serialNumber: "NA",
          unit: "UNIT",

          weight: 3000
          ),
      const NonCableLoading(
          no: "4",
          system: "System",
         
          itemName: "MPJC JOINTING TOOL SET NEXAN DA TO PIRELLI HRA-E",
          location: "Cage 1",
          partNumber:"4FP#5-91E RP24 730 AAA" ,
          qty: 1,
          serialNumber: "NA",
          unit: "UNIT",

          weight: 3000
          ),
      const NonCableLoading(
          no: "5",
          system: "System",
         
          itemName: "MPJC JOINTING TOOL SET NEXAN DA TO PIRELLI HRA-E",
          location: "Cage 1",
          partNumber:"4FP#5-91E RP24 730 AAA" ,
          qty: 1,
          serialNumber: "NA",
          unit: "UNIT",

          weight: 3000
          ),
      const NonCableLoading(
          no: "6",
          system: "System",
         
          itemName: "MPJC JOINTING TOOL SET NEXAN DA TO PIRELLI HRA-E",
          location: "Cage 1",
          partNumber:"4FP#5-91E RP24 730 AAA" ,
          qty: 1,
          serialNumber: "NA",
          unit: "UNIT",

          weight: 3000
          ),
    ];
  }
}
