import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

class CableReport extends StatefulWidget {
  const CableReport({super.key});

  @override
  State<CableReport> createState() => _CableReportState();
}

class _CableReportState extends State<CableReport> {
  String _date = "Select Date";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    DatePicker.showDatePicker(context, showTitleActions: true,
                        onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      print('confirm $date');
                      _date = '${date.year}/${date.month}/${date.day}';
                      setState(() {});
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  icon: Icon(Icons.date_range),
                  label: Text("$_date"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: dark,
                    // Background color
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.print),
                  label: Text("Print All"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: active, // Background color
                  ),
                ),
              ),
            ],
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
                      'Label ID',
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
                      'Cable Type',
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
                      'Manuacturer',
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
                      'Armoring Type',
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
                      'Core Type',
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
                      "\u03A3 Core",
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
                      """Length
(Meter)""",
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
                      """Tank
(Inner)""",
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
                      """Tank
(Outer)""",
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
                      "Remark",
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
                      "Evidence",
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
                      " ",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
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
                      DataCell(Text('20208',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('UNKOWN-12',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('OCC-SC500',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('NEC',
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
                      DataCell(Text('-',
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
                      DataCell(Text('628',
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
                      DataCell(Text('Tank 6',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('IGG-S14.5 # S146C01-3',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))),
                      DataCell(Text('SCRAP',
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
