import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/form/input_length_cable.dart';

class TableCableOffLoading extends StatefulWidget {
  const TableCableOffLoading({super.key});

  @override
  State<TableCableOffLoading> createState() => _TableCableOffLoadingState();
}

List<DropdownMenuItem<String>> get dropdownItemsSystem {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "SYSTEM", child: Text("SYSTEM")),
    const DropdownMenuItem(value: "Canada", child: Text("Canada")),
    const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    const DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItemsArmoring {
  List<DropdownMenuItem<String>> menuItemsArmoring = [
    const DropdownMenuItem(value: "ARMORING TYPE", child: Text("ARMORING TYPE")),
    const DropdownMenuItem(value: "Canada", child: Text("Canada")),
    const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    const DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItemsArmoring;
}

String selectedValueSystem = "SYSTEM";
String selectedValueArmoring = "ARMORING TYPE";

class _TableCableOffLoadingState extends State<TableCableOffLoading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19.3),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text("CABLE",
                style: GoogleFonts.montserrat(
                  fontSize: 8.6,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 19.3, right: 30),
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
                    label: Text('''LENGTH 
(METER)''',
                        style: GoogleFonts.montserrat(
                          fontSize: 8.6,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    fixedWidth: 60,
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
                    label: Text('''TANK LEVER 
(FR BOTTOM)''',
                        style: GoogleFonts.montserrat(
                          fontSize: 8.6,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    fixedWidth: 70,
                  ),
                  DataColumn2(
                    label: Text('REMARK',
                        style: GoogleFonts.montserrat(
                          fontSize: 8.6,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    fixedWidth: 190,
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
                  DataColumn2(
                    label: Text('',
                        style: GoogleFonts.montserrat(
                          fontSize: 8.6,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    fixedWidth: 50,
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
                          DataCell(TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const InputLengthCable();
                                    });
                              },
                              child: Text("Take",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: active,
                                  ))))
                        ]))),
          ),
        ),
      ],
    );
  }
}
