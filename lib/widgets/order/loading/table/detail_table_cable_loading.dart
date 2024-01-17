import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;

import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/table/table_cable_take_loading.dart';
import 'package:telin_project/widgets/order/new_material/add_new_material.dart';

class DetailTableCableLoading extends StatefulWidget {
  const DetailTableCableLoading(
      {super.key, required this.id, required this.status});
  final String id;
  final String status;

  @override
  State<DetailTableCableLoading> createState() =>
      _DetailTableCableLoadingState();
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

class _DetailTableCableLoadingState extends State<DetailTableCableLoading> {
  List NewLoadingByIdCable = [];
  List NewLoadingByIdCableCart = [];

  String id = "";
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    id = widget.id;
    getDataLoading();
    super.initState();
  }

  void getDataLoading() async {
    var msg;
    try {
      response = await dio.get('$getLoadingById/$id');

      setState(() {
        NewLoadingByIdCable = response!.data['loading'][0]['submitted_cables'];
        NewLoadingByIdCableCart = response!.data['loading'][0]['cables_id'];
      });
    } catch (e) {}
  }

  DataRow _resultsAPI(index, data) {
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
          DataCell(Text("${data['length_report'] ?? "-"}",
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
          DataCell(Text("${data['priceIdr'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['priceUsd'] ?? "-"}",
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
          DataCell(widget.status == "Draft"
              ? TextButton(
                  onPressed: () {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        text: "Do you sure to delete this item",
                        width: 400,
                        onConfirmBtnTap: () {
                          hapusDataCableLoading('${data['id']}');
                          Navigator.of(context, rootNavigator: true).pop();
                        });
                  },
                  child: Text("Delete",
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: active,
                      )))
              : Text("",
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: active,
                  ))),
        ]);
  }

  void hapusDataCableLoading(id) async {
    bool status;
    var msg;
    try {
      response = await dio.delete('$deleteCableFromLoading/${widget.id}',
          data: {'cables_id': id});

      msg = response!.data['message'];

      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: "Delete Success",
        width: 400,
      );
      getDataLoading();
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: "Kesalahan Server",
          width: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("CABLE",
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: active,
                  )),
              widget.status == 'Draft'
                  ? InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("CABLE",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(
                                              child: TableCableTakeLoading(
                                                  idLoading: widget.id,
                                                  refresh: () =>
                                                      getDataLoading()))
                                        ],
                                      )),
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: 135,
                        height: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: active),
                        child: Center(
                          child: Text("+ TAKE CABLE",
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: light)),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
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
                DataColumn2(
                  label: Text("PRICE (IDR)",
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                ),
                DataColumn2(
                  label: Text("PRICE (USD)",
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
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
              rows: widget.status != "Approved"
                  ? List.generate(
                      NewLoadingByIdCableCart.length,
                      (index) => _resultsAPI(
                            index,
                            NewLoadingByIdCableCart[index],
                          ))
                  : List.generate(
                      NewLoadingByIdCable.length,
                      (index) => _resultsAPI(
                            index,
                            NewLoadingByIdCable[index],
                          ))),
        ),
      ],
    );
  }
}
