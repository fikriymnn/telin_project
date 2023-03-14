import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class FormLoading extends StatefulWidget {
  const FormLoading({super.key});

  @override
  State<FormLoading> createState() => _FormLoadingState();
}


 List<DropdownMenuItem<String>> get dropdownItemsDiserahkan {
    List<DropdownMenuItem<String>> menuItemsDiserahkan = [
      DropdownMenuItem(child: Text("Select Diserahkan"), value: "Select Diserahkan"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsDiserahkan;
  }

   List<DropdownMenuItem<String>> get dropdownItemsDiketahui {
    List<DropdownMenuItem<String>> menuItemsDiketahui = [
      DropdownMenuItem(child: Text("Select Diketahui"), value: "Select Diketahui"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsDiketahui;
  }

   List<DropdownMenuItem<String>> get dropdownItemsPerusahaan {
    List<DropdownMenuItem<String>> menuItemsPerusahaan = [
      DropdownMenuItem(child: Text("Select Perusahaan"), value: "Select Perusahaan"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItemsPerusahaan;
  }


  String selectedValueDiserahkan = "Select Diserahkan";
  String selectedValueDiketahui = "Select Diketahui";
  String selectedValuePerusahaan = "Select Perusahaan";
class _FormLoadingState extends State<FormLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25,top: 15,bottom: 30),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                                  width: 500,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Project Name",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        "(Example : Repair SKKL JASUKA LINK BATAM - PONTIANAK)",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 500,
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
                                SizedBox(height: 20,),
                Container(
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              "Vissel Name",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5,),
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
                                      SizedBox(height: 20,),
                                       Container(
                                        width: 230,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "From",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5,),
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
                                      
                                      SizedBox(height: 20,),
                                      Container(
                                  width: 230,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Diserahkan",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
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
                                                selectedValueDiserahkan = newValue!;
                                              });
                                            },
                                            value: selectedValueDiserahkan,
                                            items: dropdownItemsDiserahkan),
                                      ),
                                    ),
                                  ),
                                ),
                                      SizedBox(height: 20,),
                                       Container(
                                  width: 230,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Diketahui",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
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
                                                selectedValueDiketahui = newValue!;
                                              });
                                            },
                                            value: selectedValueDiketahui,
                                            items: dropdownItemsDiketahui),
                                      ),
                                    ),
                                  ),
                                ),
                                       
                          ],
                        ),
                      ),
              
                      SizedBox(width: 100,),
              
                      
                
                      Container(
                        child: Column(
                          children: [
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
                                      SizedBox(height: 5,),
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
                            
                                SizedBox(height: 20,),
                                Container(
                                        width: 230,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "To",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5,),
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
                
                               
                                      SizedBox(height: 20,),
                                       Container(
                                        width: 230,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Diterima",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5,),
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
                
                               
                                SizedBox(height: 20,),
                                Container(
                                  width: 230,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Perusahaan",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
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
                                                selectedValuePerusahaan = newValue!;
                                              });
                                            },
                                            value: selectedValuePerusahaan,
                                            items: dropdownItemsPerusahaan),
                                      ),
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: 90,
                      height: 37.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xffEC1D26)),
                      child: Center(
                        child: Text("NEXT",
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
          ),
        ),
      ),
    );
  }
}