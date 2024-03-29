import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';

class TableHomeMedium extends StatelessWidget {
  const TableHomeMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 90, right: 90),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "PROJECT OVERVIEW",
                            style: GoogleFonts.roboto(
                              fontSize: 22.2,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFED1D25),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 161.3,
                    height: 18,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        border: Border.all(width: 1),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.8,
                        right: 8.8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 6.6),
                              child: TextField(
                                style: GoogleFonts.roboto(
                                  fontSize: 7.53,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF9D9D9D),
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 7.53,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF9D9D9D),
                                    ),
                                    hintText: "Search"),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.search,
                            size: 10.6,
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
                  border: const TableBorder(top: BorderSide(),left: BorderSide(),right: BorderSide(),bottom: BorderSide()),
                  columns: [
                    DataColumn2(
                      label: Center(
                        child: Text(
                          'No',
                          style: GoogleFonts.roboto(
                            fontSize: 13.3,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      fixedWidth: 56,
                    ),
                    DataColumn2(
                      label: Center(
                        child: Text('Depo Location',
                            style: GoogleFonts.roboto(
                              fontSize: 13.3,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ),
                      fixedWidth: 100,
                    ),
                    DataColumn2(
                        fixedWidth: 293.3,
                        label: Center(
                          child: Text("Project's Name",
                              style: GoogleFonts.roboto(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                        ),
                        size: ColumnSize.L),
                    DataColumn2(
                      fixedWidth: 63.3,
                      label: Center(
                        child: Text('Loading',
                            style: GoogleFonts.roboto(
                              fontSize: 13.3,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    DataColumn2(
                      fixedWidth: 100,
                      label: Center(
                        child: Text('Off-Loading',
                            style: GoogleFonts.roboto(
                              fontSize: 13.3,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    const DataColumn2(
                      fixedWidth: 71.3,
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
                                    fontSize: 8.86,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                            )),
                            DataCell(Center(
                              child: Text('Makasar',
                                  style: GoogleFonts.roboto(
                                    fontSize: 8.86,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                            )),
                            DataCell(Center(
                              child: Text(
                                  'REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA',
                                  style: GoogleFonts.roboto(
                                    fontSize: 8.86,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                            )),
                            DataCell(Center(
                              child: Text('01/01/2023',
                                  style: GoogleFonts.roboto(
                                    fontSize: 8.86,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                            )),
                            DataCell(Center(
                              child: Text('-',
                                  style: GoogleFonts.roboto(
                                    fontSize: 8.86,
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
                                          return const DetailTableHome();
                                        });
                                  },
                                  child: Container(
                                    width: 44.4,
                                    height: 19.06,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.4),
                                        color: const Color(0xFFDDDDDD)),
                                    child: Center(
                                      child: Text(
                                        "Detail",
                                        style: GoogleFonts.roboto(
                                          fontSize:  8.86,
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
