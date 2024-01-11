import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;

import '../../order/existing_material.dart/detail_turnover.dart';

class TableHome extends StatefulWidget {
  const TableHome({super.key});

  @override
  State<TableHome> createState() => _TableHomeState();
}

class _TableHomeState extends State<TableHome> {
  List offLoading = [];
  bool sort = true;
  List<ProjectOverview>? filterData;
  List<ProjectOverview>? myData;
  TextEditingController controller = TextEditingController();

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataLoading();
    super.initState();
  }

  DataRow _resultsAPI(index, data) {
    return DataRow(cells: [
      DataCell(Text("${index + 1}",
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("Makasar",
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['project_name'] == null ? "" : data['project_name']}",
              style: GoogleFonts.montserrat(
                fontSize: 13.3,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ))),
      DataCell(Text("${data['submitted_date_loading'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("${data['submitted_date_offloading'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(
        Center(
          child: InkWell(
            onTap: () {
              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return EditLoading(idLoading: data['_id']);
              //     });
            },
            child: Container(
              width: 100,
              height: 28.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.6),
                  color: const Color(0xFFDDDDDD)),
              child: Center(
                child: Text(
                  "Loading",
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        Center(
          child: InkWell(
            onTap: () {
              if (data['submitted_date_offloading'] != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailOffLoading(idLoading: data['_id'])));
              }

              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return const DetailTableHome();
              //     });
            },
            child: Container(
              width: 100,
              height: 28.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.6),
                  color: const Color(0xFFDDDDDD)),
              child: Center(
                child: Text(
                  "Off-Loading",
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }

  void getDataLoading() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllOffLoading);

      setState(() {
        offLoading = response!.data;

        myData = List.generate(offLoading.length, (index) {
          var data = offLoading[index];
          return ProjectOverview(
              no: "${index + 1}",
              id: "${data['_id']}",
              projectName:
                  "${data['project_name'] == null ? "" : data['project_name']}",
              loading: "${data['submitted_date_loading'] ?? "-"}",
              offLoading: "${data['submitted_date_offloading'] ?? "-"}");
        });
        filterData = myData;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                              fontSize: 33.3,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFED1D25),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 242,
                    height: 27.3,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        border: Border.all(width: 1),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 13.3,
                        right: 13.3,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextField(
                                controller: controller,
                                style: GoogleFonts.roboto(
                                  fontSize: 11.3,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 11.3,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF9D9D9D),
                                    ),
                                    hintText: "Search"),
                                onChanged: (value) {
                                  setState(() {
                                    myData = filterData!
                                        .where((element) =>
                                            element.projectName.contains(value))
                                        .toList();
                                  });
                                },
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.search,
                            size: 16,
                            color: Color(0xFF9D9D9D),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            PaginatedDataTable(
              sortColumnIndex: 0,
              sortAscending: sort,
              source: RowSource(
                myData: myData,
                count: myData == null ? 0 : myData!.length,
                context: context,
              ),
              rowsPerPage: 8,
              columnSpacing: 55,
              columns: [
                DataColumn2(
                  label: Center(
                    child: Text(
                      'No',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                DataColumn2(
                  label: Center(
                    child: Text('Depo Location',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                ),
                DataColumn2(
                  label: Center(
                    child: Text("Project's Name",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                ),
                DataColumn2(
                  label: Center(
                    child: Text('Loading',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                ),
                DataColumn2(
                  label: Center(
                    child: Text('Off-Loading',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                ),
                const DataColumn2(
                  label: Text(''),
                ),
                const DataColumn2(
                  label: Text(''),
                ),
              ],
            ),
          ],
        ));
  }
}

class RowSource extends DataTableSource {
  var myData;
  final count;
  var context;

  RowSource({
    required this.myData,
    required this.count,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index], context);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data, context) {
  return DataRow(
    cells: [
      DataCell(Text(data.no,
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("Makasar",
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.projectName,
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.loading,
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.offLoading,
          style: GoogleFonts.montserrat(
            fontSize: 13.3,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(
        Center(
          child: InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => EditLoading(idLoading: data.id)));
            },
            child: Container(
              width: 100,
              height: 28.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.6),
                  color: const Color(0xFFDDDDDD)),
              child: Center(
                child: Text(
                  "Loading",
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        Center(
          child: InkWell(
            onTap: () {
              if (data.offLoading != "-") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailOffLoading(idLoading: data.id)));
              }

              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return const DetailTableHome();
              //     });
            },
            child: Container(
              width: 100,
              height: 28.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.6),
                  color: const Color(0xFFDDDDDD)),
              child: Center(
                child: Text(
                  "Off-Loading",
                  style: GoogleFonts.roboto(
                    fontSize: 10,
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
  );
}

class ProjectOverview {
  final String no, id, projectName, loading, offLoading;

  const ProjectOverview({
    required this.no,
    required this.id,
    required this.projectName,
    required this.loading,
    required this.offLoading,
  });
}
