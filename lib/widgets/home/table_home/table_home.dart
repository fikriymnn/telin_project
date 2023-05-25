import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;
import 'package:telin_project/widgets/order/loading/edit_loading.dart';

class TableHome extends StatefulWidget {
  const TableHome({super.key});

  @override
  State<TableHome> createState() => _TableHomeState();
}

class _TableHomeState extends State<TableHome> {
  List offLoading = [];

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataLoading();
    super.initState();
  }

  DataRow _resultsAPI(index, data) {
    return DataRow(cells: [
      DataCell(Text("${index + 1}",
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("Makasar",
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['project_name'] == null ? "" : data['project_name']}",
              style: GoogleFonts.montserrat(
                fontSize: 13.3,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(Text("-",
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("-",
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
        Center(
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return EditLoading(idLoading: data['_id']);
                  });
            },
            child: Container(
              width: 100,
              height: 28.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.6),
                  color: const Color(0xFFDDDDDD)),
              child: Center(
                child: Text(
                  "Loading",
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        Center(
          child: InkWell(
            onTap: () {
              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return const DetailTableHome();
              //     });
            },
            child: Container(
              width: 100,
              height: 28.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.6),
                  color: const Color(0xFFDDDDDD)),
              child: Center(
                child: Text(
                  "Off-Loading",
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }

  void getDataLoading() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllOffLoading);

      setState(() {
        offLoading = response!.data;
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
  // late PlutoGridStateManager stateManager;

  // final List<PlutoColumn> columns = [
  //   PlutoColumn(
  //     title: 'NO',
  //     field: 'no',
  //     type: PlutoColumnType.text(),
  //   ),
  //   PlutoColumn(
  //     title: 'DEPO LOCATION',
  //     field: 'depo',
  //     type: PlutoColumnType.text(),
  //   ),
  //   PlutoColumn(
  //     title: 'PROJECT NAME',
  //     field: 'project',
  //     type: PlutoColumnType.text(),
  //     enableContextMenu: true,
  //     enableSorting: true,
  //   ),
  //   PlutoColumn(
  //     title: 'LOADING',
  //     field: 'armoring',
  //     type: PlutoColumnType.text(),
  //     enableContextMenu: true,
  //     enableSorting: true,
  //   ),
  //   PlutoColumn(
  //     title: 'OFF-LOADING',
  //     field: 'cable_type',
  //     type: PlutoColumnType.text(),
  //     enableContextMenu: true,
  //     enableSorting: true,
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 146, right: 146),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "PROJECT OVERVIEW",
                            style: GoogleFonts.roboto(
                              fontSize: 33.3,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFED1D25),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 242,
                    height: 27.3,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        border: Border.all(width: 1),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 13.3,
                        right: 13.3,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextField(
                                style: GoogleFonts.roboto(
                                  fontSize: 11.3,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 11.3,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF9D9D9D),
                                    ),
                                    hintText: "Search"),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.search,
                            size: 16,
                            color: Color(0xFF9D9D9D),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  dataRowHeight: 40,
                  minWidth: 3000,
                  border: const TableBorder(
                      top: BorderSide(),
                      left: BorderSide(),
                      right: BorderSide(),
                      bottom: BorderSide()),
                  columns: [
                    DataColumn2(
                      label: Center(
                        child: Text(
                          'No',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      fixedWidth: 66.6,
                    ),
                    DataColumn2(
                      label: Center(
                        child: Text('Depo Location',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ),
                      fixedWidth: 150,
                    ),
                    DataColumn2(
                        fixedWidth: 270,
                        label: Center(
                          child: Text("Project's Name",
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                        ),
                        size: ColumnSize.L),
                    DataColumn2(
                      fixedWidth: 95,
                      label: Center(
                        child: Text('Loading',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    DataColumn2(
                      fixedWidth: 125,
                      label: Center(
                        child: Text('Off-Loading',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    const DataColumn2(
                      fixedWidth: 80,
                      label: Text(''),
                    ),
                    const DataColumn2(
                      fixedWidth: 80,
                      label: Text(''),
                    ),
                  ],
                  rows: List.generate(offLoading.length,
                      (index) => _resultsAPI(index, offLoading[index]))

                  // List<DataRow>.generate(
                  //     100,
                  //     (index) => DataRow(cells: [
                  //           DataCell(Center(
                  //             child: Text('1',
                  //                 style: GoogleFonts.roboto(
                  //                   fontSize: 13.3,
                  //                   fontWeight: FontWeight.w600,
                  //                   color: Colors.black,
                  //                 )),
                  //           )),
                  //           DataCell(Center(
                  //             child: Text('Makasar',
                  //                 style: GoogleFonts.roboto(
                  //                   fontSize: 13.3,
                  //                   fontWeight: FontWeight.w600,
                  //                   color: Colors.black,
                  //                 )),
                  //           )),
                  //           DataCell(Center(
                  //             child: Text(
                  //                 'REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA',
                  //                 style: GoogleFonts.roboto(
                  //                   fontSize: 13.3,
                  //                   fontWeight: FontWeight.w600,
                  //                   color: Colors.black,
                  //                 )),
                  //           )),
                  //           DataCell(Center(
                  //             child: Text('01/01/2023',
                  //                 style: GoogleFonts.roboto(
                  //                   fontSize: 13.3,
                  //                   fontWeight: FontWeight.w600,
                  //                   color: Colors.black,
                  //                 )),
                  //           )),
                  //           DataCell(Center(
                  //             child: Text('-',
                  //                 style: GoogleFonts.roboto(
                  //                   fontSize: 13.3,
                  //                   fontWeight: FontWeight.w600,
                  //                   color: Colors.black,
                  //                 )),
                  //           )),
                  //           DataCell(
                  //             Center(
                  //               child: InkWell(
                  //                 onTap: () {
                  //                   showDialog(
                  //                       context: context,
                  //                       builder: (BuildContext context) {
                  //                         return const DetailTableHome();
                  //                       });
                  //                 },
                  //                 child: Container(
                  //                   width: 66.6,
                  //                   height: 28.6,
                  //                   decoration: BoxDecoration(
                  //                       borderRadius:
                  //                           BorderRadius.circular(6.6),
                  //                       color: const Color(0xFFDDDDDD)),
                  //                   child: Center(
                  //                     child: Text(
                  //                       "Detail",
                  //                       style: GoogleFonts.roboto(
                  //                         fontSize: 13.3,
                  //                         fontWeight: FontWeight.w600,
                  //                         color: Colors.black,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           )
                  //         ]))
                  ),
            ),
          ],
        ));
  }
}
