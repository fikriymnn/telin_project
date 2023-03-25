import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/helpers/responsive.dart';

import 'package:telin_project/widgets/setting/edit_akun.dart';

import '../../../api/configAPI.dart';

class AddManufacture extends StatefulWidget {
  const AddManufacture({super.key});

  @override
  State<AddManufacture> createState() => _AddManufactureState();
}

class _AddManufactureState extends State<AddManufacture> {
  TextEditingController txtNamaManufacturer = TextEditingController();

  FocusNode focusNode = new FocusNode();

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
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Text("Add New Manufacture",
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
                        "Manufacture",
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
                        controller: txtNamaManufacturer,
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
                            hintText: "Manufacture Name"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {
                    if (txtNamaManufacturer.text == '') {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Peringatan',
                          text: 'Nama Manufacturer Tidak Boleh Kosong',
                          width: 400,
                          confirmBtnColor: Colors.red);
                    } else {
                      inputDataManufacturer(txtNamaManufacturer.text);
                    }
                  },
                  child: Container(
                    width: 90,
                    height: 37.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffEC1D26)),
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

  void _clearForm() {
    txtNamaManufacturer.clear();
  }

  void inputDataManufacturer(namaManufacturer) async {
    bool status;
    var msg;
    try {
      // var formData = FormData.fromMap({
      //   'manufacturer': namaManufacturer,
      // });
      response = await dio
          .post(inputManufacturer, data: {'manufacturer': namaManufacturer});
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
