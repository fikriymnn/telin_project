import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
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
 List <Perusahaan> selectedRow = [];
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
        rows: _createRowsManufacture()
                );
  }
 List<DataRow> _createRowsManufacture() {
    return perusahaan
        .map((perusahaan) => DataRow(
          
          cells: [
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
                            width: 21.41,
                            height: 19.46,
                            
                            child: Center(
                              child: Icon(Icons.edit,color: green,)
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
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
                                        borderRadius:
                                            BorderRadius.circular(26.6),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 18),
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
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Center(
                                              child: Text(
                                                  "Delete This Perusahan ?",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14.6,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15.3,
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      width: 141.3,
                                                      height: 44.6,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          color: Color(
                                                              0xff45CA52)),
                                                      child: Center(
                                                        child: Text("Yes",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 85.3,
                                                  ),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      width: 141.3,
                                                      height: 44.6,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          color: Color(
                                                              0xffEC1D26)),
                                                      child: Center(
                                                        child: Text("No",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.white,
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
                      ],
                    ),
                  )),
            ]))
        .toList();
  }
}





class Perusahaan {
    final String no,perusahaanName,address,city,state,phone;

    const Perusahaan({
      required this.no,
      required this.perusahaanName,
      required this.address,
      required this.city,
      required this.state,
      required this.phone
     
    });

    static List<Perusahaan> getPerusahaan(){
      return <Perusahaan>[
        Perusahaan(no: "1", perusahaanName: "Perusahaan",address: "Addreas" ,city: "City",state: "State",phone: "Phone"),
        Perusahaan(no: "2", perusahaanName: "Perusahaan",address: "Addreas" ,city: "City",state: "State",phone: "Phone" ),
        Perusahaan(no: "3", perusahaanName: "Perusahaan", address: "Addreas" ,city: "City",state: "State",phone: "Phone" ),
        Perusahaan(no: "4", perusahaanName: "Perusahaan", address: "Addreas" ,city: "City",state: "State",phone: "Phone" ),
        Perusahaan(no: "5", perusahaanName: "Perusahaan",address: "Addreas" ,city: "City",state: "State",phone: "Phone" )
      ];
    }
  }