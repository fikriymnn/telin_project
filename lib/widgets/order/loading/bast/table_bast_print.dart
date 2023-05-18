import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TableBastLoadingPrint extends StatefulWidget {
  const TableBastLoadingPrint({super.key});

  @override
  State<TableBastLoadingPrint> createState() => _TableBastLoadingPrintState();
}

class _TableBastLoadingPrintState extends State<TableBastLoadingPrint> {
  late List<Loading> loading;
  List<Loading> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    loading = Loading.getLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        
        
        dataRowHeight: 20,
        minWidth: 3000,
        border: TableBorder.all(),
        columns: [
          DataColumn2(
              label: Center(
                child: Text(
                  'ID',
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              fixedWidth: 50),
          DataColumn2(
              label: Center(
                child: Text('SYSTEM',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 70),
          DataColumn2(
              label: Center(
                child: Text('TYPE',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 70),
          DataColumn2(
              label: Center(
                child: Text('MFG',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 70),
          DataColumn2(
              label: Center(
                child: Text('ARMOUR',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 80),
          DataColumn2(
              label: Center(
                child: Text('\u03A3 CORE',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 50),
          DataColumn2(

              label: Text(
                '''RESINTANCE
(n/Km)''',
                style: GoogleFonts.montserrat(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              fixedWidth: 90),

          DataColumn2(
              label: Text(
                '''LENGTH
(Km)
              ''',
                style: GoogleFonts.montserrat(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 80),
          DataColumn2(
              label: Center(
                child: Text('REMARK',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 105),
          // const DataColumn2(
          //   label: Text(''),
          //   fixedWidth: 150
          // ),
        ],
        rows: _createRowsManufacture());
  }

  List<DataRow> _createRowsManufacture() {
    return loading
        .map((loading) => DataRow(cells: [
              DataCell(Text(loading.id,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Center(
                child: Text(loading.system,
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              )),
              DataCell(

                Text(loading.type,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(loading.mfg,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(loading.armour,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(loading.core,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(
                Text(loading.resistance,
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              ),

              DataCell(Text(loading.lenght,
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),),
              DataCell(
                Text(loading.remark,
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ))
              )
            ]))
        .toList();
  }
}

class Loading {
  final String id, system, type, mfg, armour, core,resistance,lenght,remark;

  const Loading(
      {required this.id,
      required this.system,
      required this.type,
      required this.armour,
      required this.mfg,
      required this.core,
      required this.resistance,
      required this.lenght,
      required this.remark});

  static List<Loading> getLoading() {
    return <Loading>[
      const Loading(
          id: "1",
          system: "project",
          type: "Addreas",
          armour: "armour",
          mfg: "mfg",
          core: "core",
          lenght: "2439",
          remark: "",
          resistance: "-"
          ),
      const Loading(
          id: "2",
          system: "project",
          type: "Addreas",
          armour: "armour",
          mfg: "mfg",
          core: "core",
          lenght: "2439",
          remark: "",
          resistance: "-",
          ),
      
    ];
  }
}
