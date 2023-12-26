// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:quickalert/quickalert.dart';
// import 'package:telin_project/api/configAPI.dart';

// import '../../../constants/controllers.dart';
// import '../../../constants/style.dart';
// import '../../../routing/routes.dart';

// class EditSystem extends StatefulWidget {
//   final String id;
//   final String systemName;
//   final dynamic label;

//   const EditSystem(
//       {super.key,
//       required this.id,
//       required this.systemName,
//       required this.label});

//   @override
//   State<EditSystem> createState() => _EditSystemState();
// }

// class _EditSystemState extends State<EditSystem> {
//   Response? response;

//   var dio = Dio();
//   late final TextEditingController _txtNamaSystem;
//   late final TextEditingController _txtLabelId;

//   @override
//   void initState() {
//     super.initState();
//     _txtNamaSystem = TextEditingController(text: widget.systemName);
//     _txtLabelId = TextEditingController(text: widget.label.toString());
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _txtNamaSystem.dispose();
//     _txtLabelId.dispose();
//   }

//   void editDataSystem(id, namaSystem, labelId) async {
//     bool status;
//     var msg;
//     try {
//       response = await dio.put('$editSystem/$id',
//           data: {'system': namaSystem, 'label_id': labelId});

//       status = response!.data['sukses'];
//       msg = response!.data['msg'];
//       if (status) {
//         FocusScope.of(context).unfocus();
//         QuickAlert.show(
//             context: context,
//             type: QuickAlertType.success,
//             text: '$msg',
//             width: 400,
//             confirmBtnColor: Colors.green);
//       } else {
//         QuickAlert.show(
//             context: context,
//             type: QuickAlertType.error,
//             text: '$msg',
//             title: 'Peringatan',
//             width: 400,
//             confirmBtnColor: Colors.red);
//       }
//     } catch (e) {
//       QuickAlert.show(
//           context: context,
//           type: QuickAlertType.error,
//           text: 'Terjadi Kesalahan Pada Server Kami',
//           title: 'Peringatan',
//           width: 400,
//           confirmBtnColor: Colors.red);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 900,
//         height: 588.6,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6), color: Colors.white),
//         child: SingleChildScrollView(
//             child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 30),
//           child: Column(
//             children: [
//               InkWell(
//                   onTap: () {
//                     navigationController.navigateTo(SystemPageRoute);
//                   },
//                   child: Container(
//                     width: 107.3,
//                     height: 37.3,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                             color: const Color(0xffB8B8B8), width: 1)),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.subdirectory_arrow_left,
//                           color: active,
//                           size: 28.6,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Back",
//                           style: GoogleFonts.roboto(
//                             fontSize: 17.3,
//                             fontWeight: FontWeight.w400,
//                             color: active,
//                           ),
//                         )
//                       ],
//                     ),
//                   )),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text("Edit System",
//                   style: GoogleFonts.montserrat(
//                     fontSize: 23.3,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   )),
//               const SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 width: 230,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "System",
//                       style: GoogleFonts.montserrat(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: 230,
//                 height: 44,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6),
//                     border:
//                         Border.all(width: 5, color: const Color(0xffF0F0F0)),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black.withOpacity(0.25),
//                           blurRadius: 5,
//                           offset: const Offset(0, 4))
//                     ]),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 18, bottom: 8),
//                   child: Center(
//                     child: TextField(
//                       controller: _txtNamaSystem,
//                       style: GoogleFonts.montserrat(
//                         fontSize: 13.3,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintStyle: GoogleFonts.montserrat(
//                             fontSize: 13.3,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.black,
//                           ),
//                           hintText: "System Name"),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 width: 230,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "System ID",
//                       style: GoogleFonts.montserrat(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: 230,
//                 height: 44,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6),
//                     border:
//                         Border.all(width: 5, color: const Color(0xffF0F0F0)),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black.withOpacity(0.25),
//                           blurRadius: 5,
//                           offset: const Offset(0, 4))
//                     ]),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 18, bottom: 8),
//                   child: Center(
//                     child: TextField(
//                       controller: _txtLabelId,
//                       style: GoogleFonts.montserrat(
//                         fontSize: 13.3,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintStyle: GoogleFonts.montserrat(
//                             fontSize: 13.3,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.black,
//                           ),
//                           hintText: "System ID"),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 100,
//               ),
//               InkWell(
//                 onTap: () {
//                   if (_txtNamaSystem.text == '') {
//                     QuickAlert.show(
//                         context: context,
//                         type: QuickAlertType.error,
//                         title: 'Peringatan',
//                         text: 'Nama Csystem Tidak Boleh Kosong',
//                         width: 400,
//                         confirmBtnColor: Colors.red);
//                   } else if (_txtLabelId.text == '') {
//                     QuickAlert.show(
//                         context: context,
//                         type: QuickAlertType.error,
//                         title: 'Peringatan',
//                         text: 'Label system Tidak Boleh Kosong',
//                         width: 400,
//                         confirmBtnColor: Colors.red);
//                   } else {
//                     editDataSystem(
//                         widget.id, _txtNamaSystem.text, _txtLabelId.text);
//                   }
//                 },
//                 child: Container(
//                   width: 90,
//                   height: 37.3,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       color: const Color(0xffEC1D26)),
//                   child: Center(
//                     child: Text("Edit",
//                         style: GoogleFonts.roboto(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         )),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )));
//   }
// }

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/routing/routes.dart';

