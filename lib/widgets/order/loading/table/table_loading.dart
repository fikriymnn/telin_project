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

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataArmoringType();
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
      DataCell(
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BastLoading()));
          },
          child: Text('Detail...',
              style: GoogleFonts.montserrat(
                fontSize: 13.3,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5),
              )),
        ),
      ),
      DataCell(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CableDanKitLoading(id: data['_id'])));
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
                  child: Text("Edit",
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
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  text: 'Do you sure to delete this item',
                  confirmBtnText: 'Yes',
                  cancelBtnText: 'No',
                  customAsset: 'assets/gift/error.gif',
                  width: 400,
                  confirmBtnColor: Colors.green,
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
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.confirm,
                text: 'Do you sure to finish this project?',
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
                  color: dark, borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text("Finish",
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

  void getDataArmoringType() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllLoading);

      setState(() {
        loading = response!.data;
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

      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: '$msg',
          title: 'Peringatan',
          width: 400,
          barrierDismissible: true,
          confirmBtnColor: Colors.red);
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
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 30,
        minWidth: 3000,
        border: const TableBorder(top: BorderSide(), bottom: BorderSide()),
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
          const DataColumn2(label: Text(''), fixedWidth: 70),

          const DataColumn2(label: Text(''), fixedWidth: 200),
          // const DataColumn2(
          //   label: Text(''),
          //   fixedWidth: 150
          // ),
        ],
        rows: List.generate(
            loading.length, (index) => _resultsAPI(index, loading[index])));
  }

  List<DataRow> _createRowsManufacture() {
    return loading
        .map((loading) => DataRow(cells: [
              DataCell(Text(loading.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Center(
                child: Text(loading.date,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              )),
              DataCell(Text(loading.projectName,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(loading.vesselName,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(loading.from,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(loading.to,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BastLoading()));
                  },
                  child: Text('Detail...',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.3,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.5),
                      )),
                ),
              ),

              DataCell(Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const EditLoading();
                          });
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
                          child: Text("Edit",
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
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        text: 'Do you sure to finish this project?',
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
                          color: dark, borderRadius: BorderRadius.circular(6)),
                      child: Center(
                          child: Text("Finish",
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                ],
              )),
              // DataCell(
              //   InkWell(
              //         onTap: () {

              //         },
              //         child: Container(
              //           width: 150,
              //           height: 19.46,
              //           decoration: BoxDecoration(
              //               color: dark,
              //               borderRadius: BorderRadius.circular(6)),
              //           child: Center(
              //               child: Text("Lakukan Off-Loading",
              //                   style: GoogleFonts.montserrat(
              //                     fontSize: 12,
              //                     fontWeight: FontWeight.w400,
              //                     color: Colors.white,
              //                   ))),
              //         ),
              //       ),
              // )
            ]))
        .toList();
  }
}

class Loading {
  final String no, projectName, vesselName, from, to, date;

  const Loading(
      {required this.no,
      required this.projectName,
      required this.vesselName,
      required this.to,
      required this.from,
      required this.date});

  static List<Loading> getLoading() {
    return <Loading>[
      const Loading(
          no: "1",
          projectName: "project",
          vesselName: "Addreas",
          to: "to",
          from: "from",
          date: "date"),
      const Loading(
          no: "2",
          projectName: "project",
          vesselName: "Addreas",
          to: "to",
          from: "from",
          date: "date"),
      const Loading(
          no: "3",
          projectName: "project",
          vesselName: "Addreas",
          to: "to",
          from: "from",
          date: "date"),
      const Loading(
          no: "4",
          projectName: "project",
          vesselName: "Addreas",
          to: "to",
          from: "from",
          date: "date"),
      const Loading(
          no: "5",
          projectName: "project",
          vesselName: "Addreas",
          to: "to",
          from: "from",
          date: "date")
    ];
  }
}
