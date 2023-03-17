import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_armoring_type.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableArmoringType extends StatefulWidget {
  const TableArmoringType({super.key});

  @override
  State<TableArmoringType> createState() => _TableArmoringTypeState();
}

class _TableArmoringTypeState extends State<TableArmoringType> {
  late List<Armoring> armoring;
  List<Armoring> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    armoring = Armoring.getArmoring();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 30,
            border: TableBorder(top: BorderSide(), bottom: BorderSide()),
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
          ),
          DataColumn2(
            label: Center(
              child: Text('Armoring Name',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
            ),
          ),
          DataColumn2(
            label: Text(''),
          ),
        ],
        rows: _createRowsArmoring());
  }

  List<DataRow> _createRowsArmoring() {
    return armoring
        .map((armoring) => DataRow(cells: [
              DataCell(Text(armoring.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 14.6,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Center(
                child: Text(armoring.armoringName,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.6,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              )),
              DataCell(Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return EditArmoringType();
                            });
                      },
                      child: Container(
                        width: 50,
                        height: 19.46,
                        decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text("Edit",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.confirm,
                          text: 'Do you sure to delete this item',
                          confirmBtnText: 'Yes',
                          cancelBtnText: 'No',
                          customAsset: 'assets/gift/error.gif',
                          width: 400,
                          confirmBtnColor: Colors.green,
                          
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 19.46,
                        decoration: BoxDecoration(
                            color: active,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text("Delete",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                  ],
                ),
              )),
            ]))
        .toList();
  }
}

class Armoring {
  final String no, armoringName;

  const Armoring({
    required this.no,
    required this.armoringName,
  });

  static List<Armoring> getArmoring() {
    return <Armoring>[
      Armoring(
        no: "1",
        armoringName: "Armoring",
      ),
      Armoring(
        no: "2",
        armoringName: "Armoring",
      ),
      Armoring(
        no: "3",
        armoringName: "Armoring",
      ),
      Armoring(
        no: "4",
        armoringName: "Armoring",
      ),
      Armoring(
        no: "5",
        armoringName: "Armoring",
      )
    ];
  }
}
