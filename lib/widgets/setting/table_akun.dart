import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/setting/akun.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';
import 'package:telin_project/widgets/setting/edit_akun.dart';

class TableAkun extends StatefulWidget {
  const TableAkun({super.key});

  @override
  State<TableAkun> createState() => _TableAkunState();
}

class _TableAkunState extends State<TableAkun> {
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
      DataCell(Text("${data['name'] == null ? "-" : data['name']}",
          style: GoogleFonts.montserrat(
            fontSize: 14.6,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['username'] == null ? "-" : data['username']}",
          style: GoogleFonts.montserrat(
            fontSize: 14.6,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Text("${data['password'] == null ? "-" : data['password']}",
          style: GoogleFonts.montserrat(
            fontSize: 14.6,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ))),
      DataCell(Row(
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: Color(0xff24EB2C),
          ),
          SizedBox(
            width: 7,
          ),
          Text("${data['role'] == null ? "-" : data['role']}",
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
                      email: "${data['email'] == null ? "-" : data['email']}",
                      id: "${data['_id'] == null ? "-" : data['_id']}",
                      name: "${data['name'] == null ? "-" : data['name']}",
                      password:
                          "${data['password'] == null ? "-" : data['password']}",
                      role: "${data['role'] == null ? "-" : data['role']}",
                      username:
                          "${data['username'] == null ? "-" : data['username']}",
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
                              "${data['email'] == null ? "-" : data['email']}",
                          id: "${data['_id'] == null ? "-" : data['_id']}",
                          name: "${data['name'] == null ? "-" : data['name']}",
                          password:
                              "${data['password'] == null ? "-" : data['password']}",
                          role: "${data['role'] == null ? "-" : data['role']}",
                          username:
                              "${data['username'] == null ? "-" : data['username']}",
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
            hapusDataUser(data['_id']);
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

  void hapusDataUser(id) async {
    bool status;
    var msg;
    try {
      response = await dio.delete('$deleteUser/$id');

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
        border: TableBorder(
          top: BorderSide(),
          bottom: BorderSide(),
        ),
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
            fixedWidth: 64,
          ),
          DataColumn2(
            label: Text('Name',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            fixedWidth: 174.6,
          ),
          DataColumn2(
              fixedWidth: 222.6,
              label: Text("Username",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              size: ColumnSize.L),
          DataColumn2(
            fixedWidth: 196.6,
            label: Text('Password',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            fixedWidth: 240.6,
            label: Text('Role',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            fixedWidth: 91.3,
            label: Text(''),
          ),
          DataColumn2(
            fixedWidth: 53.3,
            label: Text(''),
          ),
          DataColumn2(
            fixedWidth: 53.3,
            label: Text(''),
          ),
        ],
        rows: List.generate(
            users.length, (index) => _resultsAPI(index, users[index])));
  }
}
