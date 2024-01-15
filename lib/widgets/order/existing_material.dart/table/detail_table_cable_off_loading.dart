import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/existing_material.dart/form/input_length_cable_existing.dart';

class DetailTableCableOffLoading extends StatefulWidget {
  const DetailTableCableOffLoading(
      {super.key, required this.idOffLoading, required this.status});
  final String idOffLoading;
  final String status;

  @override
  State<DetailTableCableOffLoading> createState() =>
      _DetailTableCableOffLoadingState();
}

class _DetailTableCableOffLoadingState
    extends State<DetailTableCableOffLoading> {
  List OffLoadingByIdCable = [];
  List OffLoadingByIdCCart = [];
  List OffLoadingByIdCSubmit = [];

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
        OffLoadingByIdCSubmit =
            response!.data['loading'][0]['submitted_existing_cables_id'];
        OffLoadingByIdCCart =
            response!.data['loading'][0]['existing_cables_id'];
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

          // DataCell(Text("${data['remark'] ?? "-"}",
          //     style: GoogleFonts.rubik(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.black,
          //     ))),
          DataCell(widget.status == "Draft"
              ? TextButton(
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
          DataCell(widget.status == "Draft"
              ? TextButton(
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
              rows: widget.status == "Draft"
                  ? List.generate(
                      OffLoadingByIdCable.length,
                      (index) => _resultsAPI(
                            index,
                            OffLoadingByIdCable[index],
                          ))
                  : widget.status == "Requested"
                      ? List.generate(
                          OffLoadingByIdCCart.length,
                          (index) => _resultsAPIChart(
                                index,
                                OffLoadingByIdCCart[index],
                              ))
                      : List.generate(
                          OffLoadingByIdCSubmit.length,
                          (index) => _resultsAPI(
                                index,
                                OffLoadingByIdCSubmit[index],
                              ))),
        ),
      ],
    );
  }
}
