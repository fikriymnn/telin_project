import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_location.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableLocation extends StatefulWidget {
  const TableLocation({super.key});

  @override
  State<TableLocation> createState() => _TableLocationState();
}

class _TableLocationState extends State<TableLocation> {
  late List<Location> location;
 List <Location> selectedRow = [];
 @override
  void initState() {
    // TODO: implement initState
    location = Location.getLocation();
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
              child: Text('Location Name',
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
    return location
        .map((location) => DataRow(
          
          cells: [
              DataCell(Text(location.no,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.6,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ))),
                  DataCell(Center(
                    child: Text(location.locationName,
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
                            return EditLocation();
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
                                                  "Delete This Location ?",
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





class Location {
    final String no,locationName;

    const Location({
      required this.no,
      required this.locationName,
     
    });

    static List<Location> getLocation(){
      return <Location>[
        Location(no: "1", locationName: "Location", ),
        Location(no: "2", locationName: "Location", ),
        Location(no: "3", locationName: "Location",  ),
        Location(no: "4", locationName: "Location",  ),
        Location(no: "5", locationName: "Location", )
      ];
    }
  }