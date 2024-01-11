import 'dart:html' as html;
import 'package:csv/csv.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/inventory/exportPopUp.dart';
import 'package:telin_project/widgets/searchField.dart';

class TableFloor extends StatefulWidget {
  const TableFloor({super.key});

  @override
  State<TableFloor> createState() => _TableFloorState();
}

class _TableFloorState extends State<TableFloor> {
  List<DataFloor> floorData = [];
  List<DataFloor> filterData = [];

  Response? response;

  var dio = Dio();

  TextEditingController filename = TextEditingController();
  TextEditingController locationSearch = TextEditingController();
  TextEditingController itemNameSearch = TextEditingController();
  TextEditingController partNumberSearch = TextEditingController();
  TextEditingController serialNumberSearch = TextEditingController();
  TextEditingController systemSearch = TextEditingController();
  TextEditingController weightSearch = TextEditingController();
  TextEditingController qtySearch = TextEditingController();
  TextEditingController unitSearch = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getDataFloor();
    super.initState();
  }

  void getDataFloor() async {
    try {
      response = await dio.get(getFloor);
      if (response!.statusCode == 200) {
        List<dynamic> jsonResponse = response!.data;
        List<DataFloor> floor =
            jsonResponse.map((json) => DataFloor.fromJson(json)).toList();
        setState(() {
          floorData = floor;
          filterData = floor;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response!.statusMessage.toString()),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  void exportData(
    List<DataFloor> data,
  ) {
    try {
      // Membuat list dari list of rows (data model)
      List<List<dynamic>> rows = [
        [
          'LOCATION',
          'ITEM NAME',
          'PART NUMBER',
          'SERIAL NUMBER',
          'SYSTEM',
          'WEIGHT (KG)',
          'QTY',
          'UNIT',
        ],
        ...data.map((product) => product.toList())
      ];

      String csv = const ListToCsvConverter().convert(rows);

      final fileName = '${filename.text}.csv';

      final blob = html.Blob([csv]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..target = 'download'
        ..download = fileName
        ..click();

      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print('Error exporting to CSV: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  barrierColor: Colors.black.withOpacity(0.50),
                  builder: (BuildContext context) {
                    return ExportDataPopUp(
                        controller: filename,
                        export: () {
                          if (filename.text == '') {
                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: 'Peringatan',
                                text: 'Nama File Tidak Boleh Kosong',
                                width: 400,
                                confirmBtnColor: Colors.red);
                          } else {
                            exportData(filterData);
                          }
                        });
                  });
            },
            child: Container(
              width: 146,
              height: 33,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: active),
              child: Center(
                child: Text("EXPORT DATA",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: light)),
              ),
            ),
          ),
          Expanded(
            child: PaginatedDataTable2(
              source: RowSource(
                myData: filterData,
                count: filterData.length,
                context: context,
              ),
              columnSpacing: 0,
              horizontalMargin: 0,
              dataRowHeight: 52,
              minWidth: 2070,
              headingRowHeight: 75,
              rowsPerPage: 50,
              columns: [
                DataColumn2(
                  fixedWidth: 77,
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'NO',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 40,
                        color: activeTable,
                      )
                    ],
                  ),
                ),
                DataColumn2(
                  fixedWidth: 160,
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'LOCATION',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      BuildSearchField(
                        controller: locationSearch,
                        onChange: onSearchTextChanged,
                      )
                    ],
                  ),
                ),
                DataColumn2(
                  fixedWidth: 200,
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'ITEM NAME',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      BuildSearchField(
                        controller: itemNameSearch,
                        onChange: onSearchTextChanged,
                      )
                    ],
                  ),
                ),
                DataColumn2(
                  fixedWidth: 200,
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'PART NUMBER',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      BuildSearchField(
                        controller: partNumberSearch,
                        onChange: onSearchTextChanged,
                      )
                    ],
                  ),
                ),
                DataColumn2(
                  fixedWidth: 200,
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'SERIAL NUMBER',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      BuildSearchField(
                        controller: serialNumberSearch,
                        onChange: onSearchTextChanged,
                      )
                    ],
                  ),
                ),
                DataColumn2(
                  fixedWidth: 200,
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'SYSTEM',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      BuildSearchField(
                        controller: systemSearch,
                        onChange: onSearchTextChanged,
                      )
                    ],
                  ),
                ),
                DataColumn2(
                  fixedWidth: 200,
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'WEIGHT (KG)',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      BuildSearchField(
                        controller: weightSearch,
                        onChange: onSearchTextChanged,
                      )
                    ],
                  ),
                ),
                DataColumn2(
                  fixedWidth: 150,
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'QTY',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      BuildSearchField(
                        controller: qtySearch,
                        onChange: onSearchTextChanged,
                      )
                    ],
                  ),
                ),
                DataColumn2(
                  fixedWidth: 150,
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'UNIT',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      BuildSearchField(
                        controller: unitSearch,
                        onChange: onSearchTextChanged,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onSearchTextChanged(String text) {
    setState(() {
      filterData = floorData
          .where((data) =>
              data.location
                  .toString()
                  .toLowerCase()
                  .contains(locationSearch.text.toLowerCase()) &&
              data.system
                  .toString()
                  .toLowerCase()
                  .contains(systemSearch.text.toLowerCase()) &&
              data.itemName
                  .toString()
                  .toLowerCase()
                  .contains(itemNameSearch.text.toLowerCase()) &&
              data.partNumber
                  .toString()
                  .toLowerCase()
                  .contains(partNumberSearch.text.toLowerCase()) &&
              data.serialNumber
                  .toString()
                  .toLowerCase()
                  .contains(serialNumberSearch.text.toLowerCase()) &&
              data.weight
                  .toString()
                  .toLowerCase()
                  .contains(weightSearch.text.toLowerCase()) &&
              data.qty
                  .toString()
                  .toLowerCase()
                  .contains(qtySearch.text.toLowerCase()) &&
              data.unit
                  .toString()
                  .toLowerCase()
                  .contains(unitSearch.text.toLowerCase()))
          .toList();
    });
  }
}

class DataFloor {
  dynamic location;
  dynamic system;
  dynamic itemName;
  dynamic partNumber;
  dynamic serialNumber;
  dynamic weight;
  dynamic qty;
  dynamic unit;

  dynamic remark;

  DataFloor(
      {required this.location,
      required this.system,
      required this.itemName,
      required this.partNumber,
      required this.serialNumber,
      required this.weight,
      required this.qty,
      required this.remark,
      required this.unit});

  factory DataFloor.fromJson(Map<String, dynamic> json) {
    return DataFloor(
      itemName: json["item_name"],
      partNumber: json["part_number"],
      unit: json["unit"],
      qty: json["qty"],
      location: json["rak_number"],
      weight: json["weight_kg"],
      serialNumber: json["serial_number"],
      remark: json["remark"],
      system: json["system"],
    );
  }

  List<dynamic> toList() => [
        location,
        system,
        itemName,
        partNumber,
        serialNumber,
        weight,
        qty,
      ];
}

class RowSource extends DataTableSource {
  var myData;
  final count;
  var context;

  RowSource({
    required this.myData,
    required this.count,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index], context, index);
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
  return DataRow(
      color: MaterialStatePropertyAll(id == false ? activeTable : light),
      cells: [
        DataCell(Center(
          child: Text("${index + 1}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              )),
        )),
        DataCell(Text("${data.location ?? "-"}",
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
        DataCell(Text("${data.itemName ?? "-"}",
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
        DataCell(Text("${data.partNumber ?? "-"}",
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
        DataCell(Text("${data.serialNumber ?? "-"}",
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
        DataCell(Text("${data.system ?? "-"}",
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
        DataCell(Text("${data.weight ?? "-"}",
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
        DataCell(Text("${data.qty ?? "-"}",
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
        DataCell(Text("${data.unit ?? "-"}",
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ))),
      ]);
}
