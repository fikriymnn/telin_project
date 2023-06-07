import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/bats_loading.dart';
import 'package:telin_project/widgets/order/loading/cart_loading.dart';
import 'package:telin_project/widgets/order/loading/table/table_cable_loading.dart';
import 'package:telin_project/widgets/order/loading/table/table_non_cable_loading.dart';

import '../../../api/configAPI.dart';

class CableDanKitLoading extends StatefulWidget {
  const CableDanKitLoading({super.key, required this.id});
  final String id;

  @override
  State<CableDanKitLoading> createState() => _CableDanKitLoadingState();
}

class _CableDanKitLoadingState extends State<CableDanKitLoading> {
  bool selectButon = true;
  Response? response;

  var dio = Dio();

  void submitDataLoading(id) async {
    var msg;
    try {
      response = await dio.post('$submitLoading/$id');

      msg = response!.data['message'];

      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: '$msg',
          title: 'Peringatan',
          width: 400,
          barrierDismissible: true,
          confirmBtnColor: Colors.red);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BastLoading(
                    idLoading: id,
                  )));
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
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectButon = true;
                              });
                            },
                            child: Text("Cable",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: selectButon ? active : dark)),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectButon = false;
                              });
                            },
                            child: Text("Non Cable",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: selectButon ? dark : active)),
                          )
                        ],
                      ),
                    ),
                    // Expanded(
                    //   child: Container(
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text("MINISUB-36",
                    //             style: GoogleFonts.montserrat(
                    //               fontSize: 16.6,
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.black,
                    //             ))
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 150,
                    // ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CartLoading(
                                        idLoading: widget.id,
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.shopping_cart,
                                color: active,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 221.3,
                            height: 22.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: const Color(0xffC1C1C1)),
                                color: const Color(0xffF3F3F3)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 7),
                              child: TextField(
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF9D9D9D),
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF9D9D9D),
                                    ),
                                    hintText: "Search"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              submitDataLoading(widget.id);
                            },
                            child: Container(
                              width: 99.3,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: active),
                              child: Center(
                                child: Text("Submit",
                                    style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            selectButon
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Expanded(
                            child: TableCableLoading(
                          loadingId: widget.id,
                        )),
                      ],
                    ))
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Expanded(
                            child: TableNonCableLoading(
                          loadingId: widget.id,
                        )),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
