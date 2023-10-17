import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'dart:html' as html;

class DetailTableKitNewMaterial extends StatefulWidget {
  const DetailTableKitNewMaterial({super.key, required this.idNewMaterial});
  final String idNewMaterial;

  @override
  State<DetailTableKitNewMaterial> createState() =>
      _DetailTableKitNewMaterialState();
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

class _DetailTableKitNewMaterialState extends State<DetailTableKitNewMaterial> {
  List NewMaterialByIdkit = [];
  List NewMaterialByIdkit2 = [];

  String id = "";
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    id = widget.idNewMaterial;
    getDataNewMaterial();
    super.initState();
  }

  void getDataNewMaterial() async {
    var msg;
    try {
      response = await dio.get('$getNewMaterialById/$id');

      setState(() {
        NewMaterialByIdkit = response!.data['newMaterial'][0]
            ['submitted_new_material_kits_id_in_spare_kits'];
        NewMaterialByIdkit2 =
            response!.data['newMaterial'][0]['new_material_kits'];
      });
    } catch (e) {}
  }

  DataRow _resultsAPI(index, data, data2) {
    return DataRow(cells: [
      DataCell(Text("${index + 1}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['rak_number'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['item_name'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['part_number'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['serial_number'] ?? "-"}",
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
      DataCell(Text("${data['weight_kg'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['qty'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['unit'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(data['evidence'] != null
          ? TextButton(
              onPressed: () {
                downloadEvidenceKitNewMaterial(
                    data2['id'], data['evidence']['originalName']);
              },
              child: Text("Download evidence",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  )))
          : Text("-",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(Text("${data['keterangan'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
    ]);
  }

  void downloadEvidenceKitNewMaterial(id, name) async {
    bool status;
    var msg;
    String url = "$downloadEvidenceKit/${widget.idNewMaterial}/$id";

    try {
      html.AnchorElement anchorElement = new html.AnchorElement(href: url);
      anchorElement.download = url;
      anchorElement.click();
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: e.toString(),
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }

  void hapuskitNewMaterial(id) async {
    bool status;
    var msg;
    try {
      response = await dio.delete(
        '$deleteSparekitFromLoading/${widget.idNewMaterial}/$id',
      );

      msg = response!.data['message'];

      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: '$msg',
          title: 'Peringatan',
          width: 400,
          barrierDismissible: true,
          confirmBtnColor: Colors.red);
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19.3),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text("NON-CABLE",
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
            padding: const EdgeInsets.only(left: 19.3, right: 126),
            child: DataTable2(
                columnSpacing: 6,
                minWidth: 3000,
                dataRowHeight: 30,
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
                        "LOCATION",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        "ITEM NAME",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 220),
                  DataColumn2(
                      label: Text(
                        "PART NUMBER",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 200),
                  DataColumn2(
                      label: Text(
                        "SERIAL NUMBER",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        "SYSTEM",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
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
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        "QTY",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 50),
                  DataColumn2(
                      label: Text(
                        "UNIT",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        "EVIDENCE",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                  DataColumn2(
                      label: Text(
                        "REMARK",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      fixedWidth: 100),
                ],
                rows: List.generate(
                    NewMaterialByIdkit.length,
                    (index) => _resultsAPI(index, NewMaterialByIdkit[index],
                        NewMaterialByIdkit2[index]))

                //  List<DataRow>.generate(
                //     4,
                //     (index) => DataRow(cells: [
                //           DataCell(Text('1',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('UJ COMMON ADHESV KIT',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('KIT 15010',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('4700051391',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('LEMARI PENDINGIN',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('1,00',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('1',
                //               style: GoogleFonts.montserrat(
                //                 fontSize: 8.6,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ))),
                //           DataCell(Text('1 unit',
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
                //         ]))
                ),
          ),
        ),
      ],
    );
  }
}