import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/setting/akun.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableAkun extends StatefulWidget {
  const TableAkun({super.key});

  @override
  State<TableAkun> createState() => _TableAkunState();
}

class _TableAkunState extends State<TableAkun> {
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
        rows: _createRows()
        );
  }


  List<DataRow> _createRows() {
    return akun
        .map((akun) => DataRow(
         
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
                        showDialog(
                            context: context,
                            barrierColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  width: 486.6,
                                  height: 322.6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26.6),
                                      color: Colors.white,
                                      
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 18),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 170.6,
                                          height: 170.6,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/cross_icon.png'))),
                                        ),
                                        SizedBox(height: 30,),
                                        Center(
                                          child: Text("Delete This Account ?",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 14.6,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              )),
                                        ),
                                        SizedBox(height: 15.3,),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: (){},
                                                child: Container(
                                                  width: 141.3,
                                                  height: 44.6,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(6),
                                                      color: Color(0xff45CA52)),
                                                  child: Center(
                                                    child: Text("Yes",
                                                        style:
                                                            GoogleFonts.montserrat(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 85.3,),
                                              InkWell(
                                                onTap: (){},
                                                child: Container(
                                                  width: 141.3,
                                                  height: 44.6,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(6),
                                                      color: Color(0xffEC1D26)),
                                                  child: Center(
                                                    child: Text("No",
                                                        style:
                                                            GoogleFonts.montserrat(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
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
