import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';

import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/bast_widget.dart';
import 'package:telin_project/widgets/order/existing_material.dart/print_bast/invoice_existing.dart';

import 'package:telin_project/widgets/order/existing_material.dart/print_bast/print_bast_existing.dart';

import 'package:telin_project/widgets/order/loading/bast/invoice.dart';

import '../../../../constants/controllers.dart';

class BastOffLoading extends StatefulWidget {
  const BastOffLoading({super.key, required this.idLoading});

  final String idLoading;

  @override
  State<BastOffLoading> createState() => _BastOffLoadingState();
}

class _BastOffLoadingState extends State<BastOffLoading> {
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
        LoadingByIdCable =
            response!.data['loading'][0]['submitted_existing_cables_id'];
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_depo.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 59.3, top: 32),
                      child: InkWell(
                          onTap: () {
                            navigationController
                                .navigateTo(ExistingMaterialPageRoute);
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
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveWidget(
              largeScreen: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InvoiceExisting(
                        dataExisting: LoadingById,
                        dataExistingCable: LoadingByIdCable,
                        dataExistingKit: LoadingByIdKits,
                      ),
                      const SizedBox(
                        width: 205,
                      ),
                      BastWidget(
                        title: "BAST-Off-Loading-Existing",
                        noBast:
                            "${LoadingById[0]['no_bast_offloading'] ?? "-"}",
                        projectName: "${LoadingById[0]['project_name'] ?? "-"}",
                        onClick: () {
                          printBastOffLoading().BastLoadingPrinttt(
                              LoadingByIdCable, LoadingByIdKits, LoadingById);
                          // showDialog(
                          //         context: context,
                          //         builder: (BuildContext context) {
                          //           return BastLoadingPrint();
                          //         });
                        },
                      )
                    ],
                  ),
                ),
              ),
              smallScreen: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InvoiceExisting(
                        dataExisting: LoadingById,
                        dataExistingCable: LoadingByIdCable,
                        dataExistingKit: LoadingByIdKits,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      BastWidget(
                        title: "BAST-Off-Loading-Existing",
                        noBast:
                            "${LoadingById[0]['no_bast_offloading'] ?? "-"}",
                        projectName: "${LoadingById[0]['project_name'] ?? "-"}",
                        onClick: () {
                          printBastOffLoading().BastLoadingPrinttt(
                              LoadingById, LoadingByIdKits, LoadingById);
                          // showDialog(
                          //         context: context,
                          //         builder: (BuildContext context) {
                          //           return BastLoadingPrint();
                          //         });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
