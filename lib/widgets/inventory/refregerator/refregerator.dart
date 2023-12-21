import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;

class TableRefregerator extends StatefulWidget {
  const TableRefregerator({super.key});

  @override
  State<TableRefregerator> createState() => _TableRefregeratorState();
}

class _TableRefregeratorState extends State<TableRefregerator> {
  List refregerator = [1];

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDatarefregerator();
    super.initState();
  }

  DataRow _resultsAPI(index, data) {
    return DataRow(cells: [
      DataCell(Text("${data['no'] ?? "-"}",
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
      DataCell(Text("${data['system'] ?? "-"}",
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
    ]);
  }

  late PlutoGridStateManager stateManager;

  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'NO',
      field: 'no',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'LOCATION',
      field: 'location',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'ITEM NAME',
      field: 'item_name',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'PART NUMBER',
      field: 'part_number',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'SERIAL NUMBER',
      field: 'serial_number',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'SYSTEM',
      field: 'system',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'WEIGHT',
      field: 'weight',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'QTY',
      field: 'qty',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
    PlutoColumn(
      title: 'UNIT',
      field: 'unit',
      type: PlutoColumnType.text(),
      enableContextMenu: true,
      enableSorting: true,
    ),
  ];

  void getDatarefregerator() async {
    try {
      response = await dio.get(getRefrigerator);

      setState(() {
        refregerator = response!.data;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

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
                  refregerator.length,
                  (index) => PlutoRow(
                    cells: {
                      'no': PlutoCell(value: '${index + 1}'),
                      'location': PlutoCell(
                          value:
                              '${refregerator[index]['rak_number'] == null ? "" : refregerator[index]['rak_number']}'),
                      'item_name': PlutoCell(
                          value:
                              '${refregerator[index]['item_name'] == null ? "" : refregerator[index]['item_name']}'),
                      'part_number': PlutoCell(
                          value:
                              '${refregerator[index]['part_number'] == null ? "" : refregerator[index]['part_number']}'),
                      'serial_number': PlutoCell(
                          value:
                              '${refregerator[index]['serial_number'] == null ? "" : refregerator[index]['serial_number']}'),
                      'system': PlutoCell(
                          value:
                              '${refregerator[index]['system'] == null ? "" : refregerator[index]['system']}'),
                      'weight': PlutoCell(
                          value:
                              '${refregerator[index]['weight_kg'] == null ? "" : refregerator[index]['weight_kg']}'),
                      'qty': PlutoCell(
                          value:
                              '${refregerator[index]['qty'] == null ? "" : refregerator[index]['qty']}'),
                      'unit': PlutoCell(
                          value:
                              '${refregerator[index]['unit'] == null ? "" : refregerator[index]['unit']}'),
                      'description': PlutoCell(
                          value:
                              '${refregerator[index]['description'] == null ? "" : refregerator[index]['description']}'),
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

    //  Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 24),
    //   child: DataTable2(
    //       columnSpacing: 6,
    //       horizontalMargin: 6,
    //       dataRowHeight: 40,
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
    //               'LOCATION',
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Text(
    //               'ITEM NAME',
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 250),
    //         DataColumn2(
    //             label: Text(
    //               'PART NUMBER',
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Text(
    //               "SERIAL NUMBER",
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
    //                   style: GoogleFonts.montserrat(
    //                     fontSize: 10,
    //                     fontWeight: FontWeight.w600,
    //                     color: Colors.black,
    //                   ),
    //                   onChanged: (String? newValue) {
    //                     setState(() {
    //                       selectedValueSystem = newValue!;
    //                     });
    //                   },
    //                   value: selectedValueSystem,
    //                   items: dropdownItemsSystem),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Text(
    //               "WEIGHT (KG)",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Text(
    //               "QTY",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Text(
    //               "UNIT",
    //               style: GoogleFonts.montserrat(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             fixedWidth: 100),
    //         DataColumn2(
    //             label: Center(
    //               child: Text(
    //                 "DESCRIPTION",
    //                 style: GoogleFonts.montserrat(
    //                   fontSize: 10,
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.black,
    //                 ),
    //               ),
    //             ),
    //             fixedWidth: 250),
    //       ],
    //       rows: _createRowsArmoring()),
    // );
  }

  List<DataRow> _createRowsArmoring() {
    return List.generate(refregerator.length,
        (index) => _resultsAPI(index, refregerator[index]));
  }
}
