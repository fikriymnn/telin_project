import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_cable_large.dart';

import 'package:telin_project/widgets/order/new_material/add_item/add_new_noncable_large.dart';

import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';
import 'package:telin_project/widgets/order/new_material/cart_new_material.dart';

class AddItemNewMaterial extends StatefulWidget {
  const AddItemNewMaterial(
      {super.key,
      required this.idNewMaterial,
      required this.selectSesions,
      required this.refresh});
  final String idNewMaterial;
  final bool selectSesions;
  final dynamic refresh;

  @override
  State<AddItemNewMaterial> createState() => _AddItemNewMaterialState();
}

class _AddItemNewMaterialState extends State<AddItemNewMaterial> {
  bool selectButon = true;
  bool selectNonCable = false;
  Response? response;

  @override
  void initState() {
    // TODO: implement initState
    selectButon == widget.selectSesions;
    super.initState();
  }

  var dio = Dio();

  void submitDataNewMaterial(id) async {
    var msg;
    try {
      response = await dio.post('$submitNewMaterial/$id');

      msg = response!.data['message'];

      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Data New Material Success Added',
          title: 'Peringatan',
          width: 400,
          barrierDismissible: true,
          confirmBtnColor: Colors.red);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BastNewMaterial(
                    idNewMaterial: widget.idNewMaterial,
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
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
          width: 883,
          height: 700,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
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
                ),
                SizedBox(
                  height: 25,
                ),
                widget.selectSesions
                    ? AddNewCableLarge(
                        idNewMaterial: widget.idNewMaterial,
                        refresh: () => widget.refresh(),
                      )
                    : AddNewNonCableLarge(
                        idNewMaterial: widget.idNewMaterial,
                        refresh: () => widget.refresh(),
                      ),
              ],
            ),
          )),
    );

    //  Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           width: MediaQuery.of(context).size.width,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Text("New Material",
    //                   style: GoogleFonts.roboto(
    //                       fontWeight: FontWeight.w500,
    //                       fontSize: 23.3,
    //                       color: Colors.black)),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         SizedBox(
    //           width: MediaQuery.of(context).size.width,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               TextButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     selectButon = true;
    //                   });
    //                 },
    //                 child: Text("Cable",
    //                     style: GoogleFonts.montserrat(
    //                         fontWeight: FontWeight.w600,
    //                         fontSize: 26.6,
    //                         color: selectButon ? active : dark)),
    //               ),
    //               const SizedBox(
    //                 width: 100,
    //               ),
    //               TextButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     selectButon = false;
    //                   });
    //                 },
    //                 child: Text("Non Cable",
    //                     style: GoogleFonts.montserrat(
    //                         fontWeight: FontWeight.w600,
    //                         fontSize: 26.6,
    //                         color: selectButon ? dark : active)),
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 50,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 59.3),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               IconButton(
    //                   onPressed: () {
    //                     showDialog(
    //                         context: context,
    //                         builder: (BuildContext context) {
    //                           return CartNewMaterial(
    //                             idNewMaterial: widget.idNewMaterial,
    //                           );
    //                         });
    //                   },
    //                   icon: Icon(
    //                     Icons.shopping_cart,
    //                     color: active,
    //                   )),
    //               const SizedBox(
    //                 width: 30,
    //               ),
    //               InkWell(
    //                 onTap: () {
    //                   submitDataNewMaterial(widget.idNewMaterial);
    //                 },
    //                 child: Container(
    //                   width: 99.3,
    //                   height: 50,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(15),
    //                       color: active),
    //                   child: Center(
    //                     child: Text("SUBMIT",
    //                         style: GoogleFonts.roboto(
    //                           fontSize: 15,
    //                           fontWeight: FontWeight.w600,
    //                           color: Colors.white,
    //                         )),
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 width: 40,
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 70,
    //         ),
    //         selectButon
    //             ?
    //                     AddNewCableLarge(idNewMaterial: widget.idNewMaterial)

    //             : AddNewNonCableLarge(
    //                     idNewMaterial: widget.idNewMaterial),

    //       ],
    //     ),
    //   ),
    // );
  }
}
