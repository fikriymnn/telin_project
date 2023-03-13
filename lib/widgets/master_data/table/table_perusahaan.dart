import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_perusahaan.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

class TablePerusahaan extends StatefulWidget {
  const TablePerusahaan({super.key});

  @override
  State<TablePerusahaan> createState() => _TablePerusahaanState();
}

class _TablePerusahaanState extends State<TablePerusahaan> {
  late List<Perusahaan> perusahaan;
  List<Perusahaan> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    perusahaan = Perusahaan.getPerusahaan();
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
              child: Text('Company',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
            ),
          ),
          DataColumn2(
            label: Center(
              child: Text('Address',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
            ),
          ),
          DataColumn2(
            label: Center(
              child: Text('City',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
            ),
          ),
          DataColumn2(
            label: Center(
              child: Text('State',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
            ),
          ),
          DataColumn2(
            label: Center(
              child: Text('Phone',
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
        rows: _createRowsManufacture());
  }

  List<DataRow> _createRowsManufacture() {
    return perusahaan
        .map((perusahaan) => DataRow(cells: [
              DataCell(Text(perusahaan.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 14.6,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Center(
                child: Text(perusahaan.perusahaanName,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.6,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              )),
              DataCell(Center(
                child: Text(perusahaan.address,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.6,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              )),
              DataCell(Center(
                child: Text(perusahaan.city,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.6,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              )),
              DataCell(Center(
                child: Text(perusahaan.state,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.6,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              )),
              DataCell(Center(
                child: Text(perusahaan.phone,
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
                              return EditPerusahaan();
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

class Perusahaan {
  final String no, perusahaanName, address, city, state, phone;

  const Perusahaan(
      {required this.no,
      required this.perusahaanName,
      required this.address,
      required this.city,
      required this.state,
      required this.phone});

  static List<Perusahaan> getPerusahaan() {
    return <Perusahaan>[
      Perusahaan(
          no: "1",
          perusahaanName: "Perusahaan",
          address: "Addreas",
          city: "City",
          state: "State",
          phone: "Phone"),
      Perusahaan(
          no: "2",
          perusahaanName: "Perusahaan",
          address: "Addreas",
          city: "City",
          state: "State",
          phone: "Phone"),
      Perusahaan(
          no: "3",
          perusahaanName: "Perusahaan",
          address: "Addreas",
          city: "City",
          state: "State",
          phone: "Phone"),
      Perusahaan(
          no: "4",
          perusahaanName: "Perusahaan",
          address: "Addreas",
          city: "City",
          state: "State",
          phone: "Phone"),
      Perusahaan(
          no: "5",
          perusahaanName: "Perusahaan",
          address: "Addreas",
          city: "City",
          state: "State",
          phone: "Phone")
    ];
  }
}
