import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/bats_loading.dart';
import 'package:telin_project/widgets/order/loading/cable_&_kit.dart';
import 'package:telin_project/widgets/order/loading/edit_loading.dart';

import '../../../../api/configAPI.dart';
import '../../../../routing/routes.dart';

class TableLoading extends StatefulWidget {
  const TableLoading({super.key});

  @override
  State<TableLoading> createState() => _TableLoadingState();
}

class _TableLoadingState extends State<TableLoading> {
  List loading = [];
  List<Loading>? filterData;
  List<Loading>? myData;
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
      DataCell(Text('${index + 1}',
          style: GoogleFonts.montserrat(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Center(
        child: Text('${data['date'] == null ? "" : data['date']}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )),
      )),
      DataCell(Center(
        child:
            Text('${data['project_name'] == null ? "" : data['project_name']}',
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                )),
      )),
      DataCell(Center(
        child: Text('${data['vessel_name'] == null ? "" : data['vessel_name']}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )),
      )),
      DataCell(Center(
        child: Text('${data['from'] == null ? "" : data['from']}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )),
      )),
      DataCell(Center(
        child: Text('${data['to'] == null ? "" : data['to']}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )),
      )),
      DataCell(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditLoading(
                            idLoading: data['_id'],
                          )));
              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return const EditLoading();
              //     });
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => FormEditLoading()));
            },
            child: Container(
              width: 50,
              height: 19.46,
              decoration: BoxDecoration(
                  color: green, borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text("Detail",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ))),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              CoolAlert.show(
                  context: context,
                  type: CoolAlertType.confirm,
                  text: "Do you sure to delete this item",
                  width: 400,
                  confirmBtnText: "Delete",
                  cancelBtnText: "Cancle",
                  onConfirmBtnTap: () {
                    hapusDataLoading(data['_id']);
                    navigationController.navigateTo(LoadingPageRoute);
                  });
            },
            child: Container(
              width: 50,
              height: 19.46,
              decoration: BoxDecoration(
                  color: active, borderRadius: BorderRadius.circular(6)),
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
      )),
    ]);
  }

  void getDataLoading() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllLoading);

      setState(() {
        loading = response!.data;
        myData = List.generate(
            loading.length,
            (index) => Loading(
                no: '${index + 1}',
                id: '${loading[index]['_id']}',
                projectName:
                    '${loading[index]['project_name'] == null ? "" : loading[index]['project_name']}',
                vesselName:
                    '${loading[index]['vessel_name'] == null ? "" : loading[index]['vessel_name']}',
                to:
                    '${loading[index]['to'] == null ? "" : loading[index]['to']}',
                from:
                    '${loading[index]['from'] == null ? "" : loading[index]['from']}',
                date:
                    '${loading[index]['submitted_date_loading'] == null ? "" : loading[index]['submitted_date_loading']}'));
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

  void hapusDataLoading(id) async {
    var msg;
    try {
      response = await dio.delete('$deleteLoading/$id');

      msg = response!.data['message'];

      CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "$msg",
          width: 400);
    } catch (e) {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: "Terjadi Kesalahan",
          width: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
                      border:
                          Border.all(width: 1, color: const Color(0xffC1C1C1)),
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
            rowsPerPage: 8,
            columnSpacing: 120,
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
                  label: Center(
                    child: Text('Date',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  fixedWidth: 100),
              DataColumn2(
                  label: Text('Project Name',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  fixedWidth: 200),
              DataColumn2(
                  label: Text('Vessel Name',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  fixedWidth: 150),
              DataColumn2(
                  label: Text('From',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  fixedWidth: 100),
              DataColumn2(
                  label: Text('To',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  fixedWidth: 100),
              const DataColumn2(label: Text(''), fixedWidth: 200),
            ],
          ),
        ],
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
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Center(
        child: Text(data.date,
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )),
      )),
      DataCell(Center(
        child: Text(data.projectName,
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )),
      )),
      DataCell(Center(
        child: Text(data.vesselName,
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )),
      )),
      DataCell(Center(
        child: Text(data.from,
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )),
      )),
      DataCell(Center(
        child: Text(data.to,
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )),
      )),
      DataCell(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditLoading(
                            idLoading: data.id,
                          )));
              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return const EditLoading();
              //     });
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => FormEditLoading()));
            },
            child: Container(
              width: 50,
              height: 19.46,
              decoration: BoxDecoration(
                  color: green, borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text("Detail",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ))),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              CoolAlert.show(
                  context: context,
                  type: CoolAlertType.confirm,
                  text: "Do you sure to delete this item",
                  width: 400,
                  confirmBtnText: "Delete",
                  cancelBtnText: "Cancle",
                  onConfirmBtnTap: () async {
                    var msg;
                    try {
                      Response? response;

                      var dio = Dio();

                      response = await dio.delete('$deleteLoading/${data.id}');

                      msg = response!.data['message'];

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          text: "$msg",
                          width: 400);
                    } catch (e) {
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text: "Terjadi Kesalahan",
                          width: 400);
                    }

                    navigationController.navigateTo(LoadingPageRoute);
                  });
            },
            child: Container(
              width: 50,
              height: 19.46,
              decoration: BoxDecoration(
                  color: active, borderRadius: BorderRadius.circular(6)),
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
      )),
    ],
  );
}

class Loading {
  final String no, id, projectName, vesselName, from, to, date;

  const Loading(
      {required this.no,
      required this.projectName,
      required this.id,
      required this.vesselName,
      required this.to,
      required this.from,
      required this.date});
}
