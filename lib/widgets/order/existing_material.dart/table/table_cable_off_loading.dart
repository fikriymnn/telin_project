import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/existing_material.dart/form/input_length_cable_existing.dart';

class TableCableOffLoading extends StatefulWidget {
  const TableCableOffLoading({super.key, required this.idOffLoading});
  final String idOffLoading;

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
    const DropdownMenuItem(
        value: "ARMORING TYPE", child: Text("ARMORING TYPE")),
    const DropdownMenuItem(value: "Canada", child: Text("Canada")),
    const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    const DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItemsArmoring;
}

String selectedValueSystem = "SYSTEM";
String selectedValueArmoring = "ARMORING TYPE";

class _TableCableOffLoadingState extends State<TableCableOffLoading> {
  List OffLoadingByIdCable = [];

  String id = "";
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    id = widget.idOffLoading;
    getDataLoading();
    super.initState();
  }

  void getDataLoading() async {
    var msg;
    try {
      response = await dio.get('$getOffLoadingById/$id');
      msg = response!.data['message'];
      setState(() {
        OffLoadingByIdCable = response!.data['loading'][0]['submitted_cables'];
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
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text('${data['label_id'] ?? "-"}',
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['system']['system'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['armoring_type']['armoring_type'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['length_report'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['core_type']['core_type'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['sigma_core'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['tank'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['tank_location'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['tank_level'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      // DataCell(Text("${data['priceIdr'] ?? "-"}",
      //     style: GoogleFonts.montserrat(
      //       fontSize: 10,
      //       fontWeight: FontWeight.w600,
      //       color: Colors.black,
      //     ))),
      // DataCell(Text("${data['priceUsd'] ?? "-"}",
      //     style: GoogleFonts.montserrat(
      //       fontSize: 10,
      //       fontWeight: FontWeight.w600,
      //       color: Colors.black,
      //     ))),
      DataCell(Text("${data['remark'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return InputLengthCableExisting(
                    idCable: data['id'],
                    initialLength: data['length_report'],
                    idOffLoading: widget.idOffLoading,
                  );
                });
          },
          child: Text("Take",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: active,
              ))))
    ]);
  }

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
                      label: Text(
                        'NO',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 50),
                  DataColumn2(
                      label: Text(
                        'LABLE',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        'SYSTEM',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        'ARMORING TYPE',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 120),
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
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        "CORE TYPE",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        "\u03A3 CORE",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        "TANK",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 50),
                  DataColumn2(
                      label: Text(
                        "TANK LOCATION",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        "TANK LEVEL",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                  // DataColumn2(
                  //     label: Text(
                  //       "UNIT PRICE(IDR)",
                  //       style: GoogleFonts.montserrat(
                  //         fontSize: 10,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     fixedWidth: 100),
                  // DataColumn2(
                  //     label: Text(
                  //       "UNIT PRICE(USD)",
                  //       style: GoogleFonts.montserrat(
                  //         fontSize: 10,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        "REMARK",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 150),
                  DataColumn2(
                      label: Text(
                        "ACTION",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                ],
                rows: List.generate(
                    OffLoadingByIdCable.length,
                    (index) => _resultsAPI(
                          index,
                          OffLoadingByIdCable[index],
                        ))),
          ),
        ),
      ],
    );
  }
}
