import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';

class TableHome extends StatelessWidget {
  const TableHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 146, right: 146),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "PROJECT OVERVIEW",
                            style: GoogleFonts.roboto(
                              fontSize: 33.3,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFED1D25),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 242,
                    height: 27.3,
                    decoration: BoxDecoration(
                        color: Color(0xFFF3F3F3),
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 13.3,
                        right: 13.3,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextField(
                                style: GoogleFonts.roboto(
                                  fontSize: 11.3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF9D9D9D),
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 11.3,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF9D9D9D),
                                    ),
                                    hintText: "Search"),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.search,
                            size: 16,
                            color: Color(0xFF9D9D9D),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  dataRowHeight: 40,
                  minWidth: 3000,
                  
                  columns: [
                    DataColumn2(
                      label: Center(
                        child: Text(
                          'No',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      fixedWidth: 84,
                    ),
                    DataColumn2(
                      label: Center(
                        child: Text('Depo Location',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ),
                      fixedWidth: 140,
                    ),
                    DataColumn2(
                        fixedWidth: 440,
                        label: Center(
                          child: Text("Project's Name",
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                        ),
                        size: ColumnSize.L),
                    DataColumn2(
                      fixedWidth: 95,
                      label: Center(
                        child: Text('Loading',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    DataColumn2(
                      fixedWidth: 150,
                      label: Center(
                        child: Text('Off-Loading',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    DataColumn2(
                      fixedWidth: 107,
                      label: Text(''),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                      100,
                      
                      (index) => DataRow(

                        cells: [

                            DataCell(Center(
                              child: Text('1',
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                            )),
                            DataCell(Center(
                              child: Text('Makasar',
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                            )),
                            DataCell(Center(
                              child: Text(
                                  'REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA',
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                            )),
                            DataCell(Center(
                              child: Text('01/01/2023',
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                            )),
                            DataCell(Center(
                              child: Text('-',
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                            )),
                            DataCell(
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return DetailTableHome();
                                        });
                                  },
                                  child: Container(
                                    width: 66.6,
                                    height: 28.6,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.6),
                                        color: Color(0xFFDDDDDD)),
                                    child: Center(
                                      child: Text(
                                        "Detail",
                                        style: GoogleFonts.roboto(
                                          fontSize: 13.3,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]))),
            ),
          ],
        ));
  }
}
