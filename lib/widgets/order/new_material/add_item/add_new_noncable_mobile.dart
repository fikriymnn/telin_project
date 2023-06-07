import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class AddNewNonCableMobile extends StatefulWidget {
  const AddNewNonCableMobile({super.key});

  @override
  State<AddNewNonCableMobile> createState() => _AddNewNonCableMobileState();
}

class _AddNewNonCableMobileState extends State<AddNewNonCableMobile> {
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
    return Column(
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
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValueLocation = newValue!;
                            });
                          },
                          value: selectedValueLocation,
                          items: dropdownItemsLocation),
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
          height: 72,
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
              const SizedBox(height: 72,),
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
              const SizedBox(height: 72,),
        InkWell(
          onTap: () {
             QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Upload Data Success',
               
                width: 400,
                
                
               confirmBtnColor: Colors.green
              );
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
    );
  }
}
