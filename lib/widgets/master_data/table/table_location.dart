import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_location.dart';

import '../../../constants/controllers.dart';

class TableLocation extends StatefulWidget {
  const TableLocation({super.key});

  @override
  State<TableLocation> createState() => _TableLocationState();
}

class _TableLocationState extends State<TableLocation> {
  Response? response;

  List location = [];

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataLocation();
    super.initState();
  }

  DataRow _resultsAPI(index, data) {
    return DataRow(cells: [
      DataCell(Text('${index + 1}',
          style: GoogleFonts.montserrat(
            fontSize: 14.6,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Center(
        child: Text('${data['location']}',
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditLocation(
                          id: data['_id'],
                          locationName: data['location'],
                        )));
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
                CoolAlert.show(
                    context: context,
                    type: CoolAlertType.confirm,
                    text: "Do you sure to delete this item",
                    width: 400,
                    confirmBtnText: "Delete",
                    cancelBtnText: "Cancle",
                    onConfirmBtnTap: () {
                      hapusDataLocation('${data['_id']}');
                      navigationController.navigateTo(LocationPageRoute);
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
        ),
      )),
    ]);
  }

  void getDataLocation() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllLocation);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          location = response!.data['data'];
        });
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: '$msg',
            title: 'Peringatan',
            width: 400,
            confirmBtnColor: Colors.red);
      }
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

  void hapusDataLocation(id) async {
    bool status;
    var msg;
    try {
      response = await dio.delete('$hapusLocation/$id');

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: "$msg",
            width: 400);
      } else {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: "$msg",
            width: 400);
      }
    } catch (e) {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Kesalahan Server",
          width: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 30,
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
          const DataColumn2(
            label: Text(''),
          ),
        ],
        rows: List.generate(
            location.length, (index) => _resultsAPI(index, location[index])));
  }
}
