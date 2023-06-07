import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';

class InputLengthCableExisting extends StatefulWidget {
  const InputLengthCableExisting(
      {super.key,
      required this.idOffLoading,
      required this.idCable,
      required this.initialLength});
  final String idOffLoading, idCable;
  final double initialLength;

  @override
  State<InputLengthCableExisting> createState() =>
      _InputLengthCableExistingState();
}

class _InputLengthCableExistingState extends State<InputLengthCableExisting> {
  TextEditingController _priceIdr = TextEditingController();
  TextEditingController _length = TextEditingController();

  TextEditingController _initialLength = TextEditingController();

  @override
  void initState() {
    _initialLength =
        TextEditingController(text: widget.initialLength.toString());
    // TODO: implement initState
    super.initState();
  }

  Response? response;

  var dio = Dio();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 672.6,
        height: 350,
        decoration:
            BoxDecoration(color: light, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Text("Add Length Cable",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Input Length",
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
                          width: 203.3,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 5, color: const Color(0xffF0F0F0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 5,
                                    offset: const Offset(0, 4))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 18,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: TextField(
                                      controller: _length,
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
                                          hintText: "Type Length"),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 68.6,
                                  height: 44,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(6),
                                          bottomRight: Radius.circular(6)),
                                      color: Color(0xffEC1D26)),
                                  child: Center(
                                    child: Text(
                                      "Meter",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Initial Length ",
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
                          width: 203.3,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 5, color: const Color(0xffF0F0F0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 5,
                                    offset: const Offset(0, 4))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 18,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: TextField(
                                      enabled: false,
                                      controller: _initialLength,
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
                                          hintText: "1232"),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 68.6,
                                  height: 44,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(6),
                                          bottomRight: Radius.circular(6)),
                                      color: Color(0xffEC1D26)),
                                  child: Center(
                                    child: Text(
                                      "Meter",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // const SizedBox(
            //   height: 30,
            // ),
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             SizedBox(
            //               width: 230,
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     "Unit Price IDR",
            //                     style: GoogleFonts.montserrat(
            //                       fontSize: 20,
            //                       fontWeight: FontWeight.w600,
            //                       color: Colors.black,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             Container(
            //               width: 203.3,
            //               height: 44,
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(6),
            //                   border: Border.all(
            //                       width: 5, color: const Color(0xffF0F0F0)),
            //                   color: Colors.white,
            //                   boxShadow: [
            //                     BoxShadow(
            //                         color: Colors.black.withOpacity(0.25),
            //                         blurRadius: 5,
            //                         offset: const Offset(0, 4))
            //                   ]),
            //               child: Padding(
            //                 padding: const EdgeInsets.only(
            //                   left: 18,
            //                 ),
            //                 child: Padding(
            //                   padding: const EdgeInsets.only(bottom: 8),
            //                   child: TextField(
            //                     controller: _priceIdr,
            //                     style: GoogleFonts.montserrat(
            //                       fontSize: 13.3,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.black,
            //                     ),
            //                     decoration: InputDecoration(
            //                         border: InputBorder.none,
            //                         hintStyle: GoogleFonts.montserrat(
            //                           fontSize: 13.3,
            //                           fontWeight: FontWeight.w400,
            //                           color: Colors.black,
            //                         ),
            //                         hintText: "Input Price"),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      doOffLoadingExisting(widget.idCable, widget.idOffLoading,
                          "idr", "usd", _length.text);
                    },
                    child: Container(
                      width: 90,
                      height: 37.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xffEC1D26)),
                      child: Center(
                        child: Text("Done",
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
            )
          ],
        ),
      ),
    );
  }

  void doOffLoadingExisting(cableId, loadingId, idr, usd, length) async {
    bool status;
    var msg;
    try {
      response = await dio.post('$offLoadingExisting/$loadingId', data: {
        'cables_id': cableId,
        'length_returned': length,
      });

      msg = response!.data['message'];

      FocusScope.of(context).unfocus();

      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: '$msg',
          width: 400,
          confirmBtnColor: Colors.green);
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
