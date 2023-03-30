import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_core_type.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

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
    return DataRow(cells: [
      DataCell(Text('${index + 1}',
          style: GoogleFonts.montserrat(
            fontSize: 14.6,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Center(
        child: Text('${data['core_type']}',
            style: GoogleFonts.montserrat(
              fontSize: 14.6,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )),
      )),
      DataCell(Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    barrierColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return EditCoreType();
                    });
              },
              child: Container(
                width: 50,
                height: 19.46,
                decoration: BoxDecoration(
                    color: green, borderRadius: BorderRadius.circular(6)),
                child: Center(
                    child: Text("Edit",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ))),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: 'Do you sure to delete this item',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    customAsset: 'assets/gift/error.gif',
                    width: 400,
                    confirmBtnColor: Colors.green,
                    onConfirmBtnTap: () {
                      hapusDataCoreType('${data['_id']}');
                      navigationController.navigateTo(CoreTypePageRoute);
                    });
              },
              child: Container(
                width: 50,
                height: 19.46,
                decoration: BoxDecoration(
                    color: active, borderRadius: BorderRadius.circular(6)),
                child: Center(
                    child: Text("Delete",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
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
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: '$msg',
            title: 'Peringatan',
            width: 400,
            barrierDismissible: true,
            confirmBtnColor: Colors.red);
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

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 30,
        border: TableBorder(top: BorderSide(), bottom: BorderSide()),
        columns: [
          DataColumn2(
            label: Text(
              'No',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Center(
              child: Text('Core Type',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
            ),
          ),
          DataColumn2(
            label: Text(''),
          ),
        ],
        rows: List.generate(
            coreType.length, (index) => _resultsAPI(index, coreType[index])));
  }
}
