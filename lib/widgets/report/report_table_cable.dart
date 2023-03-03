import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

class CableReport extends StatelessWidget {
  const CableReport({super.key});

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
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 46,
                ),
                DataColumn2(
                  label: Text(
                    'Core Type',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 95.25,
                ),
                DataColumn2(
                  label: Text(
                    'Manufacturer',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 115.25,
                ),
                DataColumn2(
                  label: Text(
                    'Armoring Type',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 115.25,
                ),
                DataColumn2(
                  label: Text(
                    'Core Type',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 115.25,
                ),
                DataColumn2(
                  label: Text(
                    '\u03A3 Core',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 65.25,
                ),
                DataColumn2(
                  label: Text(
                    'PCS',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 65.25,
                ),
                DataColumn2(
                  label: Text(
                    """Length
(Meter)""",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 95.25,
                ),
                DataColumn2(
                  label: Text(
                    """MIN WD
(Meter)""",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 95.25,
                ),
                DataColumn2(
                  label: Text(
                    """MAX WD
(Meter)""",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 95.25,
                ),
                DataColumn2(
                  label: Text(
                    """MIN SPARE LENGTH
(Meter)""",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 95.25,
                ),
                DataColumn2(
                  label: Text(
                    """Deviasi
(Meter)""",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 95.25,
                ),
                DataColumn2(
                  label: Text(
                    "Availability",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 95.25,
                ),
                DataColumn2(
                  label: Text(
                    " ",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  fixedWidth: 95.25,
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
                    DataCell(Text('MINISUB-36',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('NSW',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('DA',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('EX-2000',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('12',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('10',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('31504',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('0',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('20',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('300',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('31204',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                    DataCell(Text('CUKUP',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff84D600),
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
        ],
      ),
    );
  }
}
