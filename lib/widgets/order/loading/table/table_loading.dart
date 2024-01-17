import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/bats_loading.dart';

import 'package:telin_project/widgets/order/loading/detail_loading.dart';

import '../../../../api/configAPI.dart';
import '../../../../routing/routes.dart';

class TableLoading extends StatefulWidget {
  const TableLoading({super.key});

  @override
  State<TableLoading> createState() => _TableLoadingState();
}

class _TableLoadingState extends State<TableLoading> {
  List loading = [];
  List<Loading> filterData = [];
  List<Loading> LoadingData = [];
  TextEditingController controller = TextEditingController();

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataLoading();
    super.initState();
  }

  void getDataLoading() async {
    try {
      response = await dio.get(getAllLoading);

      if (response!.statusCode == 200) {
        List<dynamic> jsonResponse = response!.data;
        List<Loading> loading =
            jsonResponse.map((json) => Loading.fromJson(json)).toList();
        setState(() {
          LoadingData = loading;
          filterData = loading;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response!.statusMessage.toString()),
        ));
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
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
          text: "$msg",
          width: 400);
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: "Terjadi Kesalahan",
          width: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 512,
                height: 31,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xffE9E9E9)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 15),
                  child: TextField(
                    controller: controller,
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 12),
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF9D9D9D),
                        ),
                        hintText: "Search"),
                    onChanged: (value) {
                      setState(() {
                        filterData = LoadingData!
                            .where((element) => element.projectName
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: PaginatedDataTable2(
            sortColumnIndex: 0,
            source: RowSource(
                data: filterData,
                count: filterData.length,
                context: context,
                refresh: () => getDataLoading()),
            rowsPerPage: 30,
            columnSpacing: 6,
            horizontalMargin: 6,
            dataRowHeight: 52,
            headingRowColor: MaterialStatePropertyAll(light),
            columns: [
              DataColumn2(
                fixedWidth: 77,
                label: Center(
                  child: Text(
                    'NO',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              DataColumn2(
                label: Text('DATE',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              DataColumn2(
                label: Text('PROJECT NAME',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              DataColumn2(
                label: Text('FROM',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              DataColumn2(
                label: Text('TO',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              DataColumn2(
                label: Text('STATUS',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              const DataColumn2(
                label: Text(''),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RowSource extends DataTableSource {
  var data;
  final count;
  var context;
  dynamic refresh;

  RowSource(
      {required this.data,
      required this.count,
      required this.context,
      required this.refresh});

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(data![index], context, index, () => refresh());
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

DataRow recentFileDataRow(var data, context, index, refresh) {
  bool id;
  if ((index + 1) % 2 == 1) {
    id = true;
  } else {
    id = false;
  }
  DateTime date = DateTime.parse(data.date);
  var formatter = DateFormat('dd MMMM yyyy');
  var formatted = formatter.format(date);
  return DataRow(
    color: MaterialStatePropertyAll(id == true ? activeTable : light),
    cells: [
      DataCell(Center(
        child: Text("${index + 1}",
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            )),
      )),
      DataCell(Text(formatted,
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ))),
      DataCell(Text(data.projectName,
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ))),
      DataCell(Text(data.from,
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ))),
      DataCell(Text(data.to,
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ))),
      DataCell(Row(
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: data.status == "Requested"
                ? Colors.orange
                : data.status == "Draft"
                    ? active
                    : Colors.green,
          ),
          const SizedBox(
            width: 7,
          ),
          Text(
              data.status == "Requested"
                  ? "REQUESTED"
                  : data.status == "Draft"
                      ? "DRAFT"
                      : "APPROVED",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              )),
        ],
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
                    builder: (context) => DetailLoading(
                      idLoading: data.id,
                      isLoading: true,
                    ),
                  ));
            },
            child: Container(
              width: 77,
              height: 29,
              decoration: BoxDecoration(
                  border: Border.all(color: active, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text("DETAIL",
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: active,
                      ))),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () async {
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  text: "Do you sure to delete this item",
                  width: 400,
                  onConfirmBtnTap: () async {
                    var msg;
                    Response? response;

                    var dio = Dio();
                    Navigator.of(context, rootNavigator: true).pop();
                    try {
                      response = await dio.delete('$deleteLoading/${data.id}');

                      msg = response!.data['message'];

                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: "$msg",
                        width: 400,
                      );
                    } catch (e) {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: "Terjadi Kesalahan",
                          width: 400);
                    }
                    refresh();
                  });
            },
            child: Container(
              width: 77,
              height: 29,
              decoration: BoxDecoration(
                  color: active, borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text("DELETE",
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: light,
                      ))),
            ),
          ),
        ],
      )),
    ],
  );
}

class Loading {
  final String id, projectName, from, to, date, status, vesselName;

  const Loading(
      {required this.projectName,
      required this.id,
      required this.to,
      required this.vesselName,
      required this.from,
      required this.date,
      required this.status});

  factory Loading.fromJson(Map<String, dynamic> json) {
    return Loading(
        id: json['_id'],
        projectName: json['project_name'],
        status: json["status_loading"],
        to: json['to'],
        from: json['from'],
        vesselName: json['vessel_name'],
        date: json['date_loading']);
  }

  List<dynamic> toList() => [id, projectName, from, to, date, vesselName];
}
