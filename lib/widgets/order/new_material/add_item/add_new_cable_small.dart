import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class AddNewCableSmall extends StatefulWidget {
  const AddNewCableSmall({super.key});

  @override
  State<AddNewCableSmall> createState() => _AddNewCableSmallState();
}

class _AddNewCableSmallState extends State<AddNewCableSmall> {
  List<DropdownMenuItem<String>> get dropdownItemsSystem {
    List<DropdownMenuItem<String>> menuItemsSystem = [
      const DropdownMenuItem(
          value: "Select System",
          child: Text("Select System")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsSystem;
  }

   List<DropdownMenuItem<String>> get dropdownItemsCableType {
    List<DropdownMenuItem<String>> menuItemsCableType = [
      const DropdownMenuItem(
          value: "Select Cable Type",
          child: Text("Select Cable Type")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsCableType;
  }

  List<DropdownMenuItem<String>> get dropdownItemsManufacture {
    List<DropdownMenuItem<String>> menuItemsManufacture = [
      const DropdownMenuItem(
          value: "Select Manufacture",
          child: Text("Select Manufacture")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsManufacture;
  }

  List<DropdownMenuItem<String>> get dropdownItemsArmoringType {
    List<DropdownMenuItem<String>> menuItemsArmoringType = [
      const DropdownMenuItem(
          value: "Select Armoring Type",
          child: Text("Select Armoring Type")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsArmoringType;
  }
   
   List<DropdownMenuItem<String>> get dropdownItemsInner {
    List<DropdownMenuItem<String>> menuItemsInner = [
      const DropdownMenuItem(
          value: "Select Inner",
          child: Text("Select Inner")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsInner;
  }

  List<DropdownMenuItem<String>> get dropdownItemsOuter {
    List<DropdownMenuItem<String>> menuItemsOuter = [
      const DropdownMenuItem(
          value: "Select Outer",
          child: Text("Select Outer")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsOuter;
  }

  List<DropdownMenuItem<String>> get dropdownItemsCoreType {
    List<DropdownMenuItem<String>> menuItemsCoreType = [
      const DropdownMenuItem(
          value: "Select Core Type",
          child: Text("Select Core Type")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsCoreType;
  }






 

  

  String selectedValueCableType = "Select Cable Type";
  String selectedValueManufacture = "Select Manufacture";
  String selectedValueArmoringType = "Select Armoring Type";
  String selectedValueCoreType = "Select Core Type";
  String selectedValueCore = "Select Core";
  String selectedValueInner = "Select Inner";
  String selectedValueOuter = "Select Outer";
  String selectedValueSystem = "Select System";
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValueCableType = newValue!;
                                      });
                                    },
                                    value: selectedValueCableType,
                                    items: dropdownItemsCableType),
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
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValueManufacture = newValue!;
                                      });
                                    },
                                    value: selectedValueManufacture,
                                    items: dropdownItemsManufacture),
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
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValueArmoringType = newValue!;
                                      });
                                    },
                                    value: selectedValueArmoringType,
                                    items: dropdownItemsArmoringType),
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
                        SizedBox(
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
                        const SizedBox(height: 20.6,),
                        SizedBox(
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
                                "Outer",
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
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValueOuter = newValue!;
                                      });
                                    },
                                    value: selectedValueOuter,
                                    items: dropdownItemsOuter),
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
                        const SizedBox(height: 20.6,),
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
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValueCoreType = newValue!;
                                      });
                                    },
                                    value: selectedValueCoreType,
                                    items: dropdownItemsCoreType),
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
            const SizedBox(
              height: 72,
            ),
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