import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';

import '../../../../api/configAPI.dart';


class AddNewNonCableLarge extends StatefulWidget {
  const AddNewNonCableLarge({super.key});

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
          value: "Select Location",
          child: Text("Select Location")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsLocation;
  }

  List<DropdownMenuItem<String>> get dropdownItemsSystem {
    List<DropdownMenuItem<String>> menuItemsSystem = [
      const DropdownMenuItem(value: "Select System", child: Text("Select System")),
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

  String selectedValueLocation = "Select Location";

  String selectedValueSystem = "Select System";
  String selectedValueUnit = "Select Unit";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
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
                              "Item Name",
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
                            border:
                                Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: TextField(
                              controller: txtItemName,
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
                                  hintText: "Item Name"),
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
                              "Location",
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
                            border:
                                Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                                items: location.map((location) {
                                  return DropdownMenuItem(
                                    value: location['_id'].toString(),
                                    child: Text(location['location']),
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
                              "Part Number",
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
                            border:
                                Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: TextField(
                              controller: txtPartNumber,
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
                                  hintText: "Part Number"),
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
                              "Serial Number",
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
                            border:
                                Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: TextField(
                              controller: txtSerialNumber,
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
                                  hintText: "Serial Number"),
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
                              "Weigth",
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
                            border:
                                Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                                    controller: txtWeight,
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
                                        hintText: "Type Weigth"),
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
                                    "Kilogram",
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
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "QTY",
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
                            border:
                                Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: TextField(
                              controller: txtQty,
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
                                  hintText: "Type Quantity"),
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
                              "System",
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
                            border:
                                Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                                    child: Text(system['system']),
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
                              "Unit",
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
                            border:
                                Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                onChanged: (newVal) {
                                  setState(() {
                                    selectionUnit = newVal!;
                                  });
                                },
                                value: selectionUnit,
                                items: unit.map((unit) {
                                  return DropdownMenuItem(
                                    value: unit['_id'].toString(),
                                    child: Text(unit['unit']),
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
                    children: [
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Evidence",
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
                            border:
                                Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                              controller: txtNamaEvidence,
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
                            border:
                                Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
              if (txtItemName.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Item Name Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (selectionLocation == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Location Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (txtPartNumber.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Part Number Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (txtSerialNumber.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Serial Number Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (txtWeight.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Weight Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (txtQty.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Qty Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (selectionSystem == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'System Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (selectionUnit == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Unit Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (txtNamaEvidence.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Evidence Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (txtRemark.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Remark Tidak Boleh Kosong',
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
                    txtNamaEvidence.text,
                    txtRemark.text);
              }
            },
            child: Container(
              width: 90,
              height: 37.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xffEC1D26)),
              child: Center(
                child: Text("Done",
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

  // Clear the form
  void _clearForm() {
    // txtItemName.clear();
  }

  // Fungsi Add Data
  void inputDataNewMaterialNonCable(itemName, location, partNumber,
      serialNumber, weight, qty, system, unit, evidence, remark) async {
    bool status;
    var msg;
    try {
      // var formData = FormData.fromMap({
      //   'Unit': namaUnit,
      // });

      response = await dio.post(inputSpareKit, data: {
        'item_name': itemName,
        'location': location,
        'part_number': partNumber,
        'serial_number': serialNumber,
        'weight': weight,
        'qty': qty,
        'system': system,
        'unit': unit,
        'evidence': evidence,
        'remark': remark,
      });
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        FocusScope.of(context).unfocus();
        _clearForm();
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: '$msg',
            width: 400,
            confirmBtnColor: Colors.green);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BastNewMaterial()));
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
