import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/setting/akun.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableAkunMobile extends StatefulWidget {
  const TableAkunMobile({super.key});

  @override
  State<TableAkunMobile> createState() => _TableAkunMobileState();
}

class _TableAkunMobileState extends State<TableAkunMobile> {
    late List<Akun> akun;
 List <Akun> selectedRow = [];
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
        border: TableBorder(top: BorderSide(), bottom: BorderSide(),),
        columns: [
          DataColumn2(
            label: Text(
              'No',
              style: GoogleFonts.montserrat(
                fontSize: 10.6,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            fixedWidth: 28,
          ),
          DataColumn2(
            label: Text('Name',
                style: GoogleFonts.montserrat(
                  fontSize: 10.6,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            fixedWidth: 60,
          ),
          DataColumn2(
              fixedWidth: 70,
              label: Text("Username",
                  style: GoogleFonts.montserrat(
                    fontSize: 10.6,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              size: ColumnSize.L),
          DataColumn2(
            fixedWidth: 70,
            label: Text('Password',
                style: GoogleFonts.montserrat(
                  fontSize: 10.6,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            fixedWidth: 106,
            label: Text('Role',
                style: GoogleFonts.montserrat(
                  fontSize: 10.6,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            fixedWidth: 50,
            label: Text(''),
          ),
          DataColumn2(
            fixedWidth: 23,
            label: Text(''),
          ),
        ],
        rows: _createRows());
  }

  List<DataRow> _createRows() {
    return akun
        .map((akun) => DataRow(
         
          cells: [
            DataCell(Text(akun.no,
                      style: GoogleFonts.montserrat(
                        fontSize: 9.7,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ))),
                  DataCell(Text(akun.name,
                      style: GoogleFonts.montserrat(
                        fontSize: 9.7,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ))),
                  DataCell(Text(akun.username,
                      style: GoogleFonts.montserrat(
                        fontSize: 9.7,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ))),
                  DataCell(Text(akun.password,
                      style: GoogleFonts.montserrat(
                        fontSize: 9.7,
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
                            fontSize: 9.7,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          )),
                    ],
                  )),
                  DataCell(
                    Center(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return DetailAkun();
                              });
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
                  DataCell(Center(
                    child: InkWell(
                      onTap: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.confirm,
                          text: 'Do you sure to delete this account',
                          confirmBtnText: 'Yes',
                          cancelBtnText: 'No',
                          customAsset: 'assets/gift/error.gif',
                          width: 400,
                          confirmBtnColor: Colors.green,
                          
                        );
                      },
                      child: Container(
                        width: 21.41,
                        height: 19.46,
                        decoration: BoxDecoration(
                            color: Color(0xffEC1D26),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text("X",
                              style: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  )),
            ]))
        .toList();
  }
}
