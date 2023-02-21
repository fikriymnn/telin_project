import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class TableCableTurnOverHome extends StatefulWidget {
  const TableCableTurnOverHome({super.key});

  @override
  State<TableCableTurnOverHome> createState() => _TableCableTurnOverHomeState();
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

class _TableCableTurnOverHomeState extends State<TableCableTurnOverHome> {
  @override
  Widget build(BuildContext context) {
     String selectedValueSystem = "SYSTEM";
     String selectedValueArmoring = "ARMORING TYPE";
    return Column(
      children: [
         Padding(
                padding: const EdgeInsets.only(left: 19.3),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("CABLE TURN OVER",
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
                          fixedWidth: 60,
                        ),
                        DataColumn2(
                          label: Text('LABEL',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 72,
                        ),
                        DataColumn2(
                          label: DropdownButton(
                            
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
                          fixedWidth: 120,
                        ),
                        DataColumn2(
                          label: Text('CABLE TYPE',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 120,
                        ),
                        DataColumn2(
                          label: Text('MANUFACTURER',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 144.6,
                        ),
                        DataColumn2(
                          label: DropdownButton(
                            
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
                          fixedWidth: 148,
                        ),
                        DataColumn2(
                          label: Text('LENGTH (METER)',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 141.3,
                        ),
                        DataColumn2(
                          label: Text('INNER',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 92.6,
                        ),
                        DataColumn2(
                          label: Text('OUTER',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 92.6,
                        ),
                        DataColumn2(
                          label: Text('TANK LEVER (FR BOTTOM)',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 158.6,
                        ),
                        DataColumn2(
                          label: Text('REMARK',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 160.6,
                        ),
                        DataColumn2(
                          label: Text('ROTO',
                              style: GoogleFonts.montserrat(
                                fontSize: 8.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          fixedWidth: 90,
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
              Padding(
                padding: const EdgeInsets.only(right:80 ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 77.3,
                          height: 19.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33.3),
                              color: Color(0xFFED1D25)),
                          child: Center(
                            child: Text("Edit",
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
      ],
    );
  }
}