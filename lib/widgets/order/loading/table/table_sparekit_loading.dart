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
import 'package:telin_project/widgets/order/loading/form/input_qty_non_cable.dart';
import 'package:telin_project/widgets/searchField.dart';

class TableSparekitTakeLoading extends StatefulWidget {
  const TableSparekitTakeLoading(
      {super.key, required this.idLoading, required this.refresh});
  final String idLoading;
  final dynamic refresh;

  @override
  State<TableSparekitTakeLoading> createState() =>
      _TableSparekitTakeLoadingState();
}

class _TableSparekitTakeLoadingState extends State<TableSparekitTakeLoading> {
  List<DataSpareKit> spareKitData = [];
  List<DataSpareKit> filterData = [];

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
    getDataSpareKit();
    super.initState();
  }

  void getDataSpareKit() async {
    try {
      response = await dio.get(getRak);
      if (response!.statusCode == 200) {
        List<dynamic> jsonResponse = response!.data;
        List<DataSpareKit> spareKit =
            jsonResponse.map((json) => DataSpareKit.fromJson(json)).toList();
        setState(() {
          spareKitData = spareKit;
          filterData = spareKit;
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PaginatedDataTable2(
              source: RowSource(
                  myData: filterData,
                  count: filterData.length,
                  context: context,
                  idLoading: widget.idLoading,
                  refresh: () => widget.refresh()),
              columnSpacing: 0,
              horizontalMargin: 0,
              dataRowHeight: 52,
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
                DataColumn2(
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'ACTION',
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onSearchTextChanged(String text) {
    setState(() {
      filterData = spareKitData
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

class DataSpareKit {
  dynamic id;
  dynamic location;
  dynamic system;
  dynamic itemName;
  dynamic partNumber;
  dynamic serialNumber;
  dynamic weight;
  dynamic qty;
  dynamic unit;

  dynamic remark;

  DataSpareKit(
      {required this.id,
      required this.location,
      required this.system,
      required this.itemName,
      required this.partNumber,
      required this.serialNumber,
      required this.weight,
      required this.qty,
      required this.remark,
      required this.unit});

  factory DataSpareKit.fromJson(Map<String, dynamic> json) {
    return DataSpareKit(
      id: json['_id'],
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
  String idLoading;
  dynamic refresh;

  RowSource(
      {required this.myData,
      required this.count,
      required this.context,
      required this.idLoading,
      required this.refresh});

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(
          myData![index], context, index, idLoading, () => refresh());
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

DataRow recentFileDataRow(
    var data, context, index, idLoading, dynamic refresh) {
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
        DataCell(TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return InputQtyNonCable(
                        idKit: data.id,
                        idLoading: idLoading,
                        qtyAvailable: data.qty,
                        refresh: () => refresh());
                  });
            },
            child: Text("TAKE",
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: active,
                )))),
      ]);
}
