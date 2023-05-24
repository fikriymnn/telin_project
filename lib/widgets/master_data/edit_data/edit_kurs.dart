import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/routing/routes.dart';

import '../../../constants/controllers.dart';
import '../../../constants/style.dart';

class EditKurs extends StatefulWidget {
  final double kurs;

  const EditKurs({super.key, required this.kurs});

  @override
  State<EditKurs> createState() => _EditKursState();
}

class _EditKursState extends State<EditKurs> {
  Response? response;

  var dio = Dio();
  late final TextEditingController _txtKurs;

  @override
  void initState() {
    super.initState();
    _txtKurs = TextEditingController(text: widget.kurs.toString());
  }

  @override
  void dispose() {
    super.dispose();
    _txtKurs.dispose();
  }

  void editDataKurs(kurs) async {
    bool status;
    var msg;
    try {
      response = await dio.post('$editKurs', data: {'usdToIdr': kurs});

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
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    navigationController.navigateTo(KursPageRoute);
                  },
                  child: Container(
                    width: 107.3,
                    height: 37.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xffB8B8B8), width: 1)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.subdirectory_arrow_left,
                          color: active,
                          size: 28.6,
                        ),
                        const SizedBox(
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
              const SizedBox(
                height: 10,
              ),
              Text("Edit Core Type",
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
                    border:
                        Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                      controller: _txtKurs,
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
                          hintText: "Kurs"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  editDataKurs(_txtKurs.text);
                },
                child: Container(
                  width: 90,
                  height: 37.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xffEC1D26)),
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