import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/custom_dropdown.dart';
import 'package:telin_project/widgets/custom_text_field.dart';
import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';

import '../../../../api/configAPI.dart';

class AddNewNonCableLarge extends StatefulWidget {
  const AddNewNonCableLarge(
      {super.key, required this.idNewMaterial, required this.refresh});
  final String idNewMaterial;
  final dynamic refresh;

  @override
  State<AddNewNonCableLarge> createState() => _AddNewNonCableLargeState();
}

class _AddNewNonCableLargeState extends State<AddNewNonCableLarge> {
  TextEditingController txtItemName = TextEditingController();

  TextEditingController txtNamaEvidence = TextEditingController();
  TextEditingController txtPartNumber = TextEditingController();
  TextEditingController txtSerialNumber = TextEditingController();
  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtLable = TextEditingController();
  TextEditingController txtQty = TextEditingController();
  TextEditingController txtRemark = TextEditingController();

  String? selectionSystem;
  String? selectionUnit;
  String? selectionLocation;
  PlatformFile? pickedFile;

  List system = [];
  List unit = [];
  List location = [];

  Response? response;

  var dio = Dio();
  @override
  void initState() {
    // TODO: implement initState
    getDataSystem();
    getDataUnit();
    getDataLocation();

    super.initState();
  }

