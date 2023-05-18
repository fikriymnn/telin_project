import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/setting/akun.dart';

class TableAkunDeleteSmall extends StatefulWidget {
  const TableAkunDeleteSmall({super.key});

  @override
  State<TableAkunDeleteSmall> createState() => _TableAkunDeleteSmallState();
}

class _TableAkunDeleteSmallState extends State<TableAkunDeleteSmall> {
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
        border: const TableBorder(
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
            fixedWidth: 42.6,
          ),
          DataColumn2(
            label: Text('Name',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            fixedWidth: 116.4,
          ),
          DataColumn2(
              fixedWidth: 148.4,
              label: Text("Username",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              size: ColumnSize.L),
          DataColumn2(
            fixedWidth: 130.6,
            label: Text('Password',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            fixedWidth: 160.4,
            label: Text('Role',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          const DataColumn2(
            fixedWidth: 60.8,
            label: Text(''),
          ),
          const DataColumn2(
            fixedWidth: 35.53,
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
                      const CircleAvatar(
                        radius: 5,
                        backgroundColor: Color(0xff24EB2C),
                      ),
                      const SizedBox(
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
                  const DataCell(Text(""))
                ]))
        .toList();
  }
}
