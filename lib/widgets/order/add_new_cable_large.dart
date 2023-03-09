import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewCableLarge extends StatefulWidget {
  const AddNewCableLarge({super.key});

  @override
  State<AddNewCableLarge> createState() => _AddNewCableLargeState();
}

class _AddNewCableLargeState extends State<AddNewCableLarge> {
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
      DropdownMenuItem(
          child: Text("Select Inner"), value: "Select Inner"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsInner;
  }

  List<DropdownMenuItem<String>> get dropdownItemsOuter {
    List<DropdownMenuItem<String>> menuItemsOuter = [
      DropdownMenuItem(
          child: Text("Select Outer"), value: "Select Outer"),
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
  String selectedValueOuter = "Select Outer";
  String selectedValueSystem = "Select System";
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
                                          selectedValueCableType = newValue!;
                                        });
                                      },
                                      value: selectedValueCableType,
                                      items: dropdownItemsCableType),
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
                                          selectedValueManufacture = newValue!;
                                        });
                                      },
                                      value: selectedValueManufacture,
                                      items: dropdownItemsManufacture),
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
                          SizedBox(height: 20.6,),
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
                                          selectedValueOuter = newValue!;
                                        });
                                      },
                                      value: selectedValueOuter,
                                      items: dropdownItemsOuter),
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
                          SizedBox(height: 20.6,),
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
                                          selectedValueCoreType = newValue!;
                                        });
                                      },
                                      value: selectedValueCoreType,
                                      items: dropdownItemsCoreType),
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
          ),
    );
  }
}