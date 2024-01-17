import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/bats_loading.dart';

import 'package:telin_project/widgets/order/new_material/add_new_material.dart';
import 'package:telin_project/widgets/order/new_material/detail_new_material.dart';
import 'package:intl/intl.dart';

import '../../../../api/configAPI.dart';
import '../../../../routing/routes.dart';

class TableNewMaterial extends StatefulWidget {
  const TableNewMaterial({super.key});

  @override
  State<TableNewMaterial> createState() => _TableNewMaterialState();
}

class _TableNewMaterialState extends State<TableNewMaterial> {
  List loading = [];
  List<NewMaterial>? filterData = [];
  List<NewMaterial>? newMaterialData = [];
  TextEditingController controller = TextEditingController();

  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataNewMaterial();
    super.initState();
  }

  void getDataNewMaterial() async {
    try {
      response = await dio.get(getAllNewMaterial);
      if (response!.statusCode == 200) {
        List<dynamic> jsonResponse = response!.data;
        List<NewMaterial> material =
            jsonResponse.map((json) => NewMaterial.fromJson(json)).toList();
        setState(() {
          newMaterialData = material;
          filterData = material;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response!.statusMessage.toString()),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  void hapusDataNewMaterial(id) async {
    bool check;
    var msg;
    try {
      response = await dio.delete('$deleteNewMaterial/$id');

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
          text: "This offloading has been submitted! Cannot be deleted!",
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
                        filterData = newMaterialData!
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
                count: filterData!.length,
                context: context,
                refresh: () => getDataNewMaterial()),
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
                label: Text('TITLE',
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
                    builder: (context) => DetailNewMaterial(
                          idNewMaterial: data.id,
                        )),
              );
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
                    Navigator.of(context, rootNavigator: true).pop();
                    try {
                      Response? response;

                      var dio = Dio();
                      response =
                          await dio.delete('$deleteNewMaterial/${data.id}');

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
                          text:
                              "This offloading has been submitted! Cannot be deleted!",
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

class NewMaterial {
  final String id, projectName, from, to, date, status;

  const NewMaterial(
      {required this.projectName,
      required this.id,
      required this.to,
      required this.from,
      required this.date,
      required this.status});

  factory NewMaterial.fromJson(Map<String, dynamic> json) {
    return NewMaterial(
        id: json['_id'],
        projectName: json['project_name'],
        status: json['status'],
        to: json['to'],
        from: json['from'],
        date: json['date']);
  }

  List<dynamic> toList() => [id, projectName, from, to, date];
}
