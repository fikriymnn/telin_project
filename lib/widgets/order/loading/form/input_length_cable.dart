import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/custom_text_field.dart';

class InputLengthCable extends StatefulWidget {
  const InputLengthCable(
      {super.key,
      required this.idLoading,
      required this.idCable,
      required this.refresh});
  final String idLoading, idCable;
  final dynamic refresh;

  @override
  State<InputLengthCable> createState() => _InputLengthCableState();
}

class _InputLengthCableState extends State<InputLengthCable> {
  TextEditingController _priceIdr = TextEditingController();
  Response? response;

  var dio = Dio();
  double kurs = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    getDataKurs();
    super.initState();
  }

  void getDataKurs() async {
    bool status;
    var msg;

    try {
      response = await dio.get(getAllKurs);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          kurs = response!.data['usd'];
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
          height: 238,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Text("ADD Cable",
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
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Unit Price (IDR)",
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
                    child: CustomTextField(
                        controller: _priceIdr, label: "Input Price")),
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
                        if (_priceIdr == "") {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              title: 'Peringatan',
                              text: 'Unit Price Tidak Boleh Kosong',
                              width: 400,
                              confirmBtnColor: Colors.red);
                        } else {
                          addCableLoading(
                              widget.idCable,
                              widget.idLoading,
                              _priceIdr.text,
                              double.parse(_priceIdr.text) * kurs);
                        }
                      },
                      child: Container(
                        width: 123,
                        height: 33,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xffEC1D26)),
                        child: Center(
                          child: Text("ADD",
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

    // AlertDialog(
    //   content: Container(
    //     width: 672.6,
    //     height: 350,
    //     decoration:
    //         BoxDecoration(color: light, borderRadius: BorderRadius.circular(8)),
    //     child: Column(
    //       children: [
    //         Text("Add Length Cable",
    //             style: GoogleFonts.montserrat(
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //             )),
    //         const SizedBox(
    //           height: 30,
    //         ),
    //         Container(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Container(
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     SizedBox(
    //                       width: 230,
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             "Unit Price IDR",
    //                             style: GoogleFonts.montserrat(
    //                               fontSize: 20,
    //                               fontWeight: FontWeight.w600,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     Container(
    //                       width: 203.3,
    //                       height: 44,
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(6),
    //                           border: Border.all(
    //                               width: 5, color: const Color(0xffF0F0F0)),
    //                           color: Colors.white,
    //                           boxShadow: [
    //                             BoxShadow(
    //                                 color: Colors.black.withOpacity(0.25),
    //                                 blurRadius: 5,
    //                                 offset: const Offset(0, 4))
    //                           ]),
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(
    //                           left: 18,
    //                         ),
    //                         child: Padding(
    //                           padding: const EdgeInsets.only(bottom: 8),
    //                           child: TextField(
    //                             controller: _priceIdr,
    //                             style: GoogleFonts.montserrat(
    //                               fontSize: 13.3,
    //                               fontWeight: FontWeight.w400,
    //                               color: Colors.black,
    //                             ),
    //                             decoration: InputDecoration(
    //                                 border: InputBorder.none,
    //                                 hintStyle: GoogleFonts.montserrat(
    //                                   fontSize: 13.3,
    //                                   fontWeight: FontWeight.w400,
    //                                   color: Colors.black,
    //                                 ),
    //                                 hintText: "Input Price"),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 50,
    //         ),
    //         Container(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               InkWell(
    //                 onTap: () {
    //                   addCableLoading(widget.idCable, widget.idLoading,
    //                       _priceIdr.text, double.parse(_priceIdr.text) * kurs);
    //                 },
    //                 child: Container(
    //                   width: 90,
    //                   height: 37.3,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(6),
    //                       color: const Color(0xffEC1D26)),
    //                   child: Center(
    //                     child: Text("Done",
    //                         style: GoogleFonts.roboto(
    //                           fontSize: 20,
    //                           fontWeight: FontWeight.w600,
    //                           color: Colors.white,
    //                         )),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  void addCableLoading(cableId, loadingId, idr, usd) async {
    bool status;
    var msg;
    try {
      response = await dio.post('$addCableToLoading/$loadingId',
          data: {'cables_id': cableId, 'priceIdr': idr, 'priceUsd': usd});

      msg = response!.data['message'];

      // FocusScope.of(context).unfocus();

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
