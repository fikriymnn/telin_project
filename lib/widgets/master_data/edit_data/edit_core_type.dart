import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/routing/routes.dart';

import 'package:telin_project/widgets/setting/edit_akun.dart';

import '../../../constants/controllers.dart';
import '../../../constants/style.dart';

class EditCoreType extends StatefulWidget {
  final String id;
  final String coreTypeName;

  const EditCoreType({super.key, required this.id, required this.coreTypeName});

  @override
  State<EditCoreType> createState() => _EditCoreTypeState();
}

class _EditCoreTypeState extends State<EditCoreType> {
  Response? response;

  var dio = Dio();
  late final TextEditingController _txtNamaCoreType;

  @override
  void initState() {
    super.initState();
    _txtNamaCoreType = TextEditingController(text: widget.coreTypeName);
  }

  @override
  void dispose() {
    super.dispose();
    _txtNamaCoreType.dispose();
  }

  void editDataCoreType(id, namaCoreType) async {
    bool status;
    var msg;
    try {
      response =
          await dio.put('$editCoreType/$id', data: {'core_type': namaCoreType});

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        FocusScope.of(context).unfocus();
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: '$msg',
            width: 400,
            confirmBtnColor: Colors.green);
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

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 900,
        height: 588.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.white),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    navigationController.navigateTo(CoreTypePageRoute);
                  },
                  child: Container(
                    width: 107.3,
                    height: 37.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffB8B8B8), width: 1)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.subdirectory_arrow_left,
                          color: active,
                          size: 28.6,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Back",
                          style: GoogleFonts.roboto(
                            fontSize: 17.3,
                            fontWeight: FontWeight.w400,
                            color: active,
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Text("Edit Core Type",
                  style: GoogleFonts.montserrat(
                    fontSize: 23.3,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 230,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Core Type",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 230,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 5, color: Color(0xffF0F0F0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 5,
                          offset: Offset(0, 4))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, bottom: 8),
                  child: Center(
                    child: TextField(
                      controller: _txtNamaCoreType,
                      style: GoogleFonts.montserrat(
                        fontSize: 13.3,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 13.3,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          hintText: "Core Type Name"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  editDataCoreType(widget.id, _txtNamaCoreType.text);
                },
                child: Container(
                  width: 90,
                  height: 37.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xffEC1D26)),
                  child: Center(
                    child: Text("Edit",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
