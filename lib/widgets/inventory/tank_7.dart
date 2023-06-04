import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;

class TableTank7 extends StatefulWidget {
  const TableTank7({super.key});

  @override
  State<TableTank7> createState() => _TableTank7State();
}

class _TableTank7State extends State<TableTank7> {
  String? selectionSystem;
  String? selectionArmoringType;
  List system = [];
  List armoringType = [];
  List tank7 = [1];
  late List<DataTank> dataTable;

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataTank7();
    getDataSystem();
    getDataArmoringType();

    super.initState();
  }

  late PlutoGridStateManager stateManager;

  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'NO',
      field: 'no',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'LABLE',
      field: 'lable',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'SYSTEM',
      field: 'system',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'ARMORING TYPE',
      field: 'armoring',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'CABLE TYPE',
      field: 'cable_type',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'MANUFACTURER',
      field: 'manufacturer',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'LENGTH(METER)',
      field: 'length',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'CORE TYPE',
      field: 'core_type',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: '\u03A3 CORE',
      field: 'core',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'TANK',
      field: 'tank',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'TANK LOCATION',
      field: 'tank_location',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'TANK LEVEL',
      field: 'tank_level',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'REMARK',
      field: 'remark',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'DESCRIPTION',
      field: 'description',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
  ];

  DataRow _resultsAPI(index, data) {
    return DataRow(cells: [
      DataCell(Text("${index + 1}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text('',
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['system'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['armoring_type'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['cable_type'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['manufacturer'] ?? "-"}",
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
      DataCell(Text("${data['core_type'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['core'] ?? "-"}",
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
      DataCell(Text("${data['description'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          )))
    ]);
  }

  void getDataTank7() async {
    try {
      response = await dio.get(getTank7);

      setState(() {
        tank7 = response!.data;
      });
    } catch (e) {
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     text: 'Terjadi Kesalahan Pada Server Kami',
      //     title: 'Peringatan',
      //     width: 400,
      //     confirmBtnColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  void getDataArmoringType() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllArmoring);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          armoringType = response!.data['data'];
        });
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: '$msg',
            title: 'Peringatan',
            width: 400,
            confirmBtnColor: Colors.red);
      }
    } catch (e) {
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     text: 'Terjadi Kesalahan Pada Server Kami',
      //     title: 'Peringatan',
      //     width: 400,
      //     confirmBtnColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  void getDataSystem() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllSystem);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          system = response!.data['data'];
        });
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: '$msg',
            title: 'Peringatan',
            width: 400,
            confirmBtnColor: Colors.red);
      }
    } catch (e) {
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     text: 'Terjadi Kesalahan Pada Server Kami',
      //     title: 'Peringatan',
      //     width: 400,
      //     confirmBtnColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  List<DropdownMenuItem<String>> get dropdownItemsSystem {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "SYSTEM", child: Text("SYSTEM")),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PlutoGrid(
                columns: columns,
                rows: List.generate(
                  tank7.length,
                  (index) => PlutoRow(
                    cells: {
                      'no': PlutoCell(value: '${index + 1}'),
                      'lable': PlutoCell(
                          value:
                              '${tank7[index]['lable'] == null ? "" : tank7[index]['lable']}'),
                      'system': PlutoCell(
                          value:
                              '${tank7[index]['system'] == null ? "" : tank7[index]['system']}'),
                      'armoring': PlutoCell(
                          value:
                              '${tank7[index]['armoring_type'] == null ? "" : tank7[index]['armoring_type']}'),
                      'cable_type': PlutoCell(
                          value:
                              '${tank7[index]['cable_type'] == null ? "" : tank7[index]['cable_type']}'),
                      'manufacturer': PlutoCell(
                          value:
                              '${tank7[index]['manufacturer'] == null ? "" : tank7[index]['manufacturer']}'),
                      'length': PlutoCell(
                          value:
                              '${tank7[index]['length_report'] == null ? "" : tank7[index]['length_report']}'),
                      'core_type': PlutoCell(
                          value:
                              '${tank7[index]['core_type'] == null ? "" : tank7[index]['core_type']}'),
                      'core': PlutoCell(
                          value:
                              '${tank7[index]['core'] == null ? "" : tank7[index]['core']}'),
                      'tank': PlutoCell(
                          value:
                              '${tank7[index]['tank'] == null ? "" : tank7[index]['tank']}'),
                      'tank_location': PlutoCell(
                          value:
                              '${tank7[index]['tank_location'] == null ? "" : tank7[index]['tank_location']}'),
                      'tank_level': PlutoCell(
                          value:
                              '${tank7[index]['tank_level'] == null ? "" : tank7[index]['tank_level']}'),
                      'remark': PlutoCell(
                          value:
                              '${tank7[index]['remark'] == null ? "" : tank7[index]['remark']}'),
                      'description': PlutoCell(
                          value:
                              '${tank7[index]['description'] == null ? "" : tank7[index]['description']}'),
                    },
                  ),
                ),
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  event.stateManager.setShowColumnFilter(true);
                },
                configuration: const PlutoGridConfiguration(
                  enableMoveDownAfterSelecting: true,
                  enterKeyAction: PlutoGridEnterKeyAction.editingAndMoveDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 24),
    //   child: DataTable2(
    //       columnSpacing: 6,
    //       horizontalMargin: 6,
    //       dataRowHeight: 30,
    //       showBottomBorder: false,
    //       minWidth: 3000,
    //       columns: [
    //         DataColumn2(
    //             label: Text(
    //               'NO',
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 50),
    //         DataColumn2(
    //             label: Text(
    //               'LABLE',
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: DropdownButtonHideUnderline(
    //               child: DropdownButton(
    //                   isExpanded: true,
    //                   hint: Text(
    //                     "SYSTEM",
    //                     overflow: TextOverflow.ellipsis,
    //                     style: GoogleFonts.montserrat(
    //                       fontSize: 10,
    //                       fontWeight: FontWeight.w600,
    //                       color: Colors.black,
    //                     ),
    //                   ),
    //                   style: GoogleFonts.montserrat(
    //                     fontSize: 10,
    //                     fontWeight: FontWeight.w600,
    //                     color: Colors.black,
    //                   ),
    //                   onChanged: (String? newValue) {
    //                     setState(() {
    //                       selectionSystem = newValue!;
    //                     });
    //                   },
    //                   value: selectionSystem,
    //                   items: system.map((system) {
    //                     return DropdownMenuItem(
    //                       value: system['_id'].toString(),
    //                       child: Text(
    //                         system['system'],
    //                         overflow: TextOverflow.ellipsis,
    //                       ),
    //                     );
    //                   }).toList()),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: DropdownButtonHideUnderline(
    //               child: DropdownButton(
    //                 hint: Text(
    //                   "ARMORING TYPE",
    //                   style: GoogleFonts.montserrat(
    //                     fontSize: 10,
    //                     fontWeight: FontWeight.w600,
    //                     color: Colors.black,
    //                   ),
    //                 ),
    //                 style: GoogleFonts.montserrat(
    //                   fontSize: 10,
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.black,
    //                 ),
    //                 onChanged: (String? newValue) {
    //                   setState(() {
    //                     selectionArmoringType = newValue!;
    //                   });
    //                 },
    //                 value: selectionArmoringType,
    //                 items: armoringType.map((armoringType) {
    //                   return DropdownMenuItem(
    //                     value: armoringType['_id'].toString(),
    //                     child: Text(armoringType['armoring_type']),
    //                   );
    //                 }).toList(),
    //               ),
    //             ),
    //             fixedWidth: 120),
    //         DataColumn2(
    //             label: Text(
    //               "CABLE TYPE",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Text(
    //               "MANUFACTURE",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Text(
    //               """LENGTH
    //   (METER)
    //           """,
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Text(
    //               "CORE TYPE",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Text(
    //               "\u03A3 CORE",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 90),
    //         DataColumn2(
    //             label: Text(
    //               "TANK",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 50),
    //         DataColumn2(
    //             label: Text(
    //               """TANK
    //   LOCATION""",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 60),
    //         DataColumn2(
    //             label: Text(
    //               "TANK LEVEL",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Text(
    //               "REMARK",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 150),
    //         DataColumn2(
    //             label: Text(
    //               "DESKRIPTION",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 80),
    //       ],
    //       rows: List.generate(
    //           tank7.length, (index) => _resultsAPI(index, tank7[index]))),
    // );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class DataTank {
  String no;
  String lable;
  String system;
  String armoring;
  String cableType;
  String manufacture;
  String length;
  String coreType;
  String core;
  String tank;
  String tankLevel;
  String remark;
  String deskription;

  DataTank(
      {required this.no,
      required this.lable,
      required this.system,
      required this.armoring,
      required this.cableType,
      required this.manufacture,
      required this.length,
      required this.coreType,
      required this.tank,
      required this.tankLevel,
      required this.remark,
      required this.deskription,
      required this.core});

  var dio = Dio();
}
