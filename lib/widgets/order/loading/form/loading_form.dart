import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/custom_dropdown.dart';
import 'package:telin_project/widgets/custom_text_field.dart';
import 'package:telin_project/widgets/order/loading/detail_loading.dart';

class FormLoading extends StatefulWidget {
  const FormLoading({
    super.key,
  });

  @override
  State<FormLoading> createState() => _FormLoadingState();
}

class _FormLoadingState extends State<FormLoading> {
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataPerusahaan();
    getDataUser();
    super.initState();
  }

  List perusahaan = [];
  List user = [];
  List superAdmin = [];

  PlatformFile? pickedFile;
  DateTime selectedDate = DateTime.now();

  final TextEditingController projectName = TextEditingController();
  final TextEditingController visselName = TextEditingController();
  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();
  final TextEditingController diterima = TextEditingController();
  final TextEditingController remark = TextEditingController();

  String? selectedValueDiserahkan;
  String? selectedValueDiketahui;
  String? selectedValuePerusahaan;

  var formatter;
  var formatted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              Container(
                width: 665,
                height: 778,
                decoration: BoxDecoration(
                    color: light, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Project Name",
                              style: GoogleFonts.rubik(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            CustomTextField(
                                controller: projectName,
                                label: "Enter Project Name")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Remark",
                              style: GoogleFonts.rubik(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            CustomTextField(
                                controller: remark, label: "Enter remark")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 86,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 20,
                                  crossAxisCount: 2),
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date Of Loss",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final DateTime? picked =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: selectedDate,
                                                    firstDate:
                                                        DateTime(2015, 8),
                                                    lastDate: DateTime(2101));
                                            if (picked != null &&
                                                picked != selectedDate) {
                                              setState(() {
                                                selectedDate = picked;
                                                formatter =
                                                    DateFormat('dd MMMM yyyy');
                                                formatted = formatter
                                                    .format(selectedDate);
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: 60,
                                            height: 48,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(6),
                                                    bottomLeft:
                                                        Radius.circular(6)),
                                                color: const Color(0xffEC1D26)),
                                            child: Center(
                                              child: Icon(
                                                Icons.calendar_month_rounded,
                                                color: light,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 237,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF8F6F6),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(6),
                                                  bottomRight:
                                                      Radius.circular(6)),
                                              border: Border.all(
                                                  color: Color(0xffE6E4E4),
                                                  width: 1)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  formatter != null
                                                      ? formatted
                                                      : "Select Date",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.rubik(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: formatter != null
                                                          ? Colors.black
                                                          : Colors.black
                                                              .withOpacity(
                                                                  0.38)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Vessel Name",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomTextField(
                                      controller: visselName,
                                      label: "Enter Vessel Name")
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomTextField(
                                      controller: from,
                                      label: "Enter Starting Point")
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomTextField(
                                      controller: to,
                                      label: "Enter destination")
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Submitted",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomDropdown(
                                    label: "Submitted",
                                    item: user.map((user) {
                                      return DropdownMenuItem(
                                        value: user['_id'].toString(),
                                        child: Text(user['name']),
                                      );
                                    }).toList(),
                                    onChange: (newVal) {
                                      setState(() {
                                        selectedValueDiserahkan = newVal!;
                                      });
                                    },
                                    value: selectedValueDiserahkan,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Received",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomTextField(
                                      controller: diterima,
                                      label: "Enter Receiver")
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Is Known",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomDropdown(
                                    label: "Is Known",
                                    item: superAdmin.map((user) {
                                      return DropdownMenuItem(
                                        value: user['_id'].toString(),
                                        child: Text(user['name']),
                                      );
                                    }).toList(),
                                    onChange: (newVal) {
                                      setState(() {
                                        selectedValueDiketahui = newVal!;
                                      });
                                    },
                                    value: selectedValueDiketahui,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Company",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomDropdown(
                                    label: "Company",
                                    item: perusahaan.map((perusahaan) {
                                      return DropdownMenuItem(
                                        value: perusahaan['_id'].toString(),
                                        child: Text(perusahaan['company_name']),
                                      );
                                    }).toList(),
                                    onChange: (newVal) {
                                      setState(() {
                                        selectedValuePerusahaan = newVal!;
                                      });
                                    },
                                    value: selectedValuePerusahaan,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Evidence",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();

                                            if (result != null) {
                                              setState(() {
                                                pickedFile = result.files.first;
                                              });
                                            } else {
                                              // User canceled the picker
                                            }
                                          },
                                          child: Container(
                                            width: 60,
                                            height: 48,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(6),
                                                    bottomLeft:
                                                        Radius.circular(6)),
                                                color: const Color(0xffEC1D26)),
                                            child: Center(
                                                child: Icon(
                                              Icons.upload_file_outlined,
                                              color: light,
                                            )),
                                          ),
                                        ),
                                        Container(
                                          width: 237,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF8F6F6),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(6),
                                                  bottomRight:
                                                      Radius.circular(6)),
                                              border: Border.all(
                                                  color: Color(0xffE6E4E4),
                                                  width: 1)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  pickedFile != null
                                                      ? pickedFile!.name
                                                      : "Upload File",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.rubik(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: pickedFile != null
                                                          ? Colors.black
                                                          : Colors.black
                                                              .withOpacity(
                                                                  0.38)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                if (projectName == null ||
                                    remark == null ||
                                    from == null ||
                                    to == null ||
                                    selectedValueDiserahkan == null ||
                                    selectedValuePerusahaan == null ||
                                    selectedValueDiketahui == null ||
                                    diterima == null ||
                                    visselName == null) {
                                  QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      title: 'Peringatan',
                                      text: 'All must be filled in',
                                      width: 400,
                                      confirmBtnColor: Colors.red);
                                } else {
                                  inputDataProject(
                                      projectName.text,
                                      visselName.text,
                                      remark.text,
                                      from.text,
                                      to.text,
                                      selectedValueDiserahkan,
                                      diterima.text,
                                      selectedValueDiketahui,
                                      selectedValuePerusahaan,
                                      pickedFile,
                                      formatted);
                                }
                              },
                              child: Container(
                                width: 123,
                                height: 33,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color(0xffEC1D26)),
                                child: Center(
                                  child: Text("NEXT >",
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

    // Padding(
    //   padding: const EdgeInsets.only(left: 25, top: 15, bottom: 30),
    //   child: SingleChildScrollView(
    //     child: SizedBox(
    //       width: MediaQuery.of(context).size.width,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(right: 59.3, top: 32),
    //                   child: InkWell(
    //                       onTap: () {
    //                         Navigator.pop(context);
    //                       },
    //                       child: Container(
    //                         width: 107.3,
    //                         height: 37.3,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(10),
    //                             border: Border.all(
    //                                 color: const Color(0xffB8B8B8), width: 1)),
    //                         child: Row(
    //                           children: [
    //                             const Icon(
    //                               Icons.subdirectory_arrow_left,
    //                               color: Color(0xffED1D25),
    //                               size: 28.6,
    //                             ),
    //                             const SizedBox(
    //                               width: 10,
    //                             ),
    //                             Text(
    //                               "Back",
    //                               style: GoogleFonts.roboto(
    //                                 fontSize: 17.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: const Color(0xffED1D25),
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                       )),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             width: 500,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   "Project Name",
    //                   style: GoogleFonts.montserrat(
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.w600,
    //                     color: Colors.black,
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   width: 5,
    //                 ),
    //                 Text(
    //                   "(Example : Repair SKKL JASUKA LINK BATAM - PONTIANAK)",
    //                   style: GoogleFonts.montserrat(
    //                     fontSize: 10,
    //                     fontWeight: FontWeight.w600,
    //                     color: Colors.black,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             width: 500,
    //             height: 44,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(6),
    //                 border:
    //                     Border.all(width: 5, color: const Color(0xffF0F0F0)),
    //                 color: Colors.white,
    //                 boxShadow: [
    //                   BoxShadow(
    //                       color: Colors.black.withOpacity(0.25),
    //                       blurRadius: 5,
    //                       offset: const Offset(0, 4))
    //                 ]),
    //             child: Padding(
    //               padding: const EdgeInsets.only(left: 18, bottom: 8),
    //               child: Center(
    //                 child: TextField(
    //                   controller: projectName,
    //                   style: GoogleFonts.montserrat(
    //                     fontSize: 13.3,
    //                     fontWeight: FontWeight.w400,
    //                     color: Colors.black,
    //                   ),
    //                   decoration: InputDecoration(
    //                       border: InputBorder.none,
    //                       hintStyle: GoogleFonts.montserrat(
    //                         fontSize: 13.3,
    //                         fontWeight: FontWeight.w400,
    //                         color: Colors.black,
    //                       ),
    //                       hintText: "Type Here"),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           Container(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Container(
    //                   child: Column(
    //                     children: [
    //                       SizedBox(
    //                         width: 230,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               "Vessel Name",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Container(
    //                         width: 230,
    //                         height: 44,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(6),
    //                             border: Border.all(
    //                                 width: 5, color: const Color(0xffF0F0F0)),
    //                             color: Colors.white,
    //                             boxShadow: [
    //                               BoxShadow(
    //                                   color: Colors.black.withOpacity(0.25),
    //                                   blurRadius: 5,
    //                                   offset: const Offset(0, 4))
    //                             ]),
    //                         child: Padding(
    //                           padding:
    //                               const EdgeInsets.only(left: 18, bottom: 8),
    //                           child: Center(
    //                             child: TextField(
    //                               controller: visselName,
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                               decoration: InputDecoration(
    //                                   border: InputBorder.none,
    //                                   hintStyle: GoogleFonts.montserrat(
    //                                     fontSize: 13.3,
    //                                     fontWeight: FontWeight.w400,
    //                                     color: Colors.black,
    //                                   ),
    //                                   hintText: "Type Here"),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 20,
    //                       ),
    //                       SizedBox(
    //                         width: 230,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               "From",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Container(
    //                         width: 230,
    //                         height: 44,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(6),
    //                             border: Border.all(
    //                                 width: 5, color: const Color(0xffF0F0F0)),
    //                             color: Colors.white,
    //                             boxShadow: [
    //                               BoxShadow(
    //                                   color: Colors.black.withOpacity(0.25),
    //                                   blurRadius: 5,
    //                                   offset: const Offset(0, 4))
    //                             ]),
    //                         child: Padding(
    //                           padding:
    //                               const EdgeInsets.only(left: 18, bottom: 8),
    //                           child: Center(
    //                             child: TextField(
    //                               controller: from,
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                               decoration: InputDecoration(
    //                                   border: InputBorder.none,
    //                                   hintStyle: GoogleFonts.montserrat(
    //                                     fontSize: 13.3,
    //                                     fontWeight: FontWeight.w400,
    //                                     color: Colors.black,
    //                                   ),
    //                                   hintText: "Type Here"),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 20,
    //                       ),
    //                       SizedBox(
    //                         width: 230,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               "submitted",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Container(
    //                         width: 230,
    //                         height: 44,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(6),
    //                             border: Border.all(
    //                                 width: 5, color: const Color(0xffF0F0F0)),
    //                             color: Colors.white,
    //                             boxShadow: [
    //                               BoxShadow(
    //                                   color: Colors.black.withOpacity(0.25),
    //                                   blurRadius: 5,
    //                                   offset: const Offset(0, 4))
    //                             ]),
    //                         child: Padding(
    //                           padding:
    //                               const EdgeInsets.only(left: 18, right: 18),
    //                           child: Center(
    //                             child: DropdownButtonHideUnderline(
    //                               child: DropdownButton(
    //                                 isExpanded: true,
    //                                 style: GoogleFonts.montserrat(
    //                                   fontSize: 13.3,
    //                                   fontWeight: FontWeight.w400,
    //                                   color: Colors.black,
    //                                 ),
    //                                 onChanged: (newVal) {
    //                                   setState(() {
    //                                     selectedValueDiserahkan = newVal!;
    //                                   });
    //                                 },
    //                                 value: selectedValueDiserahkan,
    //                                 items: user.map((user) {
    //                                   return DropdownMenuItem(
    //                                     value: user['_id'].toString(),
    //                                     child: Text(user['name']),
    //                                   );
    //                                 }).toList(),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 20,
    //                       ),
    //                       SizedBox(
    //                         width: 230,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               "Is known",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Container(
    //                         width: 230,
    //                         height: 44,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(6),
    //                             border: Border.all(
    //                                 width: 5, color: const Color(0xffF0F0F0)),
    //                             color: Colors.white,
    //                             boxShadow: [
    //                               BoxShadow(
    //                                   color: Colors.black.withOpacity(0.25),
    //                                   blurRadius: 5,
    //                                   offset: const Offset(0, 4))
    //                             ]),
    //                         child: Padding(
    //                             padding:
    //                                 const EdgeInsets.only(left: 18, right: 18),
    //                             child: Center(
    //                               child: DropdownButtonHideUnderline(
    //                                 child: DropdownButton(
    //                                   isExpanded: true,
    //                                   style: GoogleFonts.montserrat(
    //                                     fontSize: 13.3,
    //                                     fontWeight: FontWeight.w400,
    //                                     color: Colors.black,
    //                                   ),
    //                                   onChanged: (newVal) {
    //                                     setState(() {
    //                                       selectedValueDiketahui = newVal!;
    //                                     });
    //                                   },
    //                                   value: selectedValueDiketahui,
    //                                   items: user.map((user) {
    //                                     return DropdownMenuItem(
    //                                       value: user['_id'].toString(),
    //                                       child: Text(user['name']),
    //                                     );
    //                                   }).toList(),
    //                                 ),
    //                               ),
    //                             )),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   width: 100,
    //                 ),
    //                 Container(
    //                   child: Column(
    //                     children: [
    //                       SizedBox(
    //                         width: 230,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               "Remark",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Container(
    //                         width: 230,
    //                         height: 44,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(6),
    //                             border: Border.all(
    //                                 width: 5, color: const Color(0xffF0F0F0)),
    //                             color: Colors.white,
    //                             boxShadow: [
    //                               BoxShadow(
    //                                   color: Colors.black.withOpacity(0.25),
    //                                   blurRadius: 5,
    //                                   offset: const Offset(0, 4))
    //                             ]),
    //                         child: Padding(
    //                           padding:
    //                               const EdgeInsets.only(left: 18, bottom: 8),
    //                           child: Center(
    //                             child: TextField(
    //                               controller: remark,
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                               decoration: InputDecoration(
    //                                   border: InputBorder.none,
    //                                   hintStyle: GoogleFonts.montserrat(
    //                                     fontSize: 13.3,
    //                                     fontWeight: FontWeight.w400,
    //                                     color: Colors.black,
    //                                   ),
    //                                   hintText: "Type Here"),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 20,
    //                       ),
    //                       SizedBox(
    //                         width: 230,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               "To",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Container(
    //                         width: 230,
    //                         height: 44,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(6),
    //                             border: Border.all(
    //                                 width: 5, color: const Color(0xffF0F0F0)),
    //                             color: Colors.white,
    //                             boxShadow: [
    //                               BoxShadow(
    //                                   color: Colors.black.withOpacity(0.25),
    //                                   blurRadius: 5,
    //                                   offset: const Offset(0, 4))
    //                             ]),
    //                         child: Padding(
    //                           padding:
    //                               const EdgeInsets.only(left: 18, bottom: 8),
    //                           child: Center(
    //                             child: TextField(
    //                               controller: to,
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                               decoration: InputDecoration(
    //                                   border: InputBorder.none,
    //                                   hintStyle: GoogleFonts.montserrat(
    //                                     fontSize: 13.3,
    //                                     fontWeight: FontWeight.w400,
    //                                     color: Colors.black,
    //                                   ),
    //                                   hintText: "Type Here"),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 20,
    //                       ),
    //                       SizedBox(
    //                         width: 230,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               "received",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Container(
    //                         width: 230,
    //                         height: 44,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(6),
    //                             border: Border.all(
    //                                 width: 5, color: const Color(0xffF0F0F0)),
    //                             color: Colors.white,
    //                             boxShadow: [
    //                               BoxShadow(
    //                                   color: Colors.black.withOpacity(0.25),
    //                                   blurRadius: 5,
    //                                   offset: const Offset(0, 4))
    //                             ]),
    //                         child: Padding(
    //                           padding:
    //                               const EdgeInsets.only(left: 18, bottom: 8),
    //                           child: Center(
    //                             child: TextField(
    //                               controller: diterima,
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                               decoration: InputDecoration(
    //                                   border: InputBorder.none,
    //                                   hintStyle: GoogleFonts.montserrat(
    //                                     fontSize: 13.3,
    //                                     fontWeight: FontWeight.w400,
    //                                     color: Colors.black,
    //                                   ),
    //                                   hintText: "Type Here"),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 20,
    //                       ),
    //                       SizedBox(
    //                         width: 230,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               "company",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Container(
    //                         width: 230,
    //                         height: 44,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(6),
    //                             border: Border.all(
    //                                 width: 5, color: const Color(0xffF0F0F0)),
    //                             color: Colors.white,
    //                             boxShadow: [
    //                               BoxShadow(
    //                                   color: Colors.black.withOpacity(0.25),
    //                                   blurRadius: 5,
    //                                   offset: const Offset(0, 4))
    //                             ]),
    //                         child: Padding(
    //                           padding:
    //                               const EdgeInsets.only(left: 18, right: 18),
    //                           child: Center(
    //                             child: DropdownButtonHideUnderline(
    //                               child: DropdownButton(
    //                                 isExpanded: true,
    //                                 style: GoogleFonts.montserrat(
    //                                   fontSize: 13.3,
    //                                   fontWeight: FontWeight.w400,
    //                                   color: Colors.black,
    //                                 ),
    //                                 onChanged: (newVal) {
    //                                   setState(() {
    //                                     selectedValuePerusahaan = newVal!;
    //                                   });
    //                                 },
    //                                 value: selectedValuePerusahaan,
    //                                 items: perusahaan.map((perusahaan) {
    //                                   return DropdownMenuItem(
    //                                     value: perusahaan['_id'].toString(),
    //                                     child: Text(perusahaan['company_name']),
    //                                   );
    //                                 }).toList(),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 50,
    //           ),
    //           InkWell(
    //             onTap: () {
    //               if (projectName == null ||
    //                   remark == null ||
    //                   from == null ||
    //                   to == null ||
    //                   selectedValueDiserahkan == null ||
    //                   selectedValuePerusahaan == null ||
    //                   selectedValueDiketahui == null ||
    //                   diterima == null ||
    //                   visselName == null) {
    //                 QuickAlert.show(
    //                     context: context,
    //                     type: QuickAlertType.error,
    //                     title: 'Peringatan',
    //                     text: 'All must be filled in',
    //                     width: 400,
    //                     confirmBtnColor: Colors.red);
    //               } else {
    //                 inputDataProject(
    //                     projectName.text,
    //                     visselName.text,
    //                     remark.text,
    //                     from.text,
    //                     to.text,
    //                     selectedValueDiserahkan,
    //                     diterima.text,
    //                     selectedValueDiketahui,
    //                     selectedValuePerusahaan);
    //               }
    //             },
    //             child: Container(
    //               width: 90,
    //               height: 37.3,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(6),
    //                   color: const Color(0xffEC1D26)),
    //               child: Center(
    //                 child: Text("NEXT",
    //                     style: GoogleFonts.roboto(
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.w600,
    //                       color: Colors.white,
    //                     )),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  addEvidence(idLoading, evidence) async {
    String msg;
    try {
      final formData = FormData.fromMap({
        "evidence": MultipartFile.fromString(
          evidence.toString(),
          filename: evidence.name,
        ),
      });

      response =
          await dio.post("$uploadEvidenceLoading/$idLoading", data: formData);

      msg = response!.data['message'];
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.success,
      //     text: msg,
      //     title: 'Peringatan',
      //     width: 400,
      //     confirmBtnColor: Colors.red);
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: e.toString(),
          title: 'Upload Evidence Error',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }

  void inputDataProject(projectName, vesselName, remark, from, to, diserahkan,
      diterima, diketahui, perusahaan, evidence, dol) async {
    bool status;
    String id;

    try {
      // var formData = FormData.fromMap({
      //   'Unit': namaUnit,
      // });

      response = await dio.post(newloading, data: {
        "project_name": projectName,
        "vessel_name": vesselName,
        "remark": remark,
        "from": from,
        "to": to,
        "diserahkan": diserahkan,
        "diterima": diterima,
        "diketahui": diketahui,
        "perusahaan": perusahaan,
        "dol_type": dol
      });

      status = response!.data['success'];
      id = response!.data['id'];

      evidence != null ? await addEvidence(id, evidence) : null;

      if (status) {
        FocusScope.of(context).unfocus();

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailLoading(
                      idLoading: id,
                    )
                //CableDanKitLoading(id: id)
                ));
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'failed',
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

  void getDataPerusahaan() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllPerusahaan);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          perusahaan = response!.data['data'];
        });
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

  void getDataUser() async {
    try {
      response = await dio.get(getUser);

      setState(() {
        user = response!.data;
        superAdmin =
            user.where((e) => e["role"].contains("super-admin")).toList();
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
}
