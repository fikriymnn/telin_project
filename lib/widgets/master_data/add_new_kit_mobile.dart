import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewKitMobile extends StatefulWidget {
  const AddNewKitMobile({super.key});

  @override
  State<AddNewKitMobile> createState() => _AddNewKitMobileState();
}

class _AddNewKitMobileState extends State<AddNewKitMobile> {
   List<DropdownMenuItem<String>> get dropdownItemsLocationName {
    List<DropdownMenuItem<String>> menuItemsLocationName = [
      DropdownMenuItem(
          child: Text("Select Location Name"), value: "Select Location Name"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsLocationName;
  }

  List<DropdownMenuItem<String>> get dropdownItemsLocationCategory {
    List<DropdownMenuItem<String>> menuItemsLocationCategory = [
      DropdownMenuItem(
          child: Text("Select Location Category"), value: "Select Location Category"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsLocationCategory;
  }

  List<DropdownMenuItem<String>> get dropdownItemsPartNumber {
    List<DropdownMenuItem<String>> menuItemsPartNumber = [
      DropdownMenuItem(
          child: Text("Select Part Number"), value: "Select Part Number"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsPartNumber;
  }
   
   List<DropdownMenuItem<String>> get dropdownItemsSerialNumber {
    List<DropdownMenuItem<String>> menuItemsSerialNumber = [
      DropdownMenuItem(
          child: Text("Select Serial Number"), value: "Select Serial Number"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsSerialNumber;
  }

  List<DropdownMenuItem<String>> get dropdownItemsSystem {
    List<DropdownMenuItem<String>> menuItemsSystem = [
      DropdownMenuItem(
          child: Text("Select System"), value: "Select System"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsSystem;
  }

  List<DropdownMenuItem<String>> get dropdownItemsUnit {
    List<DropdownMenuItem<String>> menuItemsUnit = [
      DropdownMenuItem(
          child: Text("Select Unit"), value: "Select Unit"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsUnit;
  }




  

  String selectedValueLocationName = "Select Location Name";
  String selectedValueLocationCategory = "Select Location Category";
  String selectedValuePartNumber = "Select Part Number";
  String selectedValueSerialNumber = "Select Serial Number";
  String selectedValueSystem = "Select System";
  String selectedValueUnit = "Select Unit";

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Text("Add New Kit",
                style: GoogleFonts.montserrat(
                  fontSize: 23.3,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
                SizedBox(height: 30,),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                                "Location Name",
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
                                  width: 5, color: Color(0xffF0F0F0)),
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
                                        selectedValueLocationName = newValue!;
                                      });
                                    },
                                    value: selectedValueLocationName,
                                    items: dropdownItemsLocationName),
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
                                "Location Category",
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
                                  width: 5, color: Color(0xffF0F0F0)),
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
                                        selectedValueLocationCategory = newValue!;
                                      });
                                    },
                                    value: selectedValueLocationCategory,
                                    items: dropdownItemsLocationCategory),
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
                              border: Border.all(
                                  width: 5, color: Color(0xffF0F0F0)),
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
                                        selectedValuePartNumber = newValue!;
                                      });
                                    },
                                    value: selectedValuePartNumber,
                                    items: dropdownItemsPartNumber),
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
                              border: Border.all(
                                  width: 5, color: Color(0xffF0F0F0)),
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
                                        selectedValueSerialNumber = newValue!;
                                      });
                                    },
                                    value: selectedValueSerialNumber,
                                    items: dropdownItemsSerialNumber),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                              border: Border.all(
                                  width: 5, color: Color(0xffF0F0F0)),
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
                                  decoration: BoxDecoration(
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
                        SizedBox(
                          height: 20.6,
                        ),
                        Container(
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
                              border: Border.all(
                                  width: 5, color: Color(0xffF0F0F0)),
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
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: TextField(
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
                        SizedBox(
                          height: 20.6,
                        ),
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
                              border: Border.all(
                                  width: 5, color: Color(0xffF0F0F0)),
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
                                        selectedValueSystem = newValue!;
                                      });
                                    },
                                    value: selectedValueSystem,
                                    items: dropdownItemsSystem),
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
                              border: Border.all(
                                  width: 5, color: Color(0xffF0F0F0)),
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
                                        selectedValueUnit = newValue!;
                                      });
                                    },
                                    value: selectedValueUnit,
                                    items: dropdownItemsUnit),
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
             SizedBox(height: 30,),
             Container(
                    child: Column(
                      children: [
                        Container(
                          width: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Keterangan",
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
                                  width: 5, color: Color(0xffF0F0F0)),
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
                       
                      ],
                    ),
                  ),
            SizedBox(
              height: 72,
            ),
            InkWell(
              onTap: () {},
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
        );
  }
}