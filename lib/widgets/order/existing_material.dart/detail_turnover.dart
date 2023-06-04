import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/existing_material.dart/print_bast/bast_existing.dart';
import 'package:telin_project/widgets/order/existing_material.dart/table/table_detail_cable_existing.dart';

class DetailOffLoading extends StatefulWidget {
  const DetailOffLoading({super.key, required this.idLoading});
  final String idLoading;

  @override
  State<DetailOffLoading> createState() => _DetailOffLoadingState();
}

class _DetailOffLoadingState extends State<DetailOffLoading> {
  List LoadingById = [];
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
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     text: 'Terjadi Kesalahan Pada Server Kami',
      //     title: 'Peringatan',
      //     width: 400,
      //     confirmBtnColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.6),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19.3, vertical: 12.6),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text(
                            "EXISTING",
                            style: GoogleFonts.montserrat(
                              fontSize: 10.6,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BastOffLoading(idLoading: id)));
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return const FormEditLoading();
                              //     });
                            },
                            child: Container(
                              width: 99.3,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: active),
                              child: Center(
                                child: Text("BAST",
                                    style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          // InkWell(
                          //   onTap: () {},
                          //   child: Container(
                          //     width: 99.3,
                          //     height: 30,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(15),
                          //         color: active),
                          //     child: Center(
                          //       child: Text("SUBMIT",
                          //           style: GoogleFonts.roboto(
                          //             fontSize: 11,
                          //             fontWeight: FontWeight.w600,
                          //             color: Colors.white,
                          //           )),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(
                            width: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: const Color(0xFFED1D25),
                              child: Center(
                                child: Text("X",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: LoadingById.length,
                    itemBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${LoadingById[index]['project_name'] ?? "-"}",
                              style: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: LoadingById.length,
                    itemBuilder: (contect, index) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "${LoadingById[index]['perusahaan']['company_name']}",
                              style: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              )),
                          const SizedBox(
                            width: 284,
                          ),
                          Text(
                              "${LoadingById[index]['from']} - ${LoadingById[index]['to']}",
                              style: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          Flexible(
                              child: TableCableExisting(
                            idLoading: widget.idLoading,
                          )),
                        ],
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 100),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       InkWell(
                  //         onTap: () {
                  //           showDialog(
                  //               context: context,
                  //               builder: (BuildContext context) {
                  //                 return Scaffold(
                  //                   appBar: AppBar(
                  //                     backgroundColor: Colors.white,
                  //                     elevation: 0,
                  //                     actions: [
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(
                  //                             right: 59.3, top: 5, bottom: 5),
                  //                         child: InkWell(
                  //                             onTap: () {
                  //                               Navigator.pop(context);
                  //                             },
                  //                             child: Container(
                  //                               width: 107.3,
                  //                               height: 37.3,
                  //                               decoration: BoxDecoration(
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(
                  //                                           10),
                  //                                   border: Border.all(
                  //                                       color: const Color(
                  //                                           0xffB8B8B8),
                  //                                       width: 1)),
                  //                               child: Row(
                  //                                 children: [
                  //                                   Icon(
                  //                                     Icons
                  //                                         .subdirectory_arrow_left,
                  //                                     color: active,
                  //                                     size: 28.6,
                  //                                   ),
                  //                                   const SizedBox(
                  //                                     width: 10,
                  //                                   ),
                  //                                   Text(
                  //                                     "Back",
                  //                                     style: GoogleFonts.roboto(
                  //                                       fontSize: 17.3,
                  //                                       fontWeight:
                  //                                           FontWeight.w400,
                  //                                       color: active,
                  //                                     ),
                  //                                   )
                  //                                 ],
                  //                               ),
                  //                             )),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   body: CableDanKitLoading(
                  //                     id: widget.idLoading,
                  //                   ),
                  //                 );
                  //               });
                  //         },
                  //         child: Container(
                  //           width: 99.3,
                  //           height: 20.33,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(15),
                  //               color: active),
                  //           child: Center(
                  //             child: Text("ADD CABLE",
                  //                 style: GoogleFonts.roboto(
                  //                   fontSize: 11,
                  //                   fontWeight: FontWeight.w600,
                  //                   color: Colors.white,
                  //                 )),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // SizedBox(
                  //   height: 250,
                  //   child: Column(
                  //     children: [
                  //       Expanded(
                  //           child: TableNonCableEdit(
                  //         idLoading: widget.idLoading,
                  //       )),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 100),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       InkWell(
                  //         onTap: () {
                  //           showDialog(
                  //               context: context,
                  //               builder: (BuildContext context) {
                  //                 return Scaffold(
                  //                   appBar: AppBar(
                  //                     backgroundColor: Colors.white,
                  //                     elevation: 0,
                  //                     actions: [
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(
                  //                             right: 59.3, top: 5, bottom: 5),
                  //                         child: InkWell(
                  //                             onTap: () {
                  //                               Navigator.pop(context);
                  //                             },
                  //                             child: Container(
                  //                               width: 107.3,
                  //                               height: 37.3,
                  //                               decoration: BoxDecoration(
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(
                  //                                           10),
                  //                                   border: Border.all(
                  //                                       color: const Color(
                  //                                           0xffB8B8B8),
                  //                                       width: 1)),
                  //                               child: Row(
                  //                                 children: [
                  //                                   Icon(
                  //                                     Icons
                  //                                         .subdirectory_arrow_left,
                  //                                     color: active,
                  //                                     size: 28.6,
                  //                                   ),
                  //                                   const SizedBox(
                  //                                     width: 10,
                  //                                   ),
                  //                                   Text(
                  //                                     "Back",
                  //                                     style: GoogleFonts.roboto(
                  //                                       fontSize: 17.3,
                  //                                       fontWeight:
                  //                                           FontWeight.w400,
                  //                                       color: active,
                  //                                     ),
                  //                                   )
                  //                                 ],
                  //                               ),
                  //                             )),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   body: CableDanKitLoading(
                  //                     id: widget.idLoading,
                  //                   ),
                  //                 );
                  //               });
                  //         },
                  //         child: Container(
                  //           width: 99.3,
                  //           height: 20.33,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(15),
                  //               color: active),
                  //           child: Center(
                  //             child: Text("ADD SPAREPART",
                  //                 style: GoogleFonts.roboto(
                  //                   fontSize: 11,
                  //                   fontWeight: FontWeight.w600,
                  //                   color: Colors.white,
                  //                 )),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // SizedBox(
                  //   height: 250,
                  //   child: Column(
                  //     children: [
                  //       Expanded(
                  //           child: TableCableTurnOverDetail(
                  //         idLoading: widget.idLoading,
                  //       )),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 22,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
