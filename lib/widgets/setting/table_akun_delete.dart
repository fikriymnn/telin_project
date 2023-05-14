import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/setting/akun.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableAkunDelete extends StatefulWidget {
  const TableAkunDelete({super.key});

  @override
  State<TableAkunDelete> createState() => _TableAkunDeleteState();
}

class _TableAkunDeleteState extends State<TableAkunDelete> {
  late List<Akun> akun;
  List<Akun> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    akun = Akun.getAkun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 30,
        minWidth: 3000,
        border: TableBorder(
          top: BorderSide(),
          bottom: BorderSide(),
        ),
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
            fixedWidth: 64,
          ),
          DataColumn2(
            label: Text('Name',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            fixedWidth: 174.6,
          ),
          DataColumn2(
              fixedWidth: 222.6,
              label: Text("Username",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              size: ColumnSize.L),
          DataColumn2(
            fixedWidth: 196.6,
            label: Text('Password',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            fixedWidth: 240.6,
            label: Text('Role',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            fixedWidth: 91.3,
            label: Text(''),
          ),
          DataColumn2(
            fixedWidth: 53.3,
            label: Text(''),
          ),
        ],
        rows: _createRows());
  }

  List<DataRow> _createRows() {
    return akun
        .map((akun) => DataRow(
                selected: selectedRow.contains(akun),
                onSelectChanged: (isSelected) {
                  setState(() {
                    final isAdding = isSelected != null && isSelected;

                    isAdding ? selectedRow.add(akun) : selectedRow.remove(akun);
                  });
                },
                cells: [
                  DataCell(Text(akun.no,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.6,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ))),
                  DataCell(Text(akun.name,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.6,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ))),
                  DataCell(Text(akun.username,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.6,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ))),
                  DataCell(Text(akun.password,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.6,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ))),
                  DataCell(Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Color(0xff24EB2C),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(akun.role,
                          style: GoogleFonts.montserrat(
                            fontSize: 14.6,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          )),
                    ],
                  )),
                  DataCell(
                    Center(
                      child: InkWell(
                        onTap: () {
                          // showDialog(
                          //     context: context,
                          //     barrierColor: Colors.transparent,
                          //     builder: (BuildContext context) {
                          //       return DetailAkun();
                          //     });
                        },
                        child: Text('Detail...',
                            style: GoogleFonts.montserrat(
                              fontSize: 13.3,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.5),
                            )),
                      ),
                    ),
                  ),
                  DataCell(Text(""))
                ]))
        .toList();
  }
}
