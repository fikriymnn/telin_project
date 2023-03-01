import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class TableCableHome extends StatefulWidget {
  const TableCableHome({super.key});

  @override
  State<TableCableHome> createState() => _TableCableHomeState();
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

class _TableCableHomeState extends State<TableCableHome> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
         Padding(
                padding: const EdgeInsets.only(left: 19.3),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("CABLE",
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
                  padding: const EdgeInsets.only(left: 19.3,right: 150),
                  child: DataTable2(
                      columnSpacing: 6,
                      horizontalMargin: 6,
                       dataRowHeight: 30,
                      
                      minWidth: 3000,
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
                          label: Text('LABEL',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 64.6,
                        ),
                        DataColumn2(
                          label: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              
                              style: GoogleFonts.montserrat(
                                  fontSize: 8.6,
                                  fontWeight: FontWeight.bold,
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
                          fixedWidth: 78.6,
                        ),
                        DataColumn2(
                          label: Text('CABLE TYPE',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 101.3,
                        ),
                        DataColumn2(
                          label: Text('MANUFACTURER',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 112,
                        ),
                        DataColumn2(
                          label: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              
                              style: GoogleFonts.montserrat(
                                  fontSize: 8.6,
                                  fontWeight: FontWeight.bold,
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
                          fixedWidth: 110,
                        ),
                        DataColumn2(
                          label: Text('LENGTH (METER)',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 116.6,
                        ),
                        DataColumn2(
                          label: Text('INNER',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 72.6,
                        ),
                        DataColumn2(
                          label: Text('OUTER',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 64.6,
                        ),
                        DataColumn2(
                          label: Text('TANK LEVER (FR BOTTOM)',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 135.3,
                        ),
                        DataColumn2(
                          label: Text('REMARK',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 142.6,
                        ),
                        DataColumn2(
                          label: Text('ROTO',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 40,
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          10,
                          (index) => DataRow(cells: [
                                DataCell(Text('1',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('18303',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('SEA-US',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('OCC-SC500',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('ALCATEL',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('LWP',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('7,730',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('TANK 2',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('TANK 2',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ))),
                                DataCell(Text('10',
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
                                DataCell(Text('7,204',
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