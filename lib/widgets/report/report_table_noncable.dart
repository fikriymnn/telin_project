import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/style.dart';

class NonCableReport extends StatelessWidget {
  const NonCableReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.print),
            label: Text("Print All"),
            style: ElevatedButton.styleFrom(
              backgroundColor: active, // Background color
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable2(
                columnSpacing: 6,
                horizontalMargin: 6,
                dataRowHeight: 30,
                minWidth: 3000,
                border: TableBorder(top: BorderSide(), bottom: BorderSide()),
                columns: [
                  DataColumn2(
                    label: Text(
                      'No',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 46,
                  ),
                  DataColumn2(
                    label: Text(
                      'Location',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 95.25,
                  ),
                  DataColumn2(
                    label: Text(
                      'Nama Barang',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 200.25,
                  ),
                  DataColumn2(
                    label: Text(
                      'Part Number',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 155.25,
                  ),
                  DataColumn2(
                    label: Text(
                      'Serial Number',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 155.25,
                  ),
                  DataColumn2(
                    label: Text(
                      'System',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 115.25,
                  ),
                  DataColumn2(
                    label: Text(
                      """Weight
(Kg)""",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 115.25,
                  ),
                  DataColumn2(
                    label: Text(
                      "QTY",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 95.25,
                  ),
                  DataColumn2(
                    label: Text(
                      "Unit",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 95.25,
                  ),
                  DataColumn2(
                    label: Text(
                      "Remark",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 135.25,
                  ),
                  DataColumn2(
                    label: Text(
                      "",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    fixedWidth: 115.25,
                  ),
                ],
                rows: List.generate(
                  20,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text('1',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('Cage 1',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('REPEATER',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('4FP#5-91E RP24 730 AAA',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('NA',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('SMPCS P#1',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('3.00',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('1',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('Unit',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('-',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(
                        Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 66.6,
                              height: 28.6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.6),
                                  color: Color(0xFFDDDDDD)),
                              child: Center(
                                child: Text(
                                  "Print",
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
