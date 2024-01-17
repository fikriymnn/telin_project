import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';

class TableNonCableCartExisting extends StatefulWidget {
  const TableNonCableCartExisting({super.key, required this.idLoading});
  final String idLoading;

  @override
  State<TableNonCableCartExisting> createState() =>
      _TableNonCableCartExistingState();
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

String selectedValueSystem = "SYSTEM";
String selectedValueArmoring = "ARMORING TYPE";

class _TableNonCableCartExistingState extends State<TableNonCableCartExisting> {
  List LoadingByIdSparekit = [];

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
      response = await dio.get('$getLoadingById/$id');
      msg = response!.data['message'];
      setState(() {
        LoadingByIdSparekit = response!.data['loading'][0]['existing_kits_id'];
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

  DataRow _resultsAPI(index, data) {
    return DataRow(cells: [
      DataCell(Text("${index + 1}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['kit']['rak_number'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['kit']['item_name'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['kit']['part_number'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['kit']['serial_number'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['kit']['system']["system"] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['kit']['weight_kg'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['qty'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['kit']['unit'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['kit']['unitpriceIdr'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['kit']['unitpriceUsd'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(TextButton(
          onPressed: () {
            CoolAlert.show(
                context: context,
                type: CoolAlertType.confirm,
                text: "Do you sure to delete this item",
                width: 400,
                confirmBtnText: "Delete",
                cancelBtnText: "Cancle",
                onConfirmBtnTap: () {
                  hapusDataSparekitExisting('${data['id']}');
                });
          },
          child: Text("Delete",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: active,
              ))))
    ]);
  }

  DataRow _resultsAPICart(index, data) {
    bool id;
    if ((index + 1) % 2 == 1) {
      id = true;
    } else {
      id = false;
    }
    var dataQuery = data['kit'];
    return DataRow(
        color: MaterialStatePropertyAll(id == true ? activeTable : light),
        cells: [
          DataCell(Text("${index + 1}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${dataQuery['rak_number'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${dataQuery['item_name'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${dataQuery['part_number'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${dataQuery['serial_number'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${dataQuery['system']['system'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${dataQuery['weight_kg'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['qty'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${dataQuery['unit'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          // DataCell(Text("${dataQuery['unitPriceIdr'] ?? "-"}",
          //     style: GoogleFonts.rubik(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.black,
          //     ))),
          // DataCell(Text("${dataQuery['unitPriceUsd'] ?? "-"}",
          //     style: GoogleFonts.rubik(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.black,
          //     ))),
          // DataCell(Text("${dataQuery['keterangan'] ?? "-"}",
          //     style: GoogleFonts.rubik(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.black,
          //     ))),
          DataCell(TextButton(
              onPressed: () async {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: "Do you sure to delete this item",
                    width: 400,
                    onConfirmBtnTap: () async {
                      hapusDataSparekitExisting('${dataQuery['id']}');
                      Navigator.pop(context, true);
                    });
              },
              child: Text("Delete",
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: active,
                  )))),
        ]);
  }

  void hapusDataSparekitExisting(id) async {
    bool status;
    var msg;
    try {
      response = await dio.delete('$deleteKitFromExisting/${widget.idLoading}',
          data: {'kits_id': id});

      msg = response!.data['message'];

      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: '$msg',
          title: 'Success',
          width: 400,
          barrierDismissible: true,
          confirmBtnColor: Colors.green);
      getDataLoading();
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("SPARE KIT",
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: active,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: DataTable2(
                columnSpacing: 6,
                horizontalMargin: 6,
                dataRowHeight: 52,
                columns: [
                  DataColumn2(
                    fixedWidth: 50,
                    label: Text('NO',
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  DataColumn2(
                    label: Text("LOCATION",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  DataColumn2(
                    label: Text("ITEM NAME",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  DataColumn2(
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("PART",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        Text("NUMBER",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  DataColumn2(
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("SERIAL",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        Text("NUMBER",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  DataColumn2(
                    label: Text("SYSTEM",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  DataColumn2(
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("WEIGHT",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        Text("(KG)",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  DataColumn2(
                    label: Text("QTY",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  DataColumn2(
                    label: Text("UNIT",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  // DataColumn2(
                  //   label: Text("PRICE (IDR)",
                  //       style: GoogleFonts.rubik(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.black,
                  //       )),
                  // ),
                  // DataColumn2(
                  //   label: Text("PRICE (USD)",
                  //       style: GoogleFonts.rubik(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.black,
                  //       )),
                  // ),
                  // DataColumn2(
                  //   label: Text("REMARK",
                  //       style: GoogleFonts.rubik(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.black,
                  //       )),
                  // ),
                  DataColumn2(
                    label: Text("ACTION",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  )
                ],
                rows: List.generate(
                    LoadingByIdSparekit.length,
                    (index) =>
                        _resultsAPICart(index, LoadingByIdSparekit[index]))),
          ),
        ],
      ),
    );
  }
}
