import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/custom_dropdown.dart';
import 'package:telin_project/widgets/custom_text_field.dart';
import 'package:telin_project/widgets/order/new_material/table/detail_cable_new_material.dart';
import 'package:mime/mime.dart';
import '../../../../api/configAPI.dart';
import 'dart:typed_data';
import '../bast_invoice/bast_new_material.dart';

class AddNewCableLarge extends StatefulWidget {
  const AddNewCableLarge(
      {super.key, required this.idNewMaterial, required this.refresh});
  final String idNewMaterial;
  final dynamic refresh;

  @override
  State<AddNewCableLarge> createState() => _AddNewCableLargeState();
}

class _AddNewCableLargeState extends State<AddNewCableLarge> {
  TextEditingController txtRemark = TextEditingController();
  TextEditingController txtLenght = TextEditingController();
  TextEditingController txtE_Core = TextEditingController();

  PlatformFile? pickedFile;

  String? selectionSystem;
  String? selectionCoreType;
  String? selectionCableType;
  String? selectionManufacturer;
  String? selectionArmoringType;
  String? selectionLocation;
  String? selectionTank;
  String? selectionTankLocation;

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
                      "System *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomDropdown(
                      label: "System",
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
                      "Length (Meter) *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomTextField(
                        controller: txtLenght, label: "Input length")
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cable Type *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomDropdown(
                      label: "Select Cable Type",
                      item: cableType.map((cableType) {
                        return DropdownMenuItem(
                          value: cableType['_id'].toString(),
                          child: Text(
                            cableType['cable_type'],
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
                          selectionCableType = newVal!;
                        });
                      },
                      value: selectionCableType,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Core Type *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomDropdown(
                      label: "Select Core Type",
                      item: coreType.map((coreType) {
                        return DropdownMenuItem(
                          value: coreType['_id'].toString(),
                          child: Text(
                            coreType['core_type'],
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
                          selectionCoreType = newVal!;
                        });
                      },
                      value: selectionCoreType,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Manufacturer",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomDropdown(
                      label: "Select Manufacturer",
                      item: manufacturer.map((manufacturer) {
                        return DropdownMenuItem(
                          value: manufacturer['_id'].toString(),
                          child: Text(
                            manufacturer['manufacturer'],
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
                          selectionManufacturer = newVal!;
                        });
                      },
                      value: selectionManufacturer,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Σ Core *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomTextField(
                        controller: txtE_Core, label: "input \u03A3 Core")
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Armoring Type *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomDropdown(
                      label: "Select Armoring Type *",
                      item: armoringType.map((armoringType) {
                        return DropdownMenuItem(
                          value: armoringType['_id'].toString(),
                          child: Text(
                            armoringType['armoring_type'],
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
                          selectionArmoringType = newVal!;
                        });
                      },
                      value: selectionArmoringType,
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
                        controller: txtRemark, label: "input Remark")
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tank *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomDropdown(
                      label: "Select Tank",
                      item: dropdownItemsInner,
                      onChange: (newVal) {
                        setState(() {
                          selectionTank = newVal!;
                        });
                      },
                      value: selectionTank,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tank Location *",
                      style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    CustomDropdown(
                      label: "Select Tank Location",
                      item: dropdownItemsTankLocation,
                      onChange: (newVal) {
                        setState(() {
                          selectionTankLocation = newVal!;
                        });
                      },
                      value: selectionTankLocation,
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
                  if (selectionSystem == null &&
                      selectionCableType == null &&
                      selectionManufacturer == null &&
                      selectionArmoringType == null &&
                      txtLenght == "" &&
                      selectionTank == null &&
                      selectionTankLocation == null &&
                      selectionCoreType == null &&
                      txtE_Core == "") {
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
                        selectionTank,
                        txtRemark.text,
                        selectionCoreType,
                        txtE_Core.text,
                        selectionTankLocation,
                        pickedFile);
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
  }

  void _clearForm() {
    setState(() {
      selectionSystem = null;
      selectionCableType = null;
      selectionManufacturer = null;
      selectionArmoringType = null;
      txtLenght.clear();
      selectionTank = null;
      txtRemark.clear();
      selectionCoreType = null;
      txtE_Core.clear();
      selectionTankLocation = null;
      pickedFile = null;
    });
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

  addEvidence(idNewMaterial, cableId, evidence) async {
    String msg;
    try {
      final contentType = File(evidence);
      final formData = FormData.fromMap({
        "evidence": MultipartFile.fromString(
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

  void inputDataNewMaterialCable(system, cableType, manufacturer, armoringType,
      length, inner, remark, coreType, eCore, tankLocation, evidence) async {
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

      evidence != null
          ? await addEvidence(widget.idNewMaterial, id, evidence)
          : null;
      if (status) {
        // FocusScope.of(context).unfocus();
        _clearForm();

        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Add Cable Success',
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
