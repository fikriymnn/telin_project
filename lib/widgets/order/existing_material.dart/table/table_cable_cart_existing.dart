import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';

import '../../../../constants/style.dart';

class TableCableCartExisting extends StatefulWidget {
  const TableCableCartExisting({
    super.key,
    required this.idLoading,
  });
  final String idLoading;

  @override
  State<TableCableCartExisting> createState() => _TableCableCartExistingState();
}

class _TableCableCartExistingState extends State<TableCableCartExisting> {
  List LoadingByIdCable = [];

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
      response = await dio.get('$getOffLoadingById/$id');
      msg = response!.data['message'];
      setState(() {
        LoadingByIdCable = response!.data['loading'][0]['existing_cables_id'];
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
      DataCell(Text("${data['length_returned'] ?? "-"}",
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
      DataCell(Text("${data['priceIdr'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['priceUsd'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['remark'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(TextButton(
          onPressed: () {},
          child: Text("Delete",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: active,
              ))))
    ]);
  }

  DataRow _resultsAPIChart(index, data) {
    bool id;
    if ((index + 1) % 2 == 1) {
      id = true;
    } else {
      id = false;
    }
    return DataRow(
        color: MaterialStatePropertyAll(id == true ? activeTable : light),
        cells: [
          DataCell(Text("${index + 1}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text('${data['label_id'] ?? "-"}',
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['system']['system'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['armoring_type']['armoring_type'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['length_returned'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['core_type']['core_type'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['sigma_core'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['tank'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['tank_location'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['tank_level'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),

          // DataCell(Text("${data['remark'] ?? "-"}",
          //     style: GoogleFonts.rubik(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.black,
          //     ))),
          DataCell(TextButton(
              onPressed: () {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: "Do you sure to delete this item",
                    width: 400,
                    confirmBtnText: "Delete",
                    cancelBtnText: "Cancle",
                    onConfirmBtnTap: () {
                      hapusDataCableExisting('${data['id']}');
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

  void hapusDataCableExisting(id) async {
    bool status;
    var msg;
    try {
      response = await dio.delete(
          '$deleteCableFromExisting/${widget.idLoading}',
          data: {'cables_id': id});

      msg = response!.data['message'];

      // ignore: use_build_context_synchronously
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
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text("CABLE",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: active,
                )),
          ),
          SizedBox(
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
                    label: Text('LABLE',
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  DataColumn2(
                    label: Text('SYSTEM',
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
                        Text("ARMORING",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        Text("TYPE",
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
                        Text("LENGTH",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        Text("(METER)",
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
                        Text("CORE",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        Text("TYPE",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  DataColumn2(
                    label: Text("\u03A3 CORE",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  DataColumn2(
                    label: Text("TANK",
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
                        Text("TANK",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        Text("LOCATION",
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
                        Text("TANK",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        Text("LEVEL",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),

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
                    LoadingByIdCable.length,
                    (index) => _resultsAPIChart(
                          index,
                          LoadingByIdCable[index],
                        ))),
          ),
        ],
      ),
    );
  }
}
