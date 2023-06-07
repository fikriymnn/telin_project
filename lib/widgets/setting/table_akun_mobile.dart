import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';
import 'package:telin_project/widgets/setting/edit_akun.dart';

class TableAkunMobile extends StatefulWidget {
  const TableAkunMobile({super.key});

  @override
  State<TableAkunMobile> createState() => _TableAkunMobileState();
}

class _TableAkunMobileState extends State<TableAkunMobile> {
  List users = [];

  Response? response;

  var dio = Dio();
  @override
  void initState() {
    // TODO: implement initState
    getDataUser();

    super.initState();
  }

  DataRow _resultsAPI(index, data) {
    return DataRow(cells: [
      DataCell(Text("${index + 1}",
          style: GoogleFonts.montserrat(
            fontSize: 14.6,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['name'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 14.6,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['username'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 14.6,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['password'] ?? "-"}",
          style: GoogleFonts.montserrat(
            fontSize: 14.6,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Row(
        children: [
          const CircleAvatar(
            radius: 5,
            backgroundColor: Color(0xff24EB2C),
          ),
          const SizedBox(
            width: 7,
          ),
          Text("${data['role'] ?? "-"}",
              style: GoogleFonts.montserrat(
                fontSize: 14.6,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              )),
        ],
      )),
      DataCell(
        Center(
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return DetailAkun(
                      email: "${data['email'] ?? "-"}",
                      id: "${data['_id'] ?? "-"}",
                      name: "${data['name'] ?? "-"}",
                      password:
                          "${data['password'] ?? "-"}",
                      role: "${data['role'] ?? "-"}",
                      username:
                          "${data['username'] ?? "-"}",
                    );
                  });
            },
            child: Text('Detail...',
                style: GoogleFonts.montserrat(
                  fontSize: 13.3,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                )),
          ),
        ),
      ),
      DataCell(Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditAkun(
                          email:
                              "${data['email'] ?? "-"}",
                          id: "${data['_id'] ?? "-"}",
                          name: "${data['name'] ?? "-"}",
                          password:
                              "${data['password'] ?? "-"}",
                          role: "${data['role'] ?? "-"}",
                          username:
                              "${data['username'] ?? "-"}",
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
                    fontSize: 13.3,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      )),
      DataCell(Center(
        child: InkWell(
          onTap: () {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              text: 'Do you sure to delete this account',
              confirmBtnText: 'Yes',
              cancelBtnText: 'No',
              customAsset: 'assets/gift/error.gif',
              width: 400,
              confirmBtnColor: Colors.green,
            );
          },
          child: Container(
            width: 21.41,
            height: 19.46,
            decoration: BoxDecoration(
                color: const Color(0xffEC1D26),
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
      )),
    ]);
  }

  void getDataUser() async {
    try {
      response = await dio.get(getUser);

      setState(() {
        users = response!.data;
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
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 30,
        minWidth: 3000,
        border: const TableBorder(
          top: BorderSide(),
          bottom: BorderSide(),
        ),
        columns: [
          DataColumn2(
            label: Text(
              'No',
              style: GoogleFonts.montserrat(
                fontSize: 10.6,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            fixedWidth: 28,
          ),
          DataColumn2(
            label: Text('Name',
                style: GoogleFonts.montserrat(
                  fontSize: 10.6,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            fixedWidth: 60,
          ),
          DataColumn2(
              fixedWidth: 70,
              label: Text("Username",
                  style: GoogleFonts.montserrat(
                    fontSize: 10.6,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              size: ColumnSize.L),
          DataColumn2(
            fixedWidth: 70,
            label: Text('Password',
                style: GoogleFonts.montserrat(
                  fontSize: 10.6,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            fixedWidth: 106,
            label: Text('Role',
                style: GoogleFonts.montserrat(
                  fontSize: 10.6,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          const DataColumn2(
            fixedWidth: 50,
            label: Text(''),
          ),
          const DataColumn2(
            fixedWidth: 23,
            label: Text(''),
          ),
        ],
        rows: _createRows());
  }

  List<DataRow> _createRows() {
    return List.generate(
        users.length, (index) => _resultsAPI(index, users[index]));
  }
}
