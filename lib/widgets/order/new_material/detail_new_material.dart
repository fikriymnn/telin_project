import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/bats_loading.dart';
import 'package:telin_project/widgets/order/loading/cable_&_kit.dart';
import 'package:telin_project/widgets/order/loading/form/edit_form_loading.dart';
import 'package:telin_project/widgets/order/loading/table/table_cable_edit.dart';
import 'package:telin_project/widgets/order/loading/table/table_cable_loading.dart';
import 'package:telin_project/widgets/order/loading/table/table_non_cable_loading.dart';
import 'package:telin_project/widgets/order/loading/table/table_turn_over.dart';
import 'package:telin_project/widgets/order/loading/table/table_turn_over_detail.dart';
import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';
import 'package:telin_project/widgets/order/new_material/table/detail_cable_new_material.dart';
import 'package:telin_project/widgets/order/new_material/table/detail_kit_new_material.dart';

class DetailNewMaterial extends StatefulWidget {
  const DetailNewMaterial({super.key, required this.idNewMaterial});
  final String idNewMaterial;

  @override
  State<DetailNewMaterial> createState() => _DetailNewMaterialState();
}

class _DetailNewMaterialState extends State<DetailNewMaterial> {
  List NewMaterialById = [];
  String projectName = "";
  List NewMaterialByIdCable = [];
  List NewMaterialByIdKit = [];

  String id = "";
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    id = widget.idNewMaterial;
    getDataNewMaterial();
    super.initState();
  }

  void getDataNewMaterial() async {
    var msg;
    try {
      response = await dio.get('$getNewMaterialById/$id');
      msg = response!.data['message'];
      setState(() {
        NewMaterialById = response!.data;

        NewMaterialByIdCable = response!.data['new_material_cables'];
        NewMaterialByIdKit = response!.data['new_material_kits'];
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
                            "NEW MATERIAL",
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
                                      builder: (context) => BastNewMaterial(
                                            idNewMaterial: widget.idNewMaterial,
                                          )));
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${projectName ?? "-"}",
                            style: GoogleFonts.montserrat(
                              fontSize: 13.3,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: LoadingById.length,
                  //   itemBuilder: (contect, index) => SizedBox(
                  //     width: MediaQuery.of(context).size.width,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //             "${LoadingById[index]['perusahaan']['company_name']}",
                  //             style: GoogleFonts.montserrat(
                  //               fontSize: 13.3,
                  //               fontWeight: FontWeight.w900,
                  //               color: Colors.black,
                  //             )),
                  //         const SizedBox(
                  //           width: 284,
                  //         ),
                  //         Text(
                  //             "${LoadingById[index]['from']} - ${LoadingById[index]['to']}",
                  //             style: GoogleFonts.montserrat(
                  //               fontSize: 13.3,
                  //               fontWeight: FontWeight.w900,
                  //               color: Colors.black,
                  //             ))
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          Flexible(
                              child: DetailTableCableNewMaterial(
                            idNewMaterial: widget.idNewMaterial,
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
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 250,
                    child: Column(
                      children: [
                        Expanded(
                            child: DetailTableKitNewMaterial(
                          idNewMaterial: widget.idNewMaterial,
                        )),
                      ],
                    ),
                  ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
