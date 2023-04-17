import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../../api/configAPI.dart';
import '../bast_invoice/bast_new_material.dart';

class AddNewCableLarge extends StatefulWidget {
  const AddNewCableLarge({super.key});

  @override
  State<AddNewCableLarge> createState() => _AddNewCableLargeState();
}

class _AddNewCableLargeState extends State<AddNewCableLarge> {
  TextEditingController txtNamaEvidence = TextEditingController();
  TextEditingController txtRemark = TextEditingController();
  TextEditingController txtLenght = TextEditingController();
  TextEditingController txtE_Core = TextEditingController();
  TextEditingController txtLable = TextEditingController();

  String? selectionSystem;
  String? selectionCoreType;
  String? selectionCableType;
  String? selectionManufacturer;
  String? selectionArmoringType;

  String? selectionLocation;

  String? selectionInner;


  List system = [];
  List coreType = [];
  List cableType = [];
  List manufacturer = [];
  List armoringType = [];
  List location = [];

  Response? response;

  var dio = Dio();
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


  List<DropdownMenuItem<String>> get dropdownTankLocation {
    List<DropdownMenuItem<String>> menuTankLocation = [
      DropdownMenuItem(
          child: Text("Select Tank Location"), value: "Select Tank Location"),
      DropdownMenuItem(child: Text("TANK-1"), value: "TANK-1"),
      DropdownMenuItem(child: Text("TANK-2"), value: "TANK-2"),
      DropdownMenuItem(child: Text("TANK-3"), value: "TANK-3"),
      DropdownMenuItem(child: Text("TANK-4"), value: "TANK-4"),
      DropdownMenuItem(child: Text("TANK-5"), value: "TANK-5"),
      DropdownMenuItem(child: Text("TANK-6"), value: "TANK-6"),
      DropdownMenuItem(child: Text("TANK-7"), value: "TANK-7"),
      DropdownMenuItem(child: Text("TANK-8"), value: "TANK-8"),
      DropdownMenuItem(child: Text("TANK-9"), value: "TANK-9"),
      DropdownMenuItem(child: Text("TANK-10"), value: "TANK-10"),
      DropdownMenuItem(child: Text("TANK-11"), value: "TANK-11"),
      DropdownMenuItem(child: Text("CABLE CAGE A"), value: "CABLE CAGE A"),
      DropdownMenuItem(child: Text("CABLE CAGE B"), value: "CABLE CAGE B"),
      DropdownMenuItem(child: Text("FLOOR DEPO"), value: "FLOOR DEPO"),
    ];
    return menuTankLocation;
  }


