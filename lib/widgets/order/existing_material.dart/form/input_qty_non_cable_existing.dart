import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';

class InputQtyNonCableExisting extends StatefulWidget {
  const InputQtyNonCableExisting(
      {super.key,
      required this.idLoading,
      required this.idKit,
      required this.qtyStock});
  final String idLoading, idKit, qtyStock;

  @override
  State<InputQtyNonCableExisting> createState() =>
      _InputQtyNonCableExistingState();
}

class _InputQtyNonCableExistingState extends State<InputQtyNonCableExisting> {
  Response? response;

  var dio = Dio();
  TextEditingController qtycon = TextEditingController();
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
            Text("Add QTY Spare Kit",
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
                                "Input QTY Sapre Kit",
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
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: TextField(
                                controller: qtycon,
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
                                    hintText: "Type Qty"),
                              ),
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
                                "Spare Kit",
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
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: TextField(
                                enabled: false,
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
                                    hintText: widget.qtyStock),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      addKitExisting(
                          widget.idKit, widget.idLoading, qtycon.text);
                      Navigator.pop(context);
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

  void addKitExisting(sparekitId, loadingId, qty) async {
    bool status;
    var msg;
    try {
      response = await dio.post('$offLoadingExistingKit/$loadingId',
          data: {'kits_id': sparekitId, 'qty': qty});

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
