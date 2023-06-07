import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/routing/routes.dart';


import '../../../api/configAPI.dart';
import '../../../constants/controllers.dart';

class AddCoreType extends StatefulWidget {
  const AddCoreType({super.key});

  @override
  State<AddCoreType> createState() => _AddCoreTypeState();
}

class _AddCoreTypeState extends State<AddCoreType> {
  TextEditingController txtNamaCoreType = TextEditingController();

  FocusNode focusNode = FocusNode();

  Response? response;

  var dio = Dio();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          width: 900,
          height: 588.6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.white),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Text("Add New Core Type",
                    style: GoogleFonts.montserrat(
                      fontSize: 23.3,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
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
                      border: Border.all(width: 5, color: const Color(0xffF0F0F0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 5,
                            offset: const Offset(0, 4))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, bottom: 8),
                    child: Center(
                      child: TextField(
                        controller: txtNamaCoreType,
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
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {
                    if (txtNamaCoreType.text == '') {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Peringatan',
                          text: 'Nama Core Type Tidak Boleh Kosong',
                          width: 400,
                          confirmBtnColor: Colors.red);
                    } else {
                      inputDataCoreType(txtNamaCoreType.text);
                      navigationController.navigateTo(CoreTypePageRoute);
                    }
                  },
                  child: Container(
                    width: 90,
                    height: 37.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xffEC1D26)),
                    child: Center(
                      child: Text("Submit",
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
          ))),
    );
  }

  // Clear the form
  void _clearForm() {
    txtNamaCoreType.clear();
  }

  // Fungsi Add Data
  void inputDataCoreType(namaCoreType) async {
    bool status;
    var msg;
    try {
      // var formData = FormData.fromMap({
      //   'CoreType': namaCoreType,
      // });

      response =
          await dio.post(inputCoreType, data: {'core_type': namaCoreType});
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        FocusScope.of(context).unfocus();
        _clearForm();
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
}
