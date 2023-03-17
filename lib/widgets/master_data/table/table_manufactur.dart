import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_manufacture.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableManufacture extends StatefulWidget {
  const TableManufacture({super.key});

  @override
  State<TableManufacture> createState() => _TableManufactureState();
}

class _TableManufactureState extends State<TableManufacture> {
  late List<Manufacture> manufacture;
 List <Manufacture> selectedRow = [];
 @override
  void initState() {
    // TODO: implement initState
    manufacture = Manufacture.getManufacture();
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
              child: Text('Manufacture Name',
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
        rows: _createRowsManufacture()
                );
  }
 List<DataRow> _createRowsManufacture() {
    return manufacture
        .map((manufacture) => DataRow(
          
          cells: [
              DataCell(Text(manufacture.no,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.6,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ))),
                  DataCell(Center(
                    child: Text(manufacture.manufactureName,
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
                            return EditManufacture();
                          });
                          },
                          child: Container(
                            width: 50,
                            height: 19.46,
                             decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text("Edit",style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ))
                            ),
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
                              child: Text("Delete",style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ))
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ]))
        .toList();
  }
}





class Manufacture {
    final String no,manufactureName;

    const Manufacture({
      required this.no,
      required this.manufactureName,
     
    });

    static List<Manufacture> getManufacture(){
      return <Manufacture>[
        Manufacture(no: "1", manufactureName: "Manufacture", ),
        Manufacture(no: "2", manufactureName: "Manufacture", ),
        Manufacture(no: "3", manufactureName: "Manufacture",  ),
        Manufacture(no: "4", manufactureName: "Manufacture",  ),
        Manufacture(no: "5", manufactureName: "Manufacture", )
      ];
    }
  }