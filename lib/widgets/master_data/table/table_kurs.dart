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
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ))),
      DataCell(Text('USD',
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ))),
      DataCell(Text('${data}',
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
                      return EditKurs(
                        kurs: data,
                        refresh: () => getDataKurs(),
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
        dataRowHeight: 52,
        columns: [
          DataColumn2(
            fixedWidth: 77,
            label: Text(
              'NO',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            fixedWidth: 237,
            label: Text(
              'CURRENCY',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Text('EXCHANGE RATE (IDR)',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          const DataColumn2(
            label: Text(''),
          ),
        ],
        rows: <DataRow>[
          DataRow(color: MaterialStatePropertyAll(activeTable), cells: [
            DataCell(Text('1',
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ))),
            DataCell(Text('USD',
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ))),
            DataCell(Text('${kurs}',
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
                            return EditKurs(
                              kurs: kurs,
                              refresh: () => getDataKurs(),
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
                ],
              ),
            )),
          ])
        ]);
  }
}
