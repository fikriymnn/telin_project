import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/form/input_qty_non_cable.dart';

class TableNonCableLoading extends StatefulWidget {
  const TableNonCableLoading({super.key, required this.loadingId});
  final String loadingId;

  @override
  State<TableNonCableLoading> createState() => _TableNonCableLoadingState();
}

class _TableNonCableLoadingState extends State<TableNonCableLoading> {
  List sparekit = [];
  List system = [];

  List location = [];
  String? selectionSystem;
  String? selectionLocation;
  List<KitLoading>? filterData;
  List<KitLoading>? myData;
  bool sort = true;

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataSparekit();
    getDataSystem();
    getDataLocation();
    super.initState();
  }

  void getDataSparekit() async {
    try {
      response = await dio.get(getAllKit);

      setState(() {
        sparekit = response!.data;
        myData = List.generate(sparekit.length, (index) {
          return KitLoading(
              no: "${index + 1}",
              id: "${sparekit[index]['_id'] ?? "-"}",
              system: "${sparekit[index]['system'] ?? "-"}",
              location: "${sparekit[index]['rak_number'] ?? "-"}",
              itemName: "${sparekit[index]['item_name'] ?? "-"}",
              partNumber: "${sparekit[index]['part_number'] ?? "-"}",
              serialNumber: "${sparekit[index]['serial_number'] ?? "-"}",
              weight: "${sparekit[index]['weight_kg'] ?? "-"}",
              qty: "${sparekit[index]['qty'] ?? "-"}",
              unit: "${sparekit[index]['unit'] ?? "-"}");
        });
        filterData = myData;
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

  List<DropdownMenuItem<String>> get dropdownItemsLocation {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "LOCATION", child: Text("LOCATION")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }

  String? selectedValueLocation;
  String? selectedValueSystem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                child: Theme(
                  data: ThemeData.light(),
                  child: PaginatedDataTable(
                    sortColumnIndex: 0,
                    sortAscending: sort,
                    source: RowSource(
                      myData: myData,
                      context: context,
                      idLoading: widget.loadingId,
                      count: myData!.length,
                    ),
                    rowsPerPage: 30,
                    columnSpacing: 8,
                    columns: [
                      DataColumn2(
                          label: Text(
                            'NO',
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 50),
                      DataColumn2(
                          label: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text(
                                "LOCATION",
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValueLocation = newValue!;
                                  myData = filterData!
                                      .where((element) => element.location
                                          .contains(
                                              selectedValueLocation.toString()))
                                      .toList();
                                });
                              },
                              value: selectedValueLocation,
                              items: location.map((location) {
                                return DropdownMenuItem(
                                  value: location['location'].toString(),
                                  child: Text(
                                    location['location'],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          fixedWidth: 100),
                      DataColumn2(
                          label: Text(
                            "ITEM NAME",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 220),
                      DataColumn2(
                          label: Text(
                            "PART NUMBER",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 200),
                      DataColumn2(
                          label: Text(
                            "SERIAL NUMBER",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 100),
                      DataColumn2(
                          label: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text(
                                "SYSTEM",
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValueSystem = newValue!;
                                  myData = filterData!
                                      .where((element) => element.system
                                          .contains(
                                              selectedValueSystem.toString()))
                                      .toList();
                                });
                              },
                              value: selectedValueSystem,
                              items: system.map((system) {
                                return DropdownMenuItem(
                                  value: system['system'].toString(),
                                  child: Text(
                                    system['system'],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          fixedWidth: 100),
                      DataColumn2(
                          label: Text(
                            "QTY",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 50),
                      DataColumn2(
                          label: Text(
                            "UNIT",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 100),
                      DataColumn2(
                          label: Text(
                            "ACTION",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 50),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
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
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }

  void getDataLocation() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllLocation);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          location = response!.data['data'];
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
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }
}

class RowSource extends DataTableSource {
  var myData;
  final count;
  var context;
  String idLoading;
  RowSource({
    required this.myData,
    required this.count,
    required this.context,
    required this.idLoading,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index], context, idLoading);
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

DataRow recentFileDataRow(var data, context, idLoading) {
  return DataRow(
    cells: [
      DataCell(Text(data.no,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.location,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.itemName,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.partNumber,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.serialNumber,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.system,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.qty,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.unit,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
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
                  );
                });
          },
          child: Text("Take",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: active,
              )))),
    ],
  );
}

class KitLoading {
  final String no,
      id,
      system,
      location,
      itemName,
      partNumber,
      serialNumber,
      weight,
      qty,
      unit;

  const KitLoading({
    required this.no,
    required this.id,
    required this.system,
    required this.location,
    required this.itemName,
    required this.partNumber,
    required this.serialNumber,
    required this.weight,
    required this.qty,
    required this.unit,
  });
}
