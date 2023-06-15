import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/form/input_length_cable.dart';

import '../../../../api/configAPI.dart';

class TableCableLoading extends StatefulWidget {
  const TableCableLoading({super.key, required this.loadingId});
  final String loadingId;

  @override
  State<TableCableLoading> createState() => _TableCableLoadingState();
}

class _TableCableLoadingState extends State<TableCableLoading> {
  late List<CableLoading> cableLoading;
  List<CableLoading> selectedRow = [];
  @override
  String? selectionSystem;
  String? selectionArmoringType;
  List system = [];
  List armoringType = [];
  List spareCable = [];
  List<CableLoading>? filterData;
  List<CableLoading>? myData;
  bool sort = true;

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState

    getDataCable();
    getDataSystem();
    getDataArmoringType();

    super.initState();
  }

  onsortColumSystem(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.system.compareTo(b.system));
      } else {
        filterData!.sort((a, b) => b.system.compareTo(a.system));
      }
    }
  }

  void getDataCable() async {
    try {
      response = await dio.get(getAllCable);

      setState(() {
        spareCable = response!.data;
        myData = List.generate(spareCable.length, (index) {
          var data = spareCable[index];
          return CableLoading(
              no: "${index + 1}",
              id: "${data['_id'] ?? ""}",
              system: "${spareCable[index]['system'] ?? "-"}",
              armoringType: "${spareCable[index]['armoring_type'] ?? "-"}",
              length: "${spareCable[index]['length_report'] ?? "-"}",
              lable: "${spareCable[index]['label_id'] ?? "-"}",
              tank: "${spareCable[index]['tank'] ?? "-"}",
              tankLocation: "${spareCable[index]['tank_location'] ?? "-"}",
              tankLevel: "${spareCable[index]['tank_level'] ?? "-"}",
              remark: "${spareCable[index]['remark'] ?? "-"}",
              coreType: "${spareCable[index]['core_type'] ?? "-"}",
              core: "${spareCable[index]['core'] ?? "-"}");
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
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
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
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
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

  String? selectedValueSystem;
  String? selectedValueArmoring;

  TextEditingController controller = TextEditingController();

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
                          label: Text(
                            'LABLE',
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
                                          .contains(selectedValueSystem!))
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
                          onSort: (columnIndex, ascending) {
                            setState(() {
                              sort = !sort;
                            });

                            onsortColumSystem(columnIndex, ascending);
                          },
                          fixedWidth: 100),
                      DataColumn2(
                          label: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text(
                                "ARMORING TYPE",
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
                                  selectedValueArmoring = newValue!;
                                  myData = filterData!
                                      .where((element) => element.armoringType
                                          .contains(selectedValueArmoring!))
                                      .toList();
                                });
                              },
                              value: selectedValueArmoring,
                              items: armoringType.map((armoringType) {
                                return DropdownMenuItem(
                                  value:
                                      armoringType['armoring_type'].toString(),
                                  child: Text(
                                    armoringType['armoring_type'],
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
                          fixedWidth: 120),
                      DataColumn2(
                          label: Text(
                            """LENGTH
(METER)
              """,
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 100),
                      DataColumn2(
                          label: Text(
                            "CORE TYPE",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 100),
                      DataColumn2(
                          label: Text(
                            "\u03A3 CORE",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 100),
                      DataColumn2(
                          label: Text(
                            "TANK",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 50),
                      DataColumn2(
                          label: Text(
                            "TANK LOCATION",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 100),
                      DataColumn2(
                          label: Text(
                            "TANK LEVEL",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 100),
                      DataColumn2(
                          label: Text(
                            "REMARK",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 150),
                      DataColumn2(
                          label: Text(
                            "ACTION",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          fixedWidth: 100),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
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
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text(data.lable,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text(data.system,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text(data.armoringType,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text(data.length,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text(data.coreType,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text(data.core,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text(data.tank,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text(data.tankLocation,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text(data.tankLevel,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text(data.remark,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return InputLengthCable(
                    idCable: data.id,
                    idLoading: idLoading,
                  );
                });
          },
          child: Text("Take",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: active,
              ))))
    ],
  );
}

class CableLoading {
  final String no,
      id,
      system,
      armoringType,
      length,
      lable,
      tank,
      tankLocation,
      tankLevel,
      remark,
      coreType,
      core;

  const CableLoading({
    required this.no,
    required this.id,
    required this.system,
    required this.armoringType,
    required this.length,
    required this.lable,
    required this.tank,
    required this.tankLocation,
    required this.tankLevel,
    required this.remark,
    required this.coreType,
    required this.core,
  });
}
