import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/order/loading/bats_loading.dart';
import 'package:telin_project/widgets/order/loading/table/detail_table_cable_loading.dart';
import 'package:telin_project/widgets/order/loading/table/detail_table_kit_loading.dart';
import 'package:telin_project/widgets/order/loading/table/detail_table_turnover_loading.dart';
import 'package:telin_project/widgets/order/new_material/add_new_material.dart';

import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';
import 'package:telin_project/widgets/order/new_material/table/detail_cable_new_material.dart';
import 'package:telin_project/widgets/order/new_material/table/detail_kit_new_material.dart';

class DetailLoading extends StatefulWidget {
  const DetailLoading({
    super.key,
    required this.idLoading,
    required this.isLoading,
  });
  final String idLoading;
  final bool isLoading;

  @override
  State<DetailLoading> createState() => _DetailLoadingState();
}

class _DetailLoadingState extends State<DetailLoading> {
  dynamic LoadingById;

  List LoadingByIdCable = [];
  List LoadingByIdKit = [];

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

      setState(() {
        LoadingById = response!.data['loading'];

        // LoadingByIdCable =
        //     response!.data['newMaterial']['submitted_new_material_cables_id_in_spare_cable'];
        // LoadingByIdKit =
        //     response!.data['newMaterial']['submitted_new_material_kits_id_in_spare_kits'];
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

  void submitDataLoading(id) async {
    var msg;
    try {
      response = await dio.post('$submitLoading/$id');

      msg = response!.data['message'];

      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Data New Material Success Added',
        title: 'Success',
        width: 400,
        barrierDismissible: true,
        confirmBtnColor: Colors.green,
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => DetailLoading(
                    idLoading: widget.idLoading,
                    isLoading: true,
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

  void addRequestData(id) async {
    var msg;
    try {
      response = await dio.post('$changeStatusLoading/$id?status=Requested',
          data: {"status": "Requested"});

      msg = response!.data['message'];

      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Data New Material Success Added',
        title: 'Success',
        width: 400,
        barrierDismissible: true,
        confirmBtnColor: Colors.green,
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => DetailLoading(
                    idLoading: widget.idLoading,
                    isLoading: true,
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
    String status =
        LoadingById == null ? "Requested" : LoadingById[0]['status_loading'];
    return Scaffold(
      backgroundColor: bgGray,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.35,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.3),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 23),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("LOADING",
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
                                color: Colors.black)),
                        Row(
                          children: [
                            status == "Draft"
                                ? InkWell(
                                    onTap: () {
                                      QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.confirm,
                                          text: "Do you sure to Add Request",
                                          width: 400,
                                          confirmBtnText: "Oke",
                                          cancelBtnText: "Cancle",
                                          onConfirmBtnTap: () {
                                            addRequestData(widget.idLoading);
                                          });
                                    },
                                    child: Container(
                                      width: 148,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: active),
                                      child: Center(
                                        child: Text("ADD TO REQUEST",
                                            style: GoogleFonts.rubik(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: light)),
                                      ),
                                    ),
                                  )
                                : status == "Requested"
                                    ? InkWell(
                                        onTap: () {
                                          QuickAlert.show(
                                              context: context,
                                              type: QuickAlertType.confirm,
                                              text: "Do you sure to Submit?",
                                              width: 400,
                                              confirmBtnText: "Submit",
                                              cancelBtnText: "Cancel",
                                              onConfirmBtnTap: () {
                                                submitDataLoading(
                                                    widget.idLoading);
                                              });
                                        },
                                        child: Container(
                                          width: 148,
                                          height: 33,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: active),
                                          child: Center(
                                            child: Text("SUBMIT REQUEST",
                                                style: GoogleFonts.rubik(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: light)),
                                          ),
                                        ),
                                      )
                                    : Container(),
                            SizedBox(
                              width: 21,
                            ),
                            status == 'Approved'
                                ? InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BastLoading(idLoading: id)));
                                    },
                                    child: Container(
                                      width: 148,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: active),
                                      child: Center(
                                        child: Text("BAST",
                                            style: GoogleFonts.rubik(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: light)),
                                      ),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              width: 21,
                            ),
                            InkWell(
                                onTap: () {
                                  navigationController.navigateTo(
                                      widget.isLoading
                                          ? LoadingPageRoute
                                          : ExistingMaterialPageRoute);
                                },
                                child: Container(
                                  width: 148,
                                  height: 33,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: active, width: 1),
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1.2,
                    decoration: BoxDecoration(
                        color: light, borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 62,
                          decoration: BoxDecoration(
                            color: active,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 23),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "${LoadingById == null ? "-" : LoadingById[0]['project_name']}",
                                        style: GoogleFonts.rubik(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                          color: light,
                                        )),
                                    Container(
                                      width: 124,
                                      height: 23,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: light),
                                      child: Center(
                                        child: Text(status,
                                            style: GoogleFonts.rubik(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: status == 'Requested'
                                                  ? Colors.orange
                                                  : status == 'Draft'
                                                      ? active
                                                      : Colors.green,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        LoadingById == null
                                            ? "-"
                                            : "${LoadingById[0]['from'] ?? ""} - ${LoadingById[0]['to'] ?? ""}",
                                        style: GoogleFonts.rubik(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: light,
                                        )),
                                    Text(
                                        LoadingById == null
                                            ? "-"
                                            : "${LoadingById[0]['perusahaan']["company_name"] ?? "-"}",
                                        style: GoogleFonts.rubik(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: light,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: DetailTableCableLoading(
                                        id: id, status: status)),
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                    child: DetailTableKitLoading(
                                        idLoading: id, status: status)),
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                    child: DetailTableTurnOverLoading(
                                        id: id, status: status)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