import '../../../api/configAPI.dart';
import '../../../constants/controllers.dart';

class EditSystem extends StatefulWidget {
  final String id;
  final String systemName;
  final dynamic label;
  final dynamic refresh;
  const EditSystem(
      {super.key,
      required this.id,
      required this.systemName,
      this.label,
      required this.refresh});

  @override
  State<EditSystem> createState() => _EditSystemState();
}

class _EditSystemState extends State<EditSystem> {
  Response? response;

  var dio = Dio();
  late final TextEditingController _txtNamaSystem;
  late final TextEditingController _txtLabelId;

  @override
  void initState() {
    super.initState();
    _txtNamaSystem = TextEditingController(text: widget.systemName);
    _txtLabelId = TextEditingController(text: widget.label.toString());
  }

  @override
  void dispose() {
    super.dispose();
    _txtNamaSystem.dispose();
    _txtLabelId.dispose();
  }

  void editDataSystem(id, namaSystem, labelId) async {
    bool status;
    var msg;
    try {
      response = await dio.put('$editSystem/$id',
          data: {'system': namaSystem, 'label_id': labelId});

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        FocusScope.of(context).unfocus();
        await QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: '$msg',
            width: 400,
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () {
              widget.refresh();
              Navigator.pop(context, true);
            });
        Navigator.pop(context, true);
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: '$msg',
            title: 'Peringatan',
            width: 400,
            confirmBtnColor: Colors.red);
      }
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
          width: 638,
          height: 332,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 638,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: active),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Center(
                    child: Text("Edit System",
                        style: GoogleFonts.rubik(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: light,
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "System Name",
                        style: GoogleFonts.rubik(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: TextField(
                    controller: _txtNamaSystem,
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F6F6),
                      filled: true,
                      hintStyle: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.38)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Color(0xffE6E4E4), width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.blue.withOpacity(0.5)),
                      ),
                      labelText: 'System Name',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "System ID",
                        style: GoogleFonts.rubik(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: TextField(
                    controller: _txtLabelId,
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F6F6),
                      filled: true,
                      hintStyle: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.38)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Color(0xffE6E4E4), width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.blue.withOpacity(0.5)),
                      ),
                      labelText: 'System ID',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () async {
                        if (_txtNamaSystem.text == '') {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              title: 'Peringatan',
                              text: 'Nama System Tidak Boleh Kosong',
                              width: 400,
                              confirmBtnColor: Colors.red);
                        } else if (_txtLabelId.text == '') {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              title: 'Peringatan',
                              text: 'Label System Tidak Boleh Kosong',
                              width: 400,
                              confirmBtnColor: Colors.red);
                        } else {
                          editDataSystem(
                              widget.id, _txtNamaSystem.text, _txtLabelId.text);
                        }
                      },
                      child: Container(
                        width: 123,
                        height: 33,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xffEC1D26)),
                        child: Center(
                          child: Text("SUBMIT",
                              style: GoogleFonts.rubik(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: light,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}
