import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/routing/routes.dart';

import '../../../api/configAPI.dart';
import '../../../constants/controllers.dart';

class AddCableType extends StatefulWidget {
  const AddCableType({super.key});

  @override
  State<AddCableType> createState() => _AddCableTypeState();
}

class _AddCableTypeState extends State<AddCableType> {
  TextEditingController txtNamaCableType = TextEditingController();

  FocusNode focusNode = FocusNode();

  Response? response;

  var dio = Dio();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
          width: 638,
          height: 242,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 638,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: active),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Center(
                    child: Text("ADD NEW CABLE TYPE",
                        style: GoogleFonts.rubik(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: light,
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Cable Type",
                        style: GoogleFonts.rubik(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: TextField(
                    controller: txtNamaCableType,
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F6F6),
                      filled: true,
                      hintStyle: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.38)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Color(0xffE6E4E4), width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.blue.withOpacity(0.5)),
                      ),
                      labelText: 'Cable Type',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        if (txtNamaCableType.text == '') {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              title: 'Peringatan',
                              text: 'Cable Type Tidak Boleh Kosong',
                              width: 400,
                              confirmBtnColor: Colors.red);
                        } else {
                          inputDataCableType(txtNamaCableType.text);
                        }
                      },
                      child: Container(
                        width: 123,
                        height: 33,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xffEC1D26)),
                        child: Center(
                          child: Text("SUBMIT",
                              style: GoogleFonts.rubik(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: light,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))),
    );
  }

  // Clear the form
  void _clearForm() {
    txtNamaCableType.clear();
  }

  // Fungsi Add Data
  void inputDataCableType(namaCableType) async {
    bool status;
    var msg;
    try {
      // var formData = FormData.fromMap({
      //   'CableType': namaCableType,
      // });

      response =
          await dio.post(inputCableType, data: {'cable_type': namaCableType});
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
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () {
              Navigator.pop(context, true);
              navigationController.navigateTo(CableTypePageRoute);
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
}
