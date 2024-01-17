import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';

import 'package:telin_project/widgets/order/existing_material.dart/detail_existing.dart';

import 'package:telin_project/widgets/order/loading/detail_loading.dart';

class TableExistingMaterial extends StatefulWidget {
  const TableExistingMaterial({super.key});

  @override
  State<TableExistingMaterial> createState() => _TableExistingMaterialState();
}

class _TableExistingMaterialState extends State<TableExistingMaterial> {
  List offLoading = [];
  List<ExistingMaterial> filterData = [];
  List<ExistingMaterial> offLoadingExistingData = [];
  TextEditingController controller = TextEditingController();

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataLoading();
    super.initState();
  }

  void getDataLoading() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllOffLoading);

      if (response!.statusCode == 200) {
        List<dynamic> jsonResponse = response!.data;
        List<ExistingMaterial> existing = jsonResponse
            .map((json) => ExistingMaterial.fromJson(json))
            .toList();
        setState(() {
          offLoadingExistingData = existing
              .where((element) => element.statusLoading.contains('Approved'))
              .toList();
          filterData = existing
              .where((element) => element.statusLoading.contains('Approved'))
              .toList();
        });
      }
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
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 512,
                height: 31,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xffE9E9E9)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 15),
                  child: TextField(
                    controller: controller,
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 12),
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF9D9D9D),
                        ),
                        hintText: "Search"),
                    onChanged: (value) {
                      setState(() {
                        filterData = offLoadingExistingData
                            .where((element) => element.projectName
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: PaginatedDataTable2(
            sortColumnIndex: 0,
            source: RowSource(
              data: filterData,
              count: filterData.length,
              context: context,
            ),
            rowsPerPage: 30,
            columnSpacing: 6,
            horizontalMargin: 6,
            dataRowHeight: 52,
            headingRowColor: MaterialStatePropertyAll(light),
            columns: [
              DataColumn2(
                fixedWidth: 77,
                label: Center(
                  child: Text(
                    'NO',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              DataColumn2(
                label: Text('PROJECT NAME',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              DataColumn2(
                label: Text('LOADING',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              DataColumn2(
                label: Text('OFF LOADING',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              DataColumn2(
                label: Text('STATUS',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              const DataColumn2(
                fixedWidth: 100,
                label: Text(''),
              ),
            ],
          ),
        ),
      ],
    );
    //  Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 30),
    //   child: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           width: MediaQuery.of(context).size.width,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               Container(
    //                 width: 258.6,
    //                 height: 37.06,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(6.6),
    //                     border: Border.all(
    //                         width: 1, color: const Color(0xffC1C1C1)),
    //                     color: const Color(0xffF3F3F3)),
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(left: 10, bottom: 15),
    //                   child: TextField(
    //                     controller: controller,
    //                     style: GoogleFonts.roboto(
    //                       fontSize: 10.6,
    //                       fontWeight: FontWeight.w400,
    //                       color: Colors.black,
    //                     ),
    //                     decoration: InputDecoration(
    //                         border: InputBorder.none,
    //                         hintStyle: GoogleFonts.roboto(
    //                           fontSize: 10.6,
    //                           fontWeight: FontWeight.w400,
    //                           color: const Color(0xFF9D9D9D),
    //                         ),
    //                         hintText: "Search"),
    //                     onChanged: (value) {
    //                       setState(() {
    //                         myData = filterData!
    //                             .where((element) =>
    //                                 element.projectName.contains(value))
    //                             .toList();
    //                       });
    //                     },
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //         PaginatedDataTable(
    //           sortColumnIndex: 0,
    //           source: RowSource(
    //             myData: myData,
    //             count: myData!.length,
    //             context: context,
    //           ),
    //           rowsPerPage: 15,
    //           columnSpacing: 50,
    //           columns: [
    //             DataColumn2(
    //                 label: Text(
    //                   'No',
    //                   style: GoogleFonts.montserrat(
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.w600,
    //                     color: Colors.black,
    //                   ),
    //                 ),
    //                 fixedWidth: 28),
    //             DataColumn2(
    //                 label: Text('Depo Loaction',
    //                     style: GoogleFonts.montserrat(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w600,
    //                       color: Colors.black,
    //                     )),
    //                 fixedWidth: 150),
    //             DataColumn2(
    //                 label: Text('Project Name',
    //                     style: GoogleFonts.montserrat(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w600,
    //                       color: Colors.black,
    //                     )),
    //                 fixedWidth: 200),
    //             DataColumn2(
    //                 label: Text('Loading',
    //                     style: GoogleFonts.montserrat(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w600,
    //                       color: Colors.black,
    //                     )),
    //                 fixedWidth: 150),
    //             DataColumn2(
    //                 label: Text('Off-Loading',
    //                     style: GoogleFonts.montserrat(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w600,
    //                       color: Colors.black,
    //                     )),
    //                 fixedWidth: 150),
    //             const DataColumn2(label: Text(''), fixedWidth: 150),
    //             const DataColumn2(label: Text(''), fixedWidth: 150),
    //             const DataColumn2(label: Text(''), fixedWidth: 200),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

// class RowSource extends DataTableSource {
//   var myData;
//   final count;
//   var context;

//   RowSource({
//     required this.myData,
//     required this.count,
//     required this.context,
//   });

//   @override
//   DataRow? getRow(int index) {
//     if (index < rowCount) {
//       return recentFileDataRow(myData![index], context);
//     } else
//       return null;
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => count;

//   @override
//   int get selectedRowCount => 0;
// }

// DataRow recentFileDataRow(
//   var data,
//   context,
// ) {
//   return DataRow(
//     cells: [
//       DataCell(Text(data.no,
//           style: GoogleFonts.montserrat(
//             fontSize: 10,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ))),
//       DataCell(Text("Makasar",
//           style: GoogleFonts.montserrat(
//             fontSize: 10,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ))),
//       DataCell(Text(data.projectName,
//           style: GoogleFonts.montserrat(
//             fontSize: 10,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ))),
//       DataCell(Text(data.loading,
//           style: GoogleFonts.montserrat(
//             fontSize: 10,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ))),
//       DataCell(Text(data.offLoading,
//           style: GoogleFonts.montserrat(
//             fontSize: 10,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ))),
//       DataCell(
//         InkWell(
//           onTap: () {
//             // Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: (context) => EditLoading(
//             //               idLoading: data.id,
//             //             )));
//           },
//           child: Container(
//             decoration: BoxDecoration(
//                 color: green,
//                 border: Border.all(width: 2, color: green),
//                 borderRadius: BorderRadius.circular(15)),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text('Detail Loading',
//                   style: GoogleFonts.montserrat(
//                     fontSize: 13.3,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   )),
//             ),
//           ),
//         ),
//       ),
//       DataCell(
//         InkWell(
//           onTap: () {
//             if (data.offLoading != "") {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           DetailOffLoading(idLoading: data.id)));
//             }
//           },
//           child: Container(
//             decoration: BoxDecoration(
//                 color: green,
//                 border: Border.all(width: 2, color: green),
//                 borderRadius: BorderRadius.circular(15)),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text('Detail Off-Loading',
//                   style: GoogleFonts.montserrat(
//                     fontSize: 13.3,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   )),
//             ),
//           ),
//         ),
//       ),
//       DataCell(data.offLoading == ""
//           ? InkWell(
//               onTap: () {
//                 if (data.offLoading == "") {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => LakukanOffLoading(
//                                 idOffLoading: data.id,
//                               )));
//                 }
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 2, color: Colors.black),
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Do Off-Loading",
//                       style: GoogleFonts.montserrat(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       )),
//                 ),
//               ),
//             )
//           : Container())
//     ],
//   );
// }

class RowSource extends DataTableSource {
  var data;
  final count;
  var context;

  RowSource({
    required this.data,
    required this.count,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(data![index], context, index);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data, context, index) {
  bool id;
  if ((index + 1) % 2 == 1) {
    id = true;
  } else {
    id = false;
  }

  DateTime date;
  var formatter = DateFormat('dd MMMM yyyy');
  DateTime date2;
  var formatter2 = DateFormat('dd MMMM yyyy');
  var formattedLoading;
  var formattedExisting = data.dateExisting;

  if (data.dateLoading != null) {
    date = DateTime.parse(data.dateLoading);
    formattedLoading = formatter.format(date);
  } else {
    formattedLoading = "-";
  }

  if (data.dateExisting != "-") {
    date2 = DateTime.parse(data.dateExisting);
    formattedExisting = formatter2.format(date2);
  }
  return DataRow(
      color: MaterialStatePropertyAll(id == true ? activeTable : light),
      cells: [
        DataCell(Center(
          child: Text("${index + 1}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              )),
        )),
        DataCell(Text(data.projectName,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
        DataCell(Text(formattedLoading,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
        DataCell(Text(formattedExisting,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
        DataCell(data.status == ""
            ? InkWell(
                onTap: () {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                      text: "Do you sure to Off-loading item",
                      width: 400,
                      onConfirmBtnTap: () async {
                        var msg;
                        Response? response;

                        var dio = Dio();

                        Navigator.of(context, rootNavigator: true).pop();
                        try {
                          response = await dio.post(
                              '$changeStatusOffLoadingExistingDraft/${data.id}');

                          msg = response!.data['message'];

                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: 'Data Berhasil di Existing',
                            title: 'Success',
                            width: 400,
                            barrierDismissible: true,
                            confirmBtnColor: Colors.green,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailOffLoading(
                                  idLoading: data.id,
                                ),
                              ));
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DetailLoading(
                          //               idLoading: widget.idLoading,
                          //               isLoading: true,
                          //             )));
                        } catch (e) {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              text: e.toString(),
                              title: 'Peringatan',
                              width: 400,
                              confirmBtnColor: Colors.red);
                        }
                      });
                },
                child: Container(
                  width: 148,
                  height: 33,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: active),
                  child: Center(
                    child: Text("DO OFF_LOADING",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: light)),
                  ),
                ),
              )
            : Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: data.status == "Requested"
                        ? Colors.orange
                        : data.status == "Draft"
                            ? active
                            : Colors.green,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                      data.status == "Requested"
                          ? "REQUESTED"
                          : data.status == "Draft"
                              ? "DRAFT"
                              : data.status == "Approved"
                                  ? "APPROVED"
                                  : "-",
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      )),
                ],
              )),
        DataCell(data.status != ""
            ? InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailOffLoading(
                          idLoading: data.id,
                        ),
                      ));
                },
                child: Container(
                  width: 77,
                  height: 29,
                  decoration: BoxDecoration(
                      border: Border.all(color: active, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text("DETAIL",
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: active,
                          ))),
                ),
              )
            : Container())
      ]);
}

class ExistingMaterial {
  final dynamic id,
      projectName,
      dateLoading,
      status,
      statusLoading,
      dateExisting;

  const ExistingMaterial(
      {required this.projectName,
      required this.id,
      required this.dateExisting,
      required this.dateLoading,
      required this.status,
      required this.statusLoading});

  factory ExistingMaterial.fromJson(Map<String, dynamic> json) {
    return ExistingMaterial(
        id: json['_id'],
        projectName: json['project_name'],
        statusLoading: json['status_loading'],
        status: json["status_offloading_existing"],
        dateExisting: json['date_offloading_existing'] ?? "-",
        dateLoading: json['date_loading']);
  }

  List<dynamic> toList() => [id, projectName, dateLoading, dateExisting];
}
