import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class TableNonCableHome extends StatefulWidget {
  const TableNonCableHome({super.key});

  @override
  State<TableNonCableHome> createState() => _TableNonCableHomeState();
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

class _TableNonCableHomeState extends State<TableNonCableHome> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
         Padding(
                padding: const EdgeInsets.only(left: 19.3),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("NON-CABLE",
                      style: GoogleFonts.montserrat(
                        fontSize: 8.6,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 19.3,right: 126),
                  child: DataTable2(
                      columnSpacing: 6,
                     
                      minWidth: 3000,
                      
                      dataRowHeight: 30,
                      columns: [
                        DataColumn2(
                          label: Text('NO',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 50,
                        ),
                        DataColumn2(
                          label: Text('SYSTEM',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 72,
                        ),
                        DataColumn2(
                          label: Text('ITEM NAME',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 150,
                        ),
                        DataColumn2(
                          label: Text('PART NUMBER',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 100,
                        ),
                        DataColumn2(
                          label: Text('SERIAL NUMBER',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 120,
                        ),
                        DataColumn2(
                          label: Text('LOCATION',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 148,
                        ),
                        DataColumn2(
                          label: Text('WEIGHT (Kg)',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 110,
                        ),
                        DataColumn2(
                          label: Text('QTY',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 80,
                        ),
                        DataColumn2(
                          label: Text('UNIT',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 75,
                        ),
                        DataColumn2(
                          label: Text('REMARK',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 158.6,
                        ),
                        
                      ],
                      rows: List<DataRow>.generate(
                          4,
                          (index) => DataRow(cells: [
                                DataCell(Text('1',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                      DataCell(Text('',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('UJ COMMON ADHESV KIT',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('KIT 15010',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('4700051391',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('LEMARI PENDINGIN',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('1,00',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('1',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('1 unit',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                               DataCell(Text('SABANG - LHOK EXSESS DA',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                              
                               
                              ]))),
                ),
              ),
             
      ],
    );
  }
}