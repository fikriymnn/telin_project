import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';


class TableCableEdit extends StatefulWidget {
  const TableCableEdit({super.key});

  @override
  State<TableCableEdit> createState() => _TableCableEditState();
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

class _TableCableEditState extends State<TableCableEdit> {
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
            padding: const EdgeInsets.only(left: 19.3, right: 150),
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
                  DataColumn2(
                    label: Text('ACTION',
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
                          DataCell(
                            InkWell(
                              onTap: () {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.confirm,
                                  text: 'Do you sure to delete this item',
                                  confirmBtnText: 'Yes',
                                  cancelBtnText: 'No',
                                  customAsset: 'assets/gift/error.gif',
                                  width: 400,
                                  confirmBtnColor: Colors.green,
                                );
                              },
                              child: Container(
                                width: 21.41,
                                height: 19.46,
                                decoration: BoxDecoration(
                                    color: const Color(0xffEC1D26),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: Text("X",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ]))),
          ),
        ),
      ],
    );
  }
}
