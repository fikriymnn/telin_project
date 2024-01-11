import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/routing/routes.dart';

import '../../../api/configAPI.dart';
import '../../../constants/controllers.dart';

class EditUnit extends StatefulWidget {
  final String id;
  final String unitName;
  final dynamic refresh;
  const EditUnit(
      {super.key, required this.unitName, required this.id, this.refresh});

  @override
  State<EditUnit> createState() => _EditUnitState();
}

class _EditUnitState extends State<EditUnit> {
  Response? response;

  var dio = Dio();
  late final TextEditingController _txtNamaUnit;

  @override
  void initState() {
    super.initState();
    _txtNamaUnit = TextEditingController(text: widget.unitName);
  }

  @override
  void dispose() {
    super.dispose();
    _txtNamaUnit.dispose();
  }

  void editDataUnit(id, namaUnit) async {
    bool status;
    var msg;
    try {
      response = await dio.put('$editUnit/$id', data: {'unit': namaUnit});

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        FocusScope.of(context).unfocus();
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: '$msg',
            width: 400,
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () {
              widget.refresh();
              Navigator.pop(context, true);
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
                    child: Text("EDIT UNIT",
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
                        "Unit",
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
                    controller: _txtNamaUnit,
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
                      labelText: 'Unit',
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
                        if (_txtNamaUnit.text == '') {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              title: 'Peringatan',
                              text: 'Unit Tidak Boleh Kosong',
                              width: 400,
                              confirmBtnColor: Colors.red);
                        } else {
                          editDataUnit(widget.id, _txtNamaUnit.text);
                        }
                      },
                      child: Container(
                        width: 123,
                        height: 33,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xffEC1D26)),
                        child: Center(
                          child: Text("EDIT",
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
}
