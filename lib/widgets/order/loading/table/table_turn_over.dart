import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';

class TableCableTurnOverCart extends StatefulWidget {
  const TableCableTurnOverCart({super.key, required this.idLoading});
  final String idLoading;

  @override
  State<TableCableTurnOverCart> createState() => _TableCableTurnOverCartState();
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
    const DropdownMenuItem(
        value: "ARMORING TYPE", child: Text("ARMORING TYPE")),
    const DropdownMenuItem(value: "Canada", child: Text("Canada")),
    const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    const DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItemsArmoring;
}

class _TableCableTurnOverCartState extends State<TableCableTurnOverCart> {
  List turnoverById = [];

  String id = "";
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    id = widget.idLoading;
    getDataLoading();
    super.initState();
  }

  void getDataLoading() async {
    var msg;
    try {
      response = await dio.get('$getAllTurnOverById/$id');

      setState(() {
        turnoverById = response!.data['uniqueTurnOver'];
      });
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }

  DataRow _resultsAPI(
    index,
    data,
  ) {
    return DataRow(cells: [
      DataCell(Text("${index + 1}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text('${data['lable_id'] ?? "-"}',
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['system']['system'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['cable_type']['cable_type'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['manufacturer']['manufacturer'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['armoring_type']['armoring_type'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['length_report'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['tank'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['tank_location'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['tank_level'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['remark'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    String selectedValueSystem = "SYSTEM";
    String selectedValueArmoring = "ARMORING TYPE";
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19.3),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text("CABLE TURN OVER",
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
                    label: Text('TANK',
                        style: GoogleFonts.montserrat(
                          fontSize: 8.6,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    fixedWidth: 72.6,
                  ),
                  DataColumn2(
                    label: Text('TANK LOCATION',
                        style: GoogleFonts.montserrat(
                          fontSize: 8.6,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    fixedWidth: 64.6,
                  ),
                  DataColumn2(
                    label: Text('TANK LEVEL (FR BOTTOM)',
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
                ],
                rows: List.generate(
                    turnoverById.length,
                    (index) => _resultsAPI(
                          index,
                          turnoverById[index],
                        ))

                // List<DataRow>.generate(
                //     10,
                //     (index) => DataRow(cells: [
                //           DataCell(Text('1',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('18303',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('SEA-US',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('OCC-SC500',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('ALCATEL',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('LWP',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('7,730',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('TANK 2',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('TANK 2',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('10',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('SABANG - LHOK EXSESS DA',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('7,204',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //         ]))
                ),
          ),
        ),
      ],
    );
  }
}