  List<DropdownMenuItem<String>> get dropdownItemsLocation {
    List<DropdownMenuItem<String>> menuItemsLocation = [
      const DropdownMenuItem(
          value: "Select Location", child: Text("Select Location")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsLocation;
  }

  List<DropdownMenuItem<String>> get dropdownItemsSystem {
    List<DropdownMenuItem<String>> menuItemsSystem = [
      const DropdownMenuItem(
          value: "Select System", child: Text("Select System")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsSystem;
  }

  List<DropdownMenuItem<String>> get dropdownItemsUnit {
    List<DropdownMenuItem<String>> menuItemsUnit = [
      const DropdownMenuItem(value: "Select Unit", child: Text("Select Unit")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsUnit;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      "Item Name *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomTextField(
                        controller: txtItemName, label: "Input Item Name")
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Weight (KG) *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomTextField(
                        controller: txtWeight, label: "Input Weight")
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quantity *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomTextField(controller: txtQty, label: "Input QTY")
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomDropdown(
                      label: "Select Location",
                      item: location.map((location) {
                        return DropdownMenuItem(
                          value: location['location'].toString(),
                          child: Text(
                            location['location'],
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChange: (newVal) {
                        setState(() {
                          selectionLocation = newVal!;
                        });
                      },
                      value: selectionLocation,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "System *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomDropdown(
                      label: "Select System",
                      item: system.map((system) {
                        return DropdownMenuItem(
                          value: system['_id'].toString(),
                          child: Text(
                            system['system'],
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChange: (newVal) {
                        setState(() {
                          selectionSystem = newVal!;
                        });
                      },
                      value: selectionSystem,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Part Number *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomTextField(
                        controller: txtPartNumber, label: "input Part Number")
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Serial Number *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomTextField(
                        controller: txtSerialNumber,
                        label: "Imput Serial Number")
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Unit",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomDropdown(
                      label: "Select Unit",
                      item: unit.map((unit) {
                        return DropdownMenuItem(
                          value: unit['unit'].toString(),
                          child: Text(
                            unit['unit'].toString(),
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChange: (newVal) {
                        setState(() {
                          selectionUnit = newVal!;
                          print(unit);
                        });
                      },
                      value: selectionUnit,
                    )
                  ],
                ),
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
                        controller: txtRemark, label: "Input Remark")
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          setState(() {
                            pickedFile = result.files.first;
                          });
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Container(
                        width: 152,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6)),
                            color: const Color(0xffEC1D26)),
                        child: Center(
                          child: Text("Upload Evidence",
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: light,
                              )),
                        ),
                      ),
                    ),
                    Container(
                      width: 408,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Color(0xffF8F6F6),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6)),
                          border:
                              Border.all(color: Color(0xffE6E4E4), width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              pickedFile != null
                                  ? pickedFile!.name
                                  : "Upload File",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: pickedFile != null
                                      ? Colors.black
                                      : Colors.black.withOpacity(0.38)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (txtItemName.text == null ||
                      selectionLocation == null ||
                      txtPartNumber == null ||
                      txtSerialNumber == null ||
                      txtWeight == null ||
                      txtQty == null ||
                      selectionSystem == null ||
                      selectionUnit == null) {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: 'Peringatan',
                        text: 'Field with * is cant be empty',
                        width: 400,
                        confirmBtnColor: Colors.red);
                  } else {
                    inputDataNewMaterialNonCable(
                        txtItemName.text,
                        selectionLocation,
                        txtPartNumber.text,
                        txtSerialNumber.text,
                        txtWeight.text,
                        txtQty.text,
                        selectionSystem,
                        selectionUnit,
                        pickedFile,
                        txtRemark.text);
                  }
                },
                child: Container(
                  width: 189,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xffEC1D26)),
                  child: Center(
                    child: Text("ADD",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: light,
                        )),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );

    // Padding(
    //   padding: const EdgeInsets.only(bottom: 20),
    //   child: Column(
    //     children: [
    //       Container(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Container(
    //               child: Column(
    //                 children: [
    //                   SizedBox(
    //                     width: 230,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Item Name *",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 230,
    //                     height: 44,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(
    //                             width: 5, color: const Color(0xffF0F0F0)),
    //                         color: Colors.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Colors.black.withOpacity(0.25),
    //                               blurRadius: 5,
    //                               offset: const Offset(0, 4))
    //                         ]),
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(
    //                         left: 18,
    //                       ),
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(bottom: 8),
    //                         child: TextField(
    //                           controller: txtItemName,
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 13.3,
    //                             fontWeight: FontWeight.w400,
    //                             color: Colors.black,
    //                           ),
    //                           decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintStyle: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                               hintText: "Item Name"),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 20.6,
    //                   ),
    //                   SizedBox(
    //                     width: 230,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Location *",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 230,
    //                     height: 44,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(
    //                             width: 5, color: const Color(0xffF0F0F0)),
    //                         color: Colors.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Colors.black.withOpacity(0.25),
    //                               blurRadius: 5,
    //                               offset: const Offset(0, 4))
    //                         ]),
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(left: 18, right: 18),
    //                       child: Center(
    //                         child: DropdownButtonHideUnderline(
    //                           child: DropdownButton(
    //                             isExpanded: true,
    //                             hint: Text(
    //                               "Select Location",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             style: GoogleFonts.montserrat(
    //                               fontSize: 13.3,
    //                               fontWeight: FontWeight.w400,
    //                               color: Colors.black,
    //                             ),
    //                             onChanged: (newVal) {
    //                               setState(() {
    //                                 selectionLocation = newVal!;
    //                               });
    //                             },
    //                             value: selectionLocation,
    //                             items: location.map((location) {
    //                               return DropdownMenuItem(
    //                                 value: location['location'].toString(),
    //                                 child: Text(location['location'],
    //                                     style: GoogleFonts.montserrat(
    //                                       fontSize: 13.3,
    //                                       fontWeight: FontWeight.w400,
    //                                       color: Colors.black,
    //                                     )),
    //                               );
    //                             }).toList(),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 20.6,
    //                   ),
    //                   SizedBox(
    //                     width: 230,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Part Number *",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 230,
    //                     height: 44,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(
    //                             width: 5, color: const Color(0xffF0F0F0)),
    //                         color: Colors.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Colors.black.withOpacity(0.25),
    //                               blurRadius: 5,
    //                               offset: const Offset(0, 4))
    //                         ]),
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(
    //                         left: 18,
    //                       ),
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(bottom: 8),
    //                         child: TextField(
    //                           controller: txtPartNumber,
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 13.3,
    //                             fontWeight: FontWeight.w400,
    //                             color: Colors.black,
    //                           ),
    //                           decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintStyle: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                               hintText: "Part Number"),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 20.6,
    //                   ),
    //                   SizedBox(
    //                     width: 230,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Serial Number *",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 230,
    //                     height: 44,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(
    //                             width: 5, color: const Color(0xffF0F0F0)),
    //                         color: Colors.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Colors.black.withOpacity(0.25),
    //                               blurRadius: 5,
    //                               offset: const Offset(0, 4))
    //                         ]),
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(
    //                         left: 18,
    //                       ),
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(bottom: 8),
    //                         child: TextField(
    //                           controller: txtSerialNumber,
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 13.3,
    //                             fontWeight: FontWeight.w400,
    //                             color: Colors.black,
    //                           ),
    //                           decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintStyle: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                               hintText: "Serial Number"),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 40,
    //             ),
    //             Container(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   SizedBox(
    //                     width: 230,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Weigth *",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 203.3,
    //                     height: 44,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(
    //                             width: 5, color: const Color(0xffF0F0F0)),
    //                         color: Colors.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Colors.black.withOpacity(0.25),
    //                               blurRadius: 5,
    //                               offset: const Offset(0, 4))
    //                         ]),
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(
    //                         left: 18,
    //                       ),
    //                       child: Row(
    //                         children: [
    //                           Expanded(
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(bottom: 8),
    //                               child: TextField(
    //                                 controller: txtWeight,
    //                                 style: GoogleFonts.montserrat(
    //                                   fontSize: 13.3,
    //                                   fontWeight: FontWeight.w400,
    //                                   color: Colors.black,
    //                                 ),
    //                                 decoration: InputDecoration(
    //                                     border: InputBorder.none,
    //                                     hintStyle: GoogleFonts.montserrat(
    //                                       fontSize: 13.3,
    //                                       fontWeight: FontWeight.w400,
    //                                       color: Colors.black,
    //                                     ),
    //                                     hintText: "Type Weigth"),
    //                               ),
    //                             ),
    //                           ),
    //                           Container(
    //                             width: 68.6,
    //                             height: 44,
    //                             decoration: const BoxDecoration(
    //                                 borderRadius: BorderRadius.only(
    //                                     topRight: Radius.circular(6),
    //                                     bottomRight: Radius.circular(6)),
    //                                 color: Color(0xffEC1D26)),
    //                             child: Center(
    //                               child: Text(
    //                                 "Kilogram",
    //                                 style: GoogleFonts.montserrat(
    //                                   fontSize: 13.3,
    //                                   fontWeight: FontWeight.w500,
    //                                   color: Colors.white,
    //                                 ),
    //                               ),
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 20.6,
    //                   ),
    //                   SizedBox(
    //                     width: 230,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "QTY *",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 203.3,
    //                     height: 44,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(
    //                             width: 5, color: const Color(0xffF0F0F0)),
    //                         color: Colors.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Colors.black.withOpacity(0.25),
    //                               blurRadius: 5,
    //                               offset: const Offset(0, 4))
    //                         ]),
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(
    //                         left: 18,
    //                       ),
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(bottom: 8),
    //                         child: TextField(
    //                           controller: txtQty,
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 13.3,
    //                             fontWeight: FontWeight.w400,
    //                             color: Colors.black,
    //                           ),
    //                           decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintStyle: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                               hintText: "Type Quantity"),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 20.6,
    //                   ),
    //                   SizedBox(
    //                     width: 230,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "System *",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 230,
    //                     height: 44,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(
    //                             width: 5, color: const Color(0xffF0F0F0)),
    //                         color: Colors.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Colors.black.withOpacity(0.25),
    //                               blurRadius: 5,
    //                               offset: const Offset(0, 4))
    //                         ]),
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(left: 18, right: 18),
    //                       child: Center(
    //                         child: DropdownButtonHideUnderline(
    //                           child: DropdownButton(
    //                             isExpanded: true,
    //                             hint: Text(
    //                               "Select System",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             style: GoogleFonts.montserrat(
    //                               fontSize: 13.3,
    //                               fontWeight: FontWeight.w400,
    //                               color: Colors.black,
    //                             ),
    //                             onChanged: (newVal) {
    //                               setState(() {
    //                                 selectionSystem = newVal!;
    //                               });
    //                             },
    //                             value: selectionSystem,
    //                             items: system.map((system) {
    //                               return DropdownMenuItem(
    //                                 value: system['_id'].toString(),
    //                                 child: Text(system['system'],
    //                                     style: GoogleFonts.montserrat(
    //                                       fontSize: 13.3,
    //                                       fontWeight: FontWeight.w400,
    //                                       color: Colors.black,
    //                                     )),
    //                               );
    //                             }).toList(),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 20.6,
    //                   ),
    //                   SizedBox(
    //                     width: 230,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Unit *",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 230,
    //                     height: 44,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(
    //                             width: 5, color: const Color(0xffF0F0F0)),
    //                         color: Colors.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Colors.black.withOpacity(0.25),
    //                               blurRadius: 5,
    //                               offset: const Offset(0, 4))
    //                         ]),
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(left: 18, right: 18),
    //                       child: Center(
    //                         child: DropdownButtonHideUnderline(
    //                           child: DropdownButton(
    //                             isExpanded: true,
    //                             hint: Text(
    //                               "Select Unit",
    //                               style: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             style: GoogleFonts.montserrat(
    //                               fontSize: 13.3,
    //                               fontWeight: FontWeight.w400,
    //                               color: Colors.black,
    //                             ),
    //                             onChanged: (newVal) {
    //                               setState(() {
    //                                 selectionUnit = newVal!;
    //                               });
    //                             },
    //                             value: selectionUnit,
    //                             items: unit.map((unit) {
    //                               return DropdownMenuItem(
    //                                 value: unit['unit'].toString(),
    //                                 child: Text(unit['unit'],
    //                                     style: GoogleFonts.montserrat(
    //                                       fontSize: 13.3,
    //                                       fontWeight: FontWeight.w400,
    //                                       color: Colors.black,
    //                                     )),
    //                               );
    //                             }).toList(),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 40,
    //             ),
    //             Container(
    //               child: Column(
    //                 children: [
    //                   SizedBox(
    //                     width: 230,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "EVIDENCE",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 230,
    //                     height: 44,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(
    //                             width: 5, color: const Color(0xffF0F0F0)),
    //                         color: Colors.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Colors.black.withOpacity(0.25),
    //                               blurRadius: 5,
    //                               offset: const Offset(0, 4))
    //                         ]),
    //                     child: Padding(
    //                         padding: const EdgeInsets.only(left: 18, bottom: 8),
    //                         child: Row(
    //                           children: [
    //                             IconButton(
    //                               onPressed: () async {
    //                                 FilePickerResult? result =
    //                                     await FilePicker.platform.pickFiles();

    //                                 if (result != null) {
    //                                   setState(() {
    //                                     pickedFile = result.files.first;
    //                                   });
    //                                 } else {
    //                                   // User canceled the picker
    //                                 }
    //                               },
    //                               icon: const Icon(Icons.upload_file),
    //                             ),
    //                             const SizedBox(
    //                               width: 5,
    //                             ),
    //                             Flexible(
    //                               child: Text(
    //                                   pickedFile != null
    //                                       ? pickedFile!.name
    //                                       : "Upload File",
    //                                   overflow: TextOverflow.ellipsis,
    //                                   style: GoogleFonts.montserrat(
    //                                     fontSize: 13.3,
    //                                     fontWeight: FontWeight.w400,
    //                                     color: Colors.black,
    //                                   )),
    //                             )
    //                           ],
    //                         )),
    //                   ),
    //                   const SizedBox(
    //                     height: 20.6,
    //                   ),
    //                   SizedBox(
    //                     width: 230,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Remark",
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 230,
    //                     height: 44,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(
    //                             width: 5, color: const Color(0xffF0F0F0)),
    //                         color: Colors.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Colors.black.withOpacity(0.25),
    //                               blurRadius: 5,
    //                               offset: const Offset(0, 4))
    //                         ]),
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(left: 18, bottom: 8),
    //                       child: Center(
    //                         child: TextField(
    //                           controller: txtRemark,
    //                           style: GoogleFonts.montserrat(
    //                             fontSize: 13.3,
    //                             fontWeight: FontWeight.w400,
    //                             color: Colors.black,
    //                           ),
    //                           decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintStyle: GoogleFonts.montserrat(
    //                                 fontSize: 13.3,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: Colors.black,
    //                               ),
    //                               hintText: "Type Here"),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 72,
    //       ),
    //       InkWell(
    //         onTap: () {
    //           if (txtItemName.text == null ||
    //               selectedValueLocation == null ||
    //               txtPartNumber == null ||
    //               txtSerialNumber == null ||
    //               txtWeight == null ||
    //               txtQty == null ||
    //               selectionSystem == null ||
    //               selectionUnit == null) {
    //             QuickAlert.show(
    //                 context: context,
    //                 type: QuickAlertType.error,
    //                 title: 'Peringatan',
    //                 text: 'Field with * is cant be empty',
    //                 width: 400,
    //                 confirmBtnColor: Colors.red);
    //           } else {
    //             inputDataNewMaterialNonCable(
    //                 txtItemName.text,
    //                 selectionLocation,
    //                 txtPartNumber.text,
    //                 txtSerialNumber.text,
    //                 txtWeight.text,
    //                 txtQty.text,
    //                 selectionSystem,
    //                 selectionUnit,
    //                 pickedFile,
    //                 txtRemark.text);
    //           }
    //         },
    //         child: Container(
    //           width: 90,
    //           height: 37.3,
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(6),
    //               color: const Color(0xffEC1D26)),
    //           child: Center(
    //             child: Text("Add",
    //                 style: GoogleFonts.roboto(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.white,
    //                 )),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  // Clear the form
  void _clearForm() {
    // txtItemName.clear();
  }
  addEvidence(idNewMaterial, kitId, evidence) async {
    String msg;
    try {
      final formData = FormData.fromMap({
        "evidence": await MultipartFile.fromString(
          evidence.toString(),
          filename: evidence.name,
        ),
      });

      response = await dio.post("$addEvidenceKit/$idNewMaterial/$kitId",
          data: formData);

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

  // Fungsi Add Data
  void inputDataNewMaterialNonCable(itemName, location, partNumber,
      serialNumber, weight, qty, system, unit, evidence, remark) async {
    bool status;
    var msg;
    String id;
    try {
      // var formData = FormData.fromMap({
      //   'Unit': namaUnit,
      // });

      response =
          await dio.post("$addKitToNewMaterial/${widget.idNewMaterial}", data: {
        "location:": "Makassar",
        'item_name': itemName,
        'rak_number': location,
        'part_number': partNumber,
        'serial_number': serialNumber,
        'weight_kg': weight,
        'qty': qty,
        'system': system,
        'unit': unit,
        // 'evidence': evidence,
        'keterangan': remark ?? "",
      });
      status = response!.data['success'];
      id = response!.data['newKitId'];

      evidence != null ? addEvidence(widget.idNewMaterial, id, evidence) : null;

      if (status) {
        FocusScope.of(context).unfocus();
        _clearForm();
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Add Kit Success',
            width: 400,
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () {
              widget.refresh();
              Navigator.pop(context, true);
            });
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'Add Kit Faileed',
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

  void getDataSystem() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllSystem);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          system = response!.data['data'];
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

  void getDataUnit() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllUnit);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          unit = response!.data['data'];
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

  void getDataLocation() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllLocation);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          location = response!.data['data'];
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
}
