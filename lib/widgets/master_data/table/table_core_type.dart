import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_core_type.dart';

import '../../../constants/controllers.dart';

class TableCoreType extends StatefulWidget {
  const TableCoreType({super.key});

  @override
  State<TableCoreType> createState() => _TableCoreTypeState();
}

class _TableCoreTypeState extends State<TableCoreType> {
  List coreType = [];

  Response? response;

  var dio = Dio();
  @override
  void initState() {
    // TODO: implement initState
    getDataCoreType();
    super.initState();
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
          DataCell(Text('${index + 1}',
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Text('${data['core_type']}',
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ))),
          DataCell(Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.50),
                        builder: (BuildContext context) {
                          return EditCoreType(
                            id: data['_id'],
                            coreTypeName: data['core_type'],
                            refresh: () => getDataCoreType(),
                          );
                        });
                  },
                  child: Container(
                    width: 77,
                    height: 29,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: active, width: 1)),
                    child: Center(
                        child: Text("Edit",
                            style: GoogleFonts.rubik(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: active,
                            ))),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    CoolAlert.show(
                        context: context,
                        type: CoolAlertType.confirm,
                        text: "Do you sure to delete this item",
                        width: 400,
                        confirmBtnText: "Delete",
                        cancelBtnText: "Cancle",
                        onConfirmBtnTap: () {
                          hapusDataCoreType('${data['_id']}');
                        });
                  },
                  child: Container(
                    width: 77,
                    height: 29,
                    decoration: BoxDecoration(
                        color: active, borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text("Delete",
                            style: GoogleFonts.rubik(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ))),
                  ),
                ),
              ],
            ),
          )),
        ]);
  }

  void getDataCoreType() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllCoreType);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          coreType = response!.data['data'];
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

  void hapusDataCoreType(id) async {
    bool status;
    var msg;
    try {
      response = await dio.delete('$hapusCoreType/$id');

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: "$msg",
            width: 400,
            onConfirmBtnTap: () {
              getDataCoreType();
            });
      } else {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: "$msg",
            width: 400);
      }
    } catch (e) {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Kesalahan Server",
          width: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 52,
        columns: [
          DataColumn2(
            fixedWidth: 77,
            label: Text(
              'NO',
              style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Text(
              'CORE TYPE',
              style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const DataColumn2(
            label: Text(''),
          ),
        ],
        rows: List.generate(
            coreType.length, (index) => _resultsAPI(index, coreType[index])));
  }
}
