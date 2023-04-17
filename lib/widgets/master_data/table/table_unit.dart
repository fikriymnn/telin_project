import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/pages/master_data/unit.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_unit.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableUnit extends StatefulWidget {
  const TableUnit({super.key});

  @override
  State<TableUnit> createState() => _TableUnitState();
}

class _TableUnitState extends State<TableUnit> {
  List unit = [];
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    getDataUnit();
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
        child: Text('${data['unit']}',
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
                // showDialog(
                //     context: context,
                //     barrierColor: Colors.transparent,
                //     builder: (BuildContext context) {
                //       return EditUnit();
                //     });
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditUnit(
                          id: data['_id'],
                          unitName: data['unit'],
                        )));
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
                bool ok = true;
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: 'Do you sure to delete ${data['unit']} ?',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    customAsset: 'assets/gift/error.gif',
                    width: 400,
                    confirmBtnColor: Colors.green,
                    barrierDismissible: true,
                    onConfirmBtnTap: () {
                      hapusDataUnit('${data['_id']}');
                      navigationController.navigateTo(UnitPageRoute);
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

  void getDataUnit() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllUnit);

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          unit = response!.data['data'];
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

  void hapusDataUnit(id) async {
    bool status;
    var msg;
    try {
      response = await dio.delete('$hapusUnit/$id');

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        FocusScope.of(context).unfocus();
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

  void getDataById(int id) async {
    bool status;
    var msg;
    try {
      var response = await dio.get('$getIdUnit/$id');
      return response.data;
    } on DioError catch (e) {
      // handle error
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
              child: Text('Unit Name',
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
            unit.length, (index) => _resultsAPI(index, unit[index])));
  }
}
