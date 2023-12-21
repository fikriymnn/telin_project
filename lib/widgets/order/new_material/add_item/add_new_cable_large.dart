import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../api/configAPI.dart';
import '../bast_invoice/bast_new_material.dart';

class AddNewCableLarge extends StatefulWidget {
  const AddNewCableLarge({super.key, required this.idNewMaterial});
  final String idNewMaterial;

  @override
  State<AddNewCableLarge> createState() => _AddNewCableLargeState();
}

class _AddNewCableLargeState extends State<AddNewCableLarge> {
  TextEditingController txtTankLocation = TextEditingController();
  TextEditingController txtRemark = TextEditingController();
  TextEditingController txtLenght = TextEditingController();
  TextEditingController txtE_Core = TextEditingController();
  TextEditingController txtLable = TextEditingController();

  PlatformFile? pickedFile;

  String? selectionSystem;
  String? selectionCoreType;
  String? selectionCableType;
  String? selectionManufacturer;
  String? selectionArmoringType;
  String? selectionLocation;

  List system = [];
  List coreType = [];
  List cableType = [];
  List manufacturer = [];
  List armoringType = [];
  List location = [];

  Response? response;
  Response? response1;
  var dio = Dio();
  var dio1 = Dio();
  @override
  void initState() {
    // TODO: implement initState
    getDataSystem();
    getDataArmoringType();
    getDataCoreType();
    getDataCableType();
    getDataManufacturer();
    getDataLocation();

    super.initState();
  }

  List<DropdownMenuItem<String>> get dropdownItemsInner {
    List<DropdownMenuItem<String>> menuItemsInner = [
      const DropdownMenuItem(value: "INNER", child: Text("INNER")),
      const DropdownMenuItem(value: "OUTER", child: Text("OUTER")),
    ];
    return menuItemsInner;
  }

  List<DropdownMenuItem<String>> get dropdownItemsTankLocation {
    List<DropdownMenuItem<String>> menuItemsInner = [
      const DropdownMenuItem(value: "TANK-2", child: Text("TANK-2")),
      const DropdownMenuItem(value: "TANK-3", child: Text("TANK-3")),
      const DropdownMenuItem(value: "TANK-4", child: Text("TANK-4")),
      const DropdownMenuItem(value: "TANK-5", child: Text("TANK-5")),
      const DropdownMenuItem(value: "TANK-7", child: Text("TANK-7")),
      const DropdownMenuItem(value: "TANK-8", child: Text("TANK-8")),
      const DropdownMenuItem(value: "TANK-9", child: Text("TANK-9")),
      const DropdownMenuItem(value: "TANK-10", child: Text("TANK-10")),
      const DropdownMenuItem(value: "TANK-11", child: Text("TANK-11")),
    ];
    return menuItemsInner;
  }

  String selectedValueCableType = "Select Cable Type";
  String selectedValueManufacture = "Select Manufacture";
  String selectedValueArmoringType = "Select Armoring Type";
  String selectedValueCoreType = "Select Core Type";
  String selectedValueCore = "Select Core";
  String? selectedValueInner;
  String selectedValueSystem = "Select System";

