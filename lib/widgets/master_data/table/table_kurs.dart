import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';

import 'package:telin_project/widgets/master_data/edit_data/edit_kurs.dart';

class TableKurs extends StatefulWidget {
  const TableKurs({super.key});

  @override
  State<TableKurs> createState() => _TableKursState();
}

class _TableKursState extends State<TableKurs> {
  double kurs = 0.0;

  Response? response;

  var dio = Dio();
  @override
  void initState() {
    // TODO: implement initState
    getDataKurs();
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
        child: Text('${data}',
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
                    builder: (context) => EditKurs(
                          kurs: data,
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
          ],
        ),
      )),
    ]);
  }

  void getDataKurs() async {
    bool status;
    var msg;

    try {
      response = await dio.get(getAllKurs);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          kurs = response!.data['usd'];
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
              child: Text('Kurs',
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
        rows: <DataRow>[
          DataRow(cells: [
            DataCell(Text('1',
                style: GoogleFonts.montserrat(
                  fontSize: 14.6,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ))),
            DataCell(Center(
              child: Text(kurs.toString(),
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
                          builder: (context) => EditKurs(
                                kurs: kurs,
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
                ],
              ),
            )),
          ])
        ]);
  }
}
