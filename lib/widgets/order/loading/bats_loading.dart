import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';

import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/bast_widget.dart';
import 'package:telin_project/widgets/invoice_new.dart';
import 'package:telin_project/widgets/order/loading/bast/bast_print.dart';
import 'package:telin_project/widgets/order/loading/bast/invoice.dart';

class BastLoading extends StatefulWidget {
  const BastLoading({super.key, required this.idLoading});

  final String idLoading;

  @override
  State<BastLoading> createState() => _BastLoadingState();
}

class _BastLoadingState extends State<BastLoading> {
  List LoadingById = [];
  List LoadingByIdCable = [];
  List LoadingByIdKits = [];
  String id = "";
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    id = widget.idLoading;
    getDataLoading();
    super.initState();
  }

  void getDataLoading() async {
    var msg;
    try {
      response = await dio.get('$getLoadingById/$id');
      msg = response!.data['message'];
      setState(() {
        LoadingById = response!.data['loading'];
        LoadingByIdCable = response!.data['loading'][0]['submitted_cables'];
        LoadingByIdKits = response!.data['loading'][0]['submitted_kits'];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgGray,
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 171,
              color: Color(0xffC70D14),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LOADING SUBMITTED",
                          style: GoogleFonts.roboto(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: light,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 148,
                              height: 33,
                              decoration: BoxDecoration(
                                //border: Border.all(color: active, width: 1),
                                color: light,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  "< Back",
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: active,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InvoiceLoading(
                            dataLoading: LoadingById,
                            dataLoadingCable: LoadingByIdCable,
                            dataLoadingKit: LoadingByIdKits),
                        BastWidget(
                          title: "BAST-Loading",
                          noBast:
                              "${LoadingById.isEmpty ? "-" : LoadingById[0]['no_bast'] ?? "-"}",
                          projectName:
                              "${LoadingById.isEmpty ? "-" : LoadingById[0]['project_name'] ?? "-"}",
                          onClick: () {
                            printBastLoading().BastLoadingPrinttt(
                                LoadingByIdCable, LoadingByIdKits, LoadingById);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )));

    // SingleChildScrollView(
    //   child: Padding(
    //     padding: const EdgeInsets.only(bottom: 32),
    //     child: Container(
    //       width: MediaQuery.of(context).size.width,
    //       decoration: const BoxDecoration(
    //           image: DecorationImage(
    //               image: AssetImage('assets/images/background_depo.png'),
    //               fit: BoxFit.fill)),
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(left: 30),
    //             child: SizedBox(
    //               width: MediaQuery.of(context).size.width,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.end,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(right: 59.3, top: 32),
    //                     child: InkWell(
    //                         onTap: () {
    //                           navigationController.navigateTo(LoadingPageRoute);
    //                         },
    //                         child: Container(
    //                           width: 107.3,
    //                           height: 37.3,
    //                           decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(10),
    //                               border: Border.all(
    //                                   color: const Color(0xffB8B8B8),
    //                                   width: 1)),
    //                           child: Row(
    //                             children: [
    //                               Icon(
    //                                 Icons.subdirectory_arrow_left,
    //                                 color: active,
    //                                 size: 28.6,
    //                               ),
    //                               const SizedBox(
    //                                 width: 10,
    //                               ),
    //                               Text(
    //                                 "Back",
    //                                 style: GoogleFonts.roboto(
    //                                   fontSize: 17.3,
    //                                   fontWeight: FontWeight.w400,
    //                                   color: active,
    //                                 ),
    //                               )
    //                             ],
    //                           ),
    //                         )),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           ResponsiveWidget(
    //             largeScreen: Padding(
    //               padding: const EdgeInsets.only(top: 100),
    //               child: Container(
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     InvoiceLoading(
    //                         dataLoading: LoadingById,
    //                         dataLoadingCable: LoadingByIdCable,
    //                         dataLoadingKit: LoadingByIdKits),
    //                     const SizedBox(
    //                       width: 205,
    //                     ),
    //                     BastWidget(
    //                       title: "BAST-Loading",
    //                       noBast: "${LoadingById[0]['no_bast'] ?? "-"}",
    //                       projectName:
    //                           "${LoadingById[0]['project_name'] ?? "-"}",
    //                       onClick: () {
    //                         printBastLoading().BastLoadingPrinttt(
    //                             LoadingByIdCable, LoadingByIdKits, LoadingById);
    //                         // showDialog(
    //                         //         context: context,
    //                         //         builder: (BuildContext context) {
    //                         //           return BastLoadingPrint();
    //                         //         });
    //                       },
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             smallScreen: Padding(
    //               padding: const EdgeInsets.only(top: 100),
    //               child: Container(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     InvoiceLoading(
    //                         dataLoading: LoadingById,
    //                         dataLoadingCable: LoadingByIdCable,
    //                         dataLoadingKit: LoadingByIdKits),
    //                     const SizedBox(
    //                       height: 100,
    //                     ),
    //                     BastWidget(
    //                       title: "BAST-Loading",
    //                       noBast: "${LoadingById[0]['no_bast'] ?? "-"}",
    //                       projectName:
    //                           "${LoadingById[0]['project_name'] ?? "-"}",
    //                       onClick: () {
    //                         printBastLoading().BastLoadingPrinttt(
    //                             LoadingByIdCable, LoadingByIdKits, LoadingById);
    //                         // showDialog(
    //                         //         context: context,
    //                         //         builder: (BuildContext context) {
    //                         //           return BastLoadingPrint();
    //                         //         });
    //                       },
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
