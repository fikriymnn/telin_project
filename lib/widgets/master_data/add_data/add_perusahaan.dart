import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/helpers/responsive.dart';

import 'package:telin_project/widgets/setting/edit_akun.dart';

import '../../../api/configAPI.dart';

class AddPerusahaan extends StatefulWidget {
  const AddPerusahaan({super.key});

  @override
  State<AddPerusahaan> createState() => _AddPerusahaanState();
}

class _AddPerusahaanState extends State<AddPerusahaan> {
  TextEditingController txtNamaPerusahaan = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtState = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

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
                Text("Add New Perusahaan",
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
                        "Perusahaan",
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
                        controller: txtNamaPerusahaan,
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
                            hintText: "Perusahaan Name"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
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
                        controller: txtAddress,
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
                            hintText: "Address"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "City",
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
                        controller: txtCity,
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
                            hintText: "City"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "State",
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
                        controller: txtState,
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
                            hintText: "State"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Phone",
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
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (input) {
                          final isDigitsOnly = int.tryParse(input!);
                          return isDigitsOnly == null
                              ? 'Hanya Bisa Berupa Angka'
                              : null;
                        },
                        controller: txtPhone,
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
                            hintText: "Phone"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    if (txtNamaPerusahaan.text == '') {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Peringatan',
                          text: 'Nama Perusahaan Tidak Boleh Kosong',
                          width: 400,
                          confirmBtnColor: Colors.red);
                    } else if (txtAddress.text == '') {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Peringatan',
                          text: 'Address Tidak Boleh Kosong',
                          width: 400,
                          confirmBtnColor: Colors.red);
                    } else if (txtCity.text == '') {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Peringatan',
                          text: 'City Tidak Boleh Kosong',
                          width: 400,
                          confirmBtnColor: Colors.red);
                    } else if (txtState.text == '') {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Peringatan',
                          text: 'State Tidak Boleh Kosong',
                          width: 400,
                          confirmBtnColor: Colors.red);
                    } else if (txtPhone.text == '') {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Peringatan',
                          text: 'Phone Tidak Boleh Kosong',
                          width: 400,
                          confirmBtnColor: Colors.red);
                    } else {
                      inputDataPerusahaan(
                          txtNamaPerusahaan.text,
                          txtAddress.text,
                          txtCity.text,
                          txtState.text,
                          txtPhone.text);
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

  // Clear the form
  void _clearForm() {
    txtNamaPerusahaan.clear();
    txtAddress.clear();
    txtCity.clear();
    txtState.clear();
    txtPhone.clear();
  }

  // Fungsi Add Data
  void inputDataPerusahaan(namaPerusahaan, address, city, state, phone) async {
    bool status;
    var msg;
    try {
      // final formData = FormData.fromMap({
      //   'company_name': namaPerusahaan,
      //   'address': address,
      //   'city': city,
      //   'state': state,
      //   'phone': phone,
      // });
      response = await dio.post(inputPerusahaan, data: {
        'company_name': namaPerusahaan,
        'address': address,
        'city': city,
        'state': state,
        'phone': phone,
      });
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