  List<DropdownMenuItem<String>> get dropdownItemsSystem {
    List<DropdownMenuItem<String>> menuItemsSystem = [
      DropdownMenuItem(child: Text("Select System"), value: "Select System"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsSystem;
  }

  List<DropdownMenuItem<String>> get dropdownItemsCableType {
    List<DropdownMenuItem<String>> menuItemsCableType = [
      DropdownMenuItem(
          child: Text("Select Cable Type"), value: "Select Cable Type"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsCableType;
  }

  List<DropdownMenuItem<String>> get dropdownItemsManufacture {
    List<DropdownMenuItem<String>> menuItemsManufacture = [
      DropdownMenuItem(
          child: Text("Select Manufacture"), value: "Select Manufacture"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsManufacture;
  }

  List<DropdownMenuItem<String>> get dropdownItemsArmoringType {
    List<DropdownMenuItem<String>> menuItemsArmoringType = [
      DropdownMenuItem(
          child: Text("Select Armoring Type"), value: "Select Armoring Type"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsArmoringType;
  }

  List<DropdownMenuItem<String>> get dropdownItemsInner {
    List<DropdownMenuItem<String>> menuItemsInner = [
      DropdownMenuItem(child: Text("Select Inner"), value: "Select Inner"),
      DropdownMenuItem(child: Text("INNER"), value: "INNER"),
      DropdownMenuItem(child: Text("OUTER"), value: "OUTER"),
    ];
    return menuItemsInner;
  }

  List<DropdownMenuItem<String>> get dropdownItemsOuter {
    List<DropdownMenuItem<String>> menuItemsOuter = [
      DropdownMenuItem(child: Text("Select Outer"), value: "Select Outer"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsOuter;
  }

  List<DropdownMenuItem<String>> get dropdownItemsCoreType {
    List<DropdownMenuItem<String>> menuItemsCoreType = [
      DropdownMenuItem(
          child: Text("Select Core Type"), value: "Select Core Type"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsCoreType;
  }

  String selectedValueCableType = "Select Cable Type";
  String selectedValueManufacture = "Select Manufacture";
  String selectedValueArmoringType = "Select Armoring Type";
  String selectedValueCoreType = "Select Core Type";
  String selectedValueCore = "Select Core";
  String selectedValueInner = "Select Inner";
  String selectedValueSystem = "Select System";
  String selectedValueTankLocation = "Select Tank Location";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
                                    child: Text(system['system']),
                                    value: system['_id'].toString(),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.6,
                      ),
                      Container(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Cable Type",
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
                                    selectionCableType = newVal!;
                                  });
                                },
                                value: selectionCableType,
                                items: cableType.map((cableType) {
                                  return DropdownMenuItem(
                                    child: Text(cableType['cable_type']),
                                    value: cableType['_id'].toString(),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.6,
                      ),
                      Container(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Manufacture",
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
                                    selectionManufacturer = newVal!;
                                  });
                                },
                                value: selectionManufacturer,
                                items: manufacturer.map((manufacturer) {
                                  return DropdownMenuItem(
                                    child: Text(manufacturer['manufacturer']),
                                    value: manufacturer['_id'].toString(),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.6,
                      ),
                      Container(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Armoring Type",
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
                                    selectionArmoringType = newVal!;
                                  });
                                },
                                value: selectionArmoringType,
                                items: armoringType.map((armoringType) {
                                  return DropdownMenuItem(
                                    child: Text(armoringType['armoring_type']),
                                    value: armoringType['_id'].toString(),
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
                SizedBox(
                  width: 40,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Length",
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
                                decoration: BoxDecoration(
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
                      SizedBox(
                        height: 20.6,
                      ),
                      Container(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Lable",
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, bottom: 8),
                          child: Center(
                            child: TextField(
                              controller: txtLable,
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
                      SizedBox(
                        height: 20.6,
                      ),
                      Container(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Inner",
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
                      SizedBox(
                        height: 20.6,
                      ),

                      Container(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Tank Location",
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValueTankLocation = newValue!;
                                    });
                                  },
                                  value: selectedValueTankLocation,
                                  items: dropdownTankLocation),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
                      SizedBox(
                        height: 20.6,
                      ),
                      Container(
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
                      SizedBox(
                        height: 20.6,
                      ),
                      Container(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Core Type",
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
                                    selectionCoreType = newVal!;
                                  });
                                },
                                value: selectionCoreType,
                                items: coreType.map((coreType) {
                                  return DropdownMenuItem(
                                    child: Text(coreType['core_type']),
                                    value: coreType['_id'].toString(),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.6,
                      ),
                      Container(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\u03A3 Core",
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
                                Border.all(width: 5, color: Color(0xffF0F0F0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4))
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
          SizedBox(
            height: 72,
          ),
          InkWell(
            onTap: () {
              if (selectionSystem == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Nama System Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (selectionCableType == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Cable Type Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (selectionManufacturer == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Manufacturer Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (selectionArmoringType == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Armoring Type Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (txtLenght.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'State Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (txtLable.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'State Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);

              } else if (selectionLocation == '') {

              } else if (selectedValueInner == '') {

                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',

                    text: 'Location Tidak Boleh Kosong',

                    text: 'Tank Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (selectedValueTankLocation == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Tank Location Tidak Boleh Kosong',

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
              } else if (selectionCoreType == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'Core Type Tidak Boleh Kosong',
                    width: 400,
                    confirmBtnColor: Colors.red);
              } else if (txtE_Core.text == '') {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Peringatan',
                    text: 'E Core Tidak Boleh Kosong',
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


                  selectedValueTankLocation,

                  txtNamaEvidence.text,
                  txtRemark.text,
                  selectionCoreType,
                  txtE_Core.text,
                );
              }
            },
            child: Container(
              width: 90,
              height: 37.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xffEC1D26)),
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

  // Fungsi Add Data

  void inputDataNewMaterialCable(system, cableType, manufacturer, armoringType,
      length, label, inner, evidence, remark, coreType, eCore) async {

  void inputDataNewMaterialCable(
      system,
      cableType,
      manufacturer,
      armoringType,
      length,
      label,
      inner,
      tankLocation,
      evidence,
      remark,
      coreType,
      eCore) async {

    bool status;
    var msg;
    try {
      // var formData = FormData.fromMap({
      //   'Unit': namaUnit,
      // });

      response = await dio.post(inputSpareCable, data: {
        'system': system,
        'cable_type': cableType,
        'manufacturer': manufacturer,
        'armoring_type': armoringType,
        'length_report': length,
        'label': label,
        'tank': inner,

        'tank_location': tankLocation,

        'evidence': evidence,
        'remark': remark,
        'core_type': coreType,
        'E_core': eCore,
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
            MaterialPageRoute(builder: (context) => BastNewMaterial()));
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
