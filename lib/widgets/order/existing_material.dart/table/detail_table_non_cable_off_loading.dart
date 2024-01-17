import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';

import 'package:telin_project/constants/style.dart';

import '../form/input_qty_non_cable_existing.dart';

class DetailTableNonCableOffLoading extends StatefulWidget {
  const DetailTableNonCableOffLoading(
      {super.key, required this.idOffLoading, required this.status});
  final String idOffLoading;
  final String status;

  @override
  State<DetailTableNonCableOffLoading> createState() =>
      _DetailTableNonCableOffLoadingState();
}

class _DetailTableNonCableOffLoadingState
    extends State<DetailTableNonCableOffLoading> {
  List offLoadingByIdKit = [];
  List offLoadingByIdCart = [];
  List offLoadingByIdKitSubmit = [];

  String id = "";
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    id = widget.idOffLoading;
    getDataOffLoading();
    super.initState();
  }

  void getDataOffLoading() async {
    var msg;
    try {
      response = await dio.get('$getOffLoadingById/$id');
      msg = response!.data['message'];
      setState(() {
        offLoadingByIdKit = response!.data['loading'][0]['submitted_kits'];
        offLoadingByIdCart = response!.data['loading'][0]['existing_kits_id'];
        offLoadingByIdKitSubmit =
            response!.data['loading'][0]['submitted_existing_kits_id'];
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

          // DataCell(Text("${dataQuery['keterangan'] ?? "-"}",
          //     style: GoogleFonts.rubik(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.black,
          //     ))),
          DataCell(widget.status == "Draft"
              ? TextButton(
                  onPressed: () async {},
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

  DataRow _resultsAPIDraft(index, data) {
    bool id;
    if ((index + 1) % 2 == 1) {
      id = true;
    } else {
      id = false;
    }
    var dataQuery = data;
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
          DataCell(Text("${data['qty_taken'] ?? "-"}",
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

          // DataCell(Text("${dataQuery['keterangan'] ?? "-"}",
          //     style: GoogleFonts.rubik(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.black,
          //     ))),
          DataCell(widget.status == "Draft"
              ? TextButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return InputQtyNonCableExisting(
                            idKit: data['id'],
                            idLoading: widget.idOffLoading,
                            qtyStock: data['qty_taken'].toString(),
                          );
                        });
                  },
                  child: Text("TAKE",
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

  DataRow _resultsAPIApproved(index, data) {
    bool id;
    if ((index + 1) % 2 == 1) {
      id = true;
    } else {
      id = false;
    }
    var dataQuery = data;
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

          // DataCell(Text("${dataQuery['keterangan'] ?? "-"}",
          //     style: GoogleFonts.rubik(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.black,
          //     ))),
          DataCell(widget.status == "Draft"
              ? TextButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return InputQtyNonCableExisting(
                            idKit: data['id'],
                            idLoading: widget.idOffLoading,
                            qtyStock: data['qty_taken'].toString(),
                          );
                        });
                  },
                  child: Text("TAKE",
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text("SPARE KIT",
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
              rows: widget.status == "Draft"
                  ? List.generate(
                      offLoadingByIdKit.length,
                      (index) => _resultsAPIDraft(
                            index,
                            offLoadingByIdKit[index],
                          ))
                  : widget.status == "Requested"
                      ? List.generate(
                          offLoadingByIdCart.length,
                          (index) => _resultsAPI(
                                index,
                                offLoadingByIdCart[index],
                              ))
                      : List.generate(
                          offLoadingByIdKitSubmit.length,
                          (index) => _resultsAPIApproved(
                                index,
                                offLoadingByIdKitSubmit[index],
                              ))),
        ),
      ],
    );
  }
}
