import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';

import 'package:telin_project/widgets/order/existing_material.dart/detail_turnover.dart';
import 'package:telin_project/widgets/order/existing_material.dart/lakukan_off_loading.dart';

class TableExistingMaterial extends StatefulWidget {
  const TableExistingMaterial({super.key});

  @override
  State<TableExistingMaterial> createState() => _TableExistingMaterialState();
}

class _TableExistingMaterialState extends State<TableExistingMaterial> {
  List offLoading = [];
  List<ExistingMaterial>? filterData;
  List<ExistingMaterial>? myData;
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
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("Makasar",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
          Text("${data['project_name'] == null ? "" : data['project_name']}",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
      DataCell(Text("${data['submitted_date_loading'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['submitted_date_offloading'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => EditLoading(
            //               idLoading: data['_id'],
            //             )));
          },
          child: Text('Detail Loading',
              style: GoogleFonts.montserrat(
                fontSize: 13.3,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5),
              )),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            if (data['submitted_date_offloading'] != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailOffLoading(idLoading: data['_id'])));
            }
          },
          child: Text('Detail Off-Loading',
              style: GoogleFonts.montserrat(
                fontSize: 13.3,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5),
              )),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            if (data['submitted_date_offloading'] == null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LakukanOffLoading(
                            idOffLoading: data['_id'],
                          )));
            }
          },
          child: Container(
            width: 150,
            height: 19.46,
            decoration: BoxDecoration(
                color: dark, borderRadius: BorderRadius.circular(6)),
            child: Center(
                child: Text("Do Off-Loading",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ))),
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
        myData = List.generate(
            offLoading.length,
            (index) => ExistingMaterial(
                  no: '${index + 1}',
                  id: '${offLoading[index]['_id']}',
                  projectName:
                      '${offLoading[index]['project_name'] == null ? "" : offLoading[index]['project_name']}',
                  depoLocation: 'Makassar',
                  loading:
                      '${offLoading[index]['submitted_date_loading'] == null ? "" : offLoading[index]['submitted_date_loading']}',
                  offLoading:
                      '${offLoading[index]['submitted_date_offloading'] == null ? "" : offLoading[index]['submitted_date_offloading']}',
                ));
        filterData = myData;
      });
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 258.6,
                    height: 37.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.6),
                        border: Border.all(
                            width: 1, color: const Color(0xffC1C1C1)),
                        color: const Color(0xffF3F3F3)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 15),
                      child: TextField(
                        controller: controller,
                        style: GoogleFonts.roboto(
                          fontSize: 10.6,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 10.6,
                              fontWeight: FontWeight.w400,
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
                  )
                ],
              ),
            ),
            PaginatedDataTable(
              sortColumnIndex: 0,
              source: RowSource(
                myData: myData,
                count: myData!.length,
                context: context,
              ),
              rowsPerPage: 15,
              columnSpacing: 50,
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
                    fixedWidth: 28),
                DataColumn2(
                    label: Text('Depo Loaction',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    fixedWidth: 150),
                DataColumn2(
                    label: Text('Project Name',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    fixedWidth: 200),
                DataColumn2(
                    label: Text('Loading',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    fixedWidth: 150),
                DataColumn2(
                    label: Text('Off-Loading',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    fixedWidth: 150),
                const DataColumn2(label: Text(''), fixedWidth: 150),
                const DataColumn2(label: Text(''), fixedWidth: 150),
                const DataColumn2(label: Text(''), fixedWidth: 200),
              ],
            ),
          ],
        ),
      ),
    );
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

DataRow recentFileDataRow(
  var data,
  context,
) {
  return DataRow(
    cells: [
      DataCell(Text(data.no,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text("Makasar",
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.projectName,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.loading,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(Text(data.offLoading,
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
      DataCell(
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => EditLoading(
            //               idLoading: data.id,
            //             )));
          },
          child: Container(
            decoration: BoxDecoration(
                color: green,
                border: Border.all(width: 2, color: green),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Detail Loading',
                  style: GoogleFonts.montserrat(
                    fontSize: 13.3,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            if (data.offLoading != "") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailOffLoading(idLoading: data.id)));
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: green,
                border: Border.all(width: 2, color: green),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Detail Off-Loading',
                  style: GoogleFonts.montserrat(
                    fontSize: 13.3,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ),
      DataCell(data.offLoading == ""
          ? InkWell(
              onTap: () {
                if (data.offLoading == "") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LakukanOffLoading(
                                idOffLoading: data.id,
                              )));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Do Off-Loading",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                ),
              ),
            )
          : Container())
    ],
  );
}

class ExistingMaterial {
  final String no, id, projectName, depoLocation, loading, offLoading;

  const ExistingMaterial({
    required this.no,
    required this.id,
    required this.projectName,
    required this.depoLocation,
    required this.offLoading,
    required this.loading,
  });
}
