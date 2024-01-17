import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/order/existing_material.dart/cart_existing.dart';
import 'package:telin_project/widgets/order/existing_material.dart/print_bast/bast_existing.dart';
import 'package:telin_project/widgets/order/existing_material.dart/table/detail_table_cable_off_loading.dart';

import 'package:telin_project/widgets/order/existing_material.dart/table/detail_table_non_cable_off_loading.dart';
import 'package:telin_project/widgets/order/existing_material.dart/table/table_cable_cart_existing.dart';
import 'package:telin_project/widgets/order/existing_material.dart/table/table_non_cable_cart.dart';

class DetailOffLoading extends StatefulWidget {
  const DetailOffLoading({super.key, required this.idLoading});
  final String idLoading;

  @override
  State<DetailOffLoading> createState() => _DetailOffLoadingState();
}

class _DetailOffLoadingState extends State<DetailOffLoading> {
  dynamic LoadingById;
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

  void addRequestData(id) async {
    var msg;
    try {
      response = await dio.post(
          '$changeStatusOffLoadingExisting/$id?status=Requested',
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
              builder: (context) => DetailOffLoading(
                    idLoading: widget.idLoading,
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

  void submitDataOffLoading(id) async {
    var msg;
    try {
      response = await dio.post('$submiOffLoadingExisting/$id');

      msg = response!.data['message'];

      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Data Berhasil Di Submit',
          title: 'Peringatan',
          width: 400,
          barrierDismissible: true,
          confirmBtnColor: Colors.green);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailOffLoading(
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
    String status = LoadingById == null
        ? "Requested"
        : LoadingById[0]['status_offloading_existing'];
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
                        Text("OFF LOADING > EXISTING MATERIAL",
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
                                color: Colors.black)),
                        Container(
                          child: Row(
                            children: [
                              status == "Draft"
                                  ? IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                                content: Padding(
                                                  padding:
                                                      const EdgeInsets.all(30),
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: Colors.white),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 56,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            15),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            15)),
                                                                color: active),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              child: Center(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "CART EXISTING",
                                                                        style: GoogleFonts
                                                                            .rubik(
                                                                          fontSize:
                                                                              24,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              light,
                                                                        )),
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              146,
                                                                          height:
                                                                              33,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                light,
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                            // border: Border.all(
                                                                            //     color: const Color(
                                                                            //         0xffB8B8B8),
                                                                            //     width: 1)
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
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
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  TableCableCartExisting(
                                                            idLoading: widget
                                                                .idLoading,
                                                          )),
                                                          Expanded(
                                                              child:
                                                                  TableNonCableCartExisting(
                                                            idLoading: widget
                                                                .idLoading,
                                                          )),
                                                        ],
                                                      )),
                                                ),
                                              );
                                            });
                                      },
                                      icon: Icon(
                                        Icons.shopping_cart,
                                        color: active,
                                      ))
                                  : Container(),
                              SizedBox(
                                width: 21,
                              ),
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
                                                onConfirmBtnTap: () {
                                                  submitDataOffLoading(
                                                      widget.idLoading);
                                                  Navigator.pop(context, true);
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                    BastOffLoading(
                                                        idLoading: id)));
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
                                    navigationController
                                        .navigateTo(ExistingMaterialPageRoute);
                                  },
                                  child: Container(
                                    width: 148,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: active, width: 1),
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
                        )
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
                                    child: DetailTableCableOffLoading(
                                  idOffLoading: widget.idLoading,
                                  status: status,
                                )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                    child: DetailTableNonCableOffLoading(
                                  idOffLoading: widget.idLoading,
                                  status: status,
                                )),
                                const SizedBox(
                                  height: 15,
                                ),
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

    // Scaffold(
    //   backgroundColor: Colors.transparent,
    //   body: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: SingleChildScrollView(
    //       child: Container(
    //         width: MediaQuery.of(context).size.width,
    //         decoration: BoxDecoration(
    //             color: Colors.white, borderRadius: BorderRadius.circular(10)),
    //         child: Padding(
    //           padding: const EdgeInsets.only(bottom: 12.6),
    //           child: Column(
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                     horizontal: 19.3, vertical: 12.6),
    //                 child: SizedBox(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Row(
    //                     children: [
    //                       Text(
    //                         "EXISTING",
    //                         style: GoogleFonts.montserrat(
    //                           fontSize: 10.6,
    //                           fontWeight: FontWeight.w900,
    //                           color: Colors.black,
    //                         ),
    //                       ),
    //                       const Spacer(),
    //                       InkWell(
    //                         onTap: () {
    //                           Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) =>
    //                                       BastOffLoading(idLoading: id)));
    //                           // showDialog(
    //                           //     context: context,
    //                           //     builder: (BuildContext context) {
    //                           //       return const FormEditLoading();
    //                           //     });
    //                         },
    //                         child: Container(
    //                           width: 99.3,
    //                           height: 30,
    //                           decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(15),
    //                               color: active),
    //                           child: Center(
    //                             child: Text("BAST",
    //                                 style: GoogleFonts.roboto(
    //                                   fontSize: 11,
    //                                   fontWeight: FontWeight.w600,
    //                                   color: Colors.white,
    //                                 )),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         width: 50,
    //                       ),
    //                       // InkWell(
    //                       //   onTap: () {},
    //                       //   child: Container(
    //                       //     width: 99.3,
    //                       //     height: 30,
    //                       //     decoration: BoxDecoration(
    //                       //         borderRadius: BorderRadius.circular(15),
    //                       //         color: active),
    //                       //     child: Center(
    //                       //       child: Text("SUBMIT",
    //                       //           style: GoogleFonts.roboto(
    //                       //             fontSize: 11,
    //                       //             fontWeight: FontWeight.w600,
    //                       //             color: Colors.white,
    //                       //           )),
    //                       //     ),
    //                       //   ),
    //                       // ),
    //                       const SizedBox(
    //                         width: 50,
    //                       ),
    //                       InkWell(
    //                         onTap: () {
    //                           Navigator.pop(context);
    //                         },
    //                         child: CircleAvatar(
    //                           radius: 15,
    //                           backgroundColor: const Color(0xFFED1D25),
    //                           child: Center(
    //                             child: Text("X",
    //                                 style: GoogleFonts.roboto(
    //                                   fontSize: 13.3,
    //                                   fontWeight: FontWeight.bold,
    //                                   color: Colors.white,
    //                                 )),
    //                           ),
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               ListView.builder(
    //                 shrinkWrap: true,
    //                 itemCount: LoadingById.length,
    //                 itemBuilder: (context, index) => SizedBox(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Text("${LoadingById[index]['project_name'] ?? "-"}",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 13.3,
    //                             fontWeight: FontWeight.w900,
    //                             color: Colors.black,
    //                           ))
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 22,
    //               ),
    //               ListView.builder(
    //                 shrinkWrap: true,
    //                 itemCount: LoadingById.length,
    //                 itemBuilder: (contect, index) => SizedBox(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Text(
    //                           "${LoadingById[index]['perusahaan']['company_name']}",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 13.3,
    //                             fontWeight: FontWeight.w900,
    //                             color: Colors.black,
    //                           )),
    //                       const SizedBox(
    //                         width: 284,
    //                       ),
    //                       Text(
    //                           "${LoadingById[index]['from']} - ${LoadingById[index]['to']}",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 13.3,
    //                             fontWeight: FontWeight.w900,
    //                             color: Colors.black,
    //                           ))
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                   height: 400,
    //                   child: Column(
    //                     children: [
    //                       Flexible(
    //                           child: TableCableExisting(
    //                         idLoading: widget.idLoading,
    //                       )),
    //                     ],
    //                   )),
    //               const SizedBox(
    //                 height: 15,
    //               ),
    //               SizedBox(
    //                   height: 400,
    //                   child: Column(
    //                     children: [
    //                       Flexible(
    //                           child: DetailTableKitExisting(
    //                         idLoading: widget.idLoading,
    //                       )),
    //                     ],
    //                   )),
    //               // Padding(
    //               //   padding: const EdgeInsets.symmetric(horizontal: 100),
    //               //   child: Row(
    //               //     mainAxisAlignment: MainAxisAlignment.end,
    //               //     children: [
    //               //       InkWell(
    //               //         onTap: () {
    //               //           showDialog(
    //               //               context: context,
    //               //               builder: (BuildContext context) {
    //               //                 return Scaffold(
    //               //                   appBar: AppBar(
    //               //                     backgroundColor: Colors.white,
    //               //                     elevation: 0,
    //               //                     actions: [
    //               //                       Padding(
    //               //                         padding: const EdgeInsets.only(
    //               //                             right: 59.3, top: 5, bottom: 5),
    //               //                         child: InkWell(
    //               //                             onTap: () {
    //               //                               Navigator.pop(context);
    //               //                             },
    //               //                             child: Container(
    //               //                               width: 107.3,
    //               //                               height: 37.3,
    //               //                               decoration: BoxDecoration(
    //               //                                   borderRadius:
    //               //                                       BorderRadius.circular(
    //               //                                           10),
    //               //                                   border: Border.all(
    //               //                                       color: const Color(
    //               //                                           0xffB8B8B8),
    //               //                                       width: 1)),
    //               //                               child: Row(
    //               //                                 children: [
    //               //                                   Icon(
    //               //                                     Icons
    //               //                                         .subdirectory_arrow_left,
    //               //                                     color: active,
    //               //                                     size: 28.6,
    //               //                                   ),
    //               //                                   const SizedBox(
    //               //                                     width: 10,
    //               //                                   ),
    //               //                                   Text(
    //               //                                     "Back",
    //               //                                     style: GoogleFonts.roboto(
    //               //                                       fontSize: 17.3,
    //               //                                       fontWeight:
    //               //                                           FontWeight.w400,
    //               //                                       color: active,
    //               //                                     ),
    //               //                                   )
    //               //                                 ],
    //               //                               ),
    //               //                             )),
    //               //                       ),
    //               //                     ],
    //               //                   ),
    //               //                   body: CableDanKitLoading(
    //               //                     id: widget.idLoading,
    //               //                   ),
    //               //                 );
    //               //               });
    //               //         },
    //               //         child: Container(
    //               //           width: 99.3,
    //               //           height: 20.33,
    //               //           decoration: BoxDecoration(
    //               //               borderRadius: BorderRadius.circular(15),
    //               //               color: active),
    //               //           child: Center(
    //               //             child: Text("ADD CABLE",
    //               //                 style: GoogleFonts.roboto(
    //               //                   fontSize: 11,
    //               //                   fontWeight: FontWeight.w600,
    //               //                   color: Colors.white,
    //               //                 )),
    //               //           ),
    //               //         ),
    //               //       ),
    //               //     ],
    //               //   ),
    //               // ),
    //               // const SizedBox(
    //               //   height: 15,
    //               // ),
    //               // SizedBox(
    //               //   height: 250,
    //               //   child: Column(
    //               //     children: [
    //               //       Expanded(
    //               //           child: TableNonCableEdit(
    //               //         idLoading: widget.idLoading,
    //               //       )),
    //               //     ],
    //               //   ),
    //               // ),
    //               // const SizedBox(
    //               //   height: 15,
    //               // ),
    //               // Padding(
    //               //   padding: const EdgeInsets.symmetric(horizontal: 100),
    //               //   child: Row(
    //               //     mainAxisAlignment: MainAxisAlignment.end,
    //               //     children: [
    //               //       InkWell(
    //               //         onTap: () {
    //               //           showDialog(
    //               //               context: context,
    //               //               builder: (BuildContext context) {
    //               //                 return Scaffold(
    //               //                   appBar: AppBar(
    //               //                     backgroundColor: Colors.white,
    //               //                     elevation: 0,
    //               //                     actions: [
    //               //                       Padding(
    //               //                         padding: const EdgeInsets.only(
    //               //                             right: 59.3, top: 5, bottom: 5),
    //               //                         child: InkWell(
    //               //                             onTap: () {
    //               //                               Navigator.pop(context);
    //               //                             },
    //               //                             child: Container(
    //               //                               width: 107.3,
    //               //                               height: 37.3,
    //               //                               decoration: BoxDecoration(
    //               //                                   borderRadius:
    //               //                                       BorderRadius.circular(
    //               //                                           10),
    //               //                                   border: Border.all(
    //               //                                       color: const Color(
    //               //                                           0xffB8B8B8),
    //               //                                       width: 1)),
    //               //                               child: Row(
    //               //                                 children: [
    //               //                                   Icon(
    //               //                                     Icons
    //               //                                         .subdirectory_arrow_left,
    //               //                                     color: active,
    //               //                                     size: 28.6,
    //               //                                   ),
    //               //                                   const SizedBox(
    //               //                                     width: 10,
    //               //                                   ),
    //               //                                   Text(
    //               //                                     "Back",
    //               //                                     style: GoogleFonts.roboto(
    //               //                                       fontSize: 17.3,
    //               //                                       fontWeight:
    //               //                                           FontWeight.w400,
    //               //                                       color: active,
    //               //                                     ),
    //               //                                   )
    //               //                                 ],
    //               //                               ),
    //               //                             )),
    //               //                       ),
    //               //                     ],
    //               //                   ),
    //               //                   body: CableDanKitLoading(
    //               //                     id: widget.idLoading,
    //               //                   ),
    //               //                 );
    //               //               });
    //               //         },
    //               //         child: Container(
    //               //           width: 99.3,
    //               //           height: 20.33,
    //               //           decoration: BoxDecoration(
    //               //               borderRadius: BorderRadius.circular(15),
    //               //               color: active),
    //               //           child: Center(
    //               //             child: Text("ADD SPAREPART",
    //               //                 style: GoogleFonts.roboto(
    //               //                   fontSize: 11,
    //               //                   fontWeight: FontWeight.w600,
    //               //                   color: Colors.white,
    //               //                 )),
    //               //           ),
    //               //         ),
    //               //       ),
    //               //     ],
    //               //   ),
    //               // ),
    //               // const SizedBox(
    //               //   height: 15,
    //               // ),
    //               // SizedBox(
    //               //   height: 250,
    //               //   child: Column(
    //               //     children: [
    //               //       Expanded(
    //               //           child: TableCableTurnOverDetail(
    //               //         idLoading: widget.idLoading,
    //               //       )),
    //               //     ],
    //               //   ),
    //               // ),
    //               // const SizedBox(
    //               //   height: 22,
    //               // ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
