import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_manufacture.dart';

import '../../../constants/controllers.dart';

class TableManufacture extends StatefulWidget {
  const TableManufacture({super.key});

  @override
  State<TableManufacture> createState() => _TableManufactureState();
}

class _TableManufactureState extends State<TableManufacture> {
  List manufactur = [];

  Response? response;

  var dio = Dio();
  @override
  void initState() {
    // TODO: implement initState
    getDataManufacture();
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
        child: Text('${data['manufacturer']}',
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditManufacture(
                          id: data['_id'],
                          namaManufacture: data['manufacturer'],
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
            const SizedBox(
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
                      hapusDataManufactur('${data['_id']}');
                      navigationController.navigateTo(ManufacturerPageRoute);
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

  void getDataManufacture() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllManufacturer);

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          manufactur = response!.data['data'];
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

  void hapusDataManufactur(id) async {
    bool status;
    var msg;
    try {
      response = await dio.delete('$hapusManufacturer/$id');

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
        border: const TableBorder(top: BorderSide(), bottom: BorderSide()),
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
              child: Text('Manufacture Name',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
            ),
          ),
          const DataColumn2(
            label: Text(''),
          ),
        ],
        rows: List.generate(manufactur.length,
            (index) => _resultsAPI(index, manufactur[index])));
  }
}