  Future selecFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        pickedFile = result.files.first;
      });
    }
    return;
  }

  //  String? _fileName;
  // String? _saveAsFileName;
  // PlatformFile? _paths;
  // String? _directoryPath;
  // String? _extension;
  // bool _isLoading = false;
  // bool _lockParentWindow = false;
  // bool _userAborted = false;
  // bool _multiPick = false;
  // FileType _pickingType = FileType.any;

  //  void _pickFiles() async {
  //   _resetState();
  //   try {
  //     _directoryPath = null;
  //     final _paths = await FilePicker.platform.pickFiles(
  //     )
  //        ;
  //   } on PlatformException catch (e) {
  //    Text('Unsupported operation' + e.toString());
  //   } catch (e) {
  //     Text(e.toString());
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     _isLoading = false;
  //     _fileName =
  //         _paths != null ? _paths!.first.name : '...';
  //     _userAborted = _paths == null;
  //   });
  // }

  //  void _resetState() {
  //   if (!mounted) {
  //     return;
  //   }
  //   setState(() {
  //     _isLoading = true;
  //     _directoryPath = null;
  //     _fileName = null;
  //     _paths = null;
  //     _saveAsFileName = null;
  //     _userAborted = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "System *",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 5, color: const Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 4))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  "Select System",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                onChanged: (newVal) {
                                  setState(() {
                                    selectionSystem = newVal!;
                                  });
                                },
                                value: selectionSystem,
                                items: system.map((system) {
                                  return DropdownMenuItem(
                                    value: system['_id'].toString(),
                                    child: Text(
                                      system['system'],
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.6,
                      ),
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Cable Type *",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 5, color: const Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 4))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  "Select Cable Type",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                onChanged: (newVal) {
                                  setState(() {
                                    selectionCableType = newVal!;
                                  });
                                },
                                value: selectionCableType,
                                items: cableType.map((cableType) {
                                  return DropdownMenuItem(
                                    value: cableType['_id'].toString(),
                                    child: Text(
                                      cableType['cable_type'],
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.6,
                      ),
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Manufacture *",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 5, color: const Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 4))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  "Select Manufacturer",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                onChanged: (newVal) {
                                  setState(() {
                                    selectionManufacturer = newVal!;
                                  });
                                },
                                value: selectionManufacturer,
                                items: manufacturer.map((manufacturer) {
                                  return DropdownMenuItem(
                                    value: manufacturer['_id'].toString(),
                                    child: Text(
                                      manufacturer['manufacturer'],
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.6,
                      ),
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Armoring Type *",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 5, color: const Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 4))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  "Select Armoring Type",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                onChanged: (newVal) {
                                  setState(() {
                                    selectionArmoringType = newVal!;
                                  });
                                },
                                value: selectionArmoringType,
                                items: armoringType.map((armoringType) {
                                  return DropdownMenuItem(
                                    value: armoringType['_id'].toString(),
                                    child: Text(
                                      armoringType['armoring_type'],
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Length *",
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 203.3,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 5, color: const Color(0xffF0F0F0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 5,
                                    offset: const Offset(0, 4))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 18,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: TextField(
                                      controller: txtLenght,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: GoogleFonts.montserrat(
                                            fontSize: 13.3,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                          hintText: "Type Length"),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 68.6,
                                  height: 44,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(6),
                                          bottomRight: Radius.circular(6)),
                                      color: Color(0xffEC1D26)),
                                  child: Center(
                                    child: Text(
                                      "Meter",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.6,
                        ),
                        // SizedBox(
                        //   width: 230,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "Lable *",
                        //         style: GoogleFonts.montserrat(
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.w600,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   width: 230,
                        //   height: 44,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(6),
                        //       border: Border.all(
                        //           width: 5, color: const Color(0xffF0F0F0)),
                        //       color: Colors.white,
                        //       boxShadow: [
                        //         BoxShadow(
                        //             color: Colors.black.withOpacity(0.25),
                        //             blurRadius: 5,
                        //             offset: const Offset(0, 4))
                        //       ]),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 18, bottom: 8),
                        //     child: Center(
                        //       child: TextField(
                        //         controller: txtLable,
                        //         style: GoogleFonts.montserrat(
                        //           fontSize: 13.3,
                        //           fontWeight: FontWeight.w400,
                        //           color: Colors.black,
                        //         ),
                        //         decoration: InputDecoration(
                        //             border: InputBorder.none,
                        //             hintStyle: GoogleFonts.montserrat(
                        //               fontSize: 13.3,
                        //               fontWeight: FontWeight.w400,
                        //               color: Colors.black,
                        //             ),
                        //             hintText: "Type Here"),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 20.6,
                        // ),
                        SizedBox(
                          width: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Tank *",
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 230,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 5, color: const Color(0xffF0F0F0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 5,
                                    offset: const Offset(0, 4))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text(
                                      "Select Tank",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValueInner = newValue!;
                                      });
                                    },
                                    value: selectedValueInner,
                                    items: dropdownItemsInner),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.6,
                        ),
                        SizedBox(
                          width: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Tank-Location *",
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 230,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 5, color: const Color(0xffF0F0F0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 5,
                                    offset: const Offset(0, 4))
                              ]),
                          child:
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 18, bottom: 8),
                              //   child: Center(
                              //     child: TextField(
                              //       controller: txtTankLocation,
                              //       style: GoogleFonts.montserrat(
                              //         fontSize: 13.3,
                              //         fontWeight: FontWeight.w400,
                              //         color: Colors.black,
                              //       ),
                              //       decoration: InputDecoration(
                              //           border: InputBorder.none,
                              //           hintStyle: GoogleFonts.montserrat(
                              //             fontSize: 13.3,
                              //             fontWeight: FontWeight.w400,
                              //             color: Colors.black,
                              //           ),
                              //           hintText: "Type Here"),
                              //     ),
                              //   ),
                              // ),
                              Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text(
                                      "Select Location",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    onChanged: (newVal) {
                                      setState(() {
                                        selectionLocation = newVal!;
                                      });
                                    },
                                    value: selectionLocation,
                                    items: dropdownItemsTankLocation),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "EVIDENCE",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 5, color: const Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 4))
                            ]),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 18, bottom: 8),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
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
                                  icon: const Icon(Icons.upload_file),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Text(
                                      pickedFile != null
                                          ? pickedFile!.name
                                          : "Upload File",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      )),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20.6,
                      ),
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Remark",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 5, color: const Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 4))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, bottom: 8),
                          child: Center(
                            child: TextField(
                              controller: txtRemark,
                              style: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  hintText: "Type Here"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.6,
                      ),
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Core Type *",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 5, color: const Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 4))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  "Select Core Type",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                onChanged: (newVal) {
                                  setState(() {
                                    selectionCoreType = newVal!;
                                  });
                                },
                                value: selectionCoreType,
                                items: coreType.map((coreType) {
                                  return DropdownMenuItem(
                                    value: coreType['_id'].toString(),
                                    child: Text(
                                      coreType['core_type'],
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.6,
                      ),
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\u03A3 Core *",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 5, color: const Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 4))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, bottom: 8),
                          child: Center(
                            child: TextField(
                              controller: txtE_Core,
                              style: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  hintText: "Type Here"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 72,
          ),
          InkWell(
            onTap: () {
              if (selectionSystem == null ||
                  selectedValueCableType == null ||
                  selectionManufacturer == null ||
                  selectionArmoringType == null ||
                  txtLenght == null ||
                  selectedValueInner == null ||
                  selectionLocation == null ||
                  selectionCoreType == null ||
                  txtE_Core == null) {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Field with * is cant be empty',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else {
                inputDataNewMaterialCable(
                    selectionSystem,
                    selectionCableType,
                    selectionManufacturer,
                    selectionArmoringType,
                    txtLenght.text,
                    txtLable.text,
                    selectedValueInner,
                    txtRemark.text,
                    selectionCoreType,
                    txtE_Core.text,
                    selectionLocation,
                    pickedFile);
              }
            },
            child: Container(
              width: 90,
              height: 37.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xffEC1D26)),
              child: Center(
                child: Text("Add",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getDataCoreType() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllCoreType);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          coreType = response!.data['data'];
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

  void getDataCableType() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllCableType);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          cableType = response!.data['data'];
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

  void getDataManufacturer() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllManufacturer);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          manufacturer = response!.data['data'];
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

  void getDataArmoringType() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllArmoring);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          armoringType = response!.data['data'];
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

  // Clear the form
  void _clearForm() {
    // txtNamaUnit.clear();
  }
  addEvidence(idNewMaterial, cableId, evidence) async {
    String msg;
    try {
      final formData = FormData.fromMap({
        "evidence": await MultipartFile.fromString(
          evidence.toString(),
          filename: evidence.name,
        ),
      });

      response = await dio.post("$addEvidenceCable/$idNewMaterial/$cableId",
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

  void inputDataNewMaterialCable(
      system,
      cableType,
      manufacturer,
      armoringType,
      length,
      label,
      inner,
      remark,
      coreType,
      eCore,
      tankLocation,
      evidence) async {
    bool status;
    String id;

    try {
      // var formData = FormData.fromMap({
      //   'Unit': namaUnit,
      // });
      // FormData formdata = FormData.fromMap({
      //   'evidence':
      //       await MultipartFile.fromFile(evidence, filename: "tftfty.txt"),
      // });

      response = await dio
          .post("$addCableToNewMaterial/${widget.idNewMaterial}", data: {
        "depo_location": "makassars",
        'system': system,
        'cable_type': cableType,
        'manufacturer': manufacturer,
        'armoring_type': armoringType,
        'length_report': length,
        'length_meas': length,
        'keterangan': "keterangan",
        "doc_reff": "SCRAP",
        'tank': inner,
        'tank_location': tankLocation,
        'remark': remark ?? "",
        'core_type': coreType,
        'sigma_core': eCore,
        'E_core': eCore,
      });
      status = response!.data['success'];
      id = response!.data['newCableId'];

      evidence != null ? addEvidence(widget.idNewMaterial, id, evidence) : null;

      if (status) {
        // FocusScope.of(context).unfocus();
        // _clearForm();
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Add Cable Success',
            width: 400,
            confirmBtnColor: Colors.green);
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'Add Cable Failed',
            title: 'Peringatan',
            width: 400,
            confirmBtnColor: Colors.red);
      }
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: e.toString(),
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }
}
