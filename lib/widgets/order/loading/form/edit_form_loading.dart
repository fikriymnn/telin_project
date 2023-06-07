import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';

class FormEditLoading extends StatefulWidget {
  const FormEditLoading({super.key});

  @override
  State<FormEditLoading> createState() => _FormEditLoadingState();
}

class _FormEditLoadingState extends State<FormEditLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 15, bottom: 30),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 59.3, top: 32),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 107.3,
                              height: 37.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xffB8B8B8), width: 1)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.subdirectory_arrow_left,
                                    color: active,
                                    size: 28.6,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Back",
                                    style: GoogleFonts.roboto(
                                      fontSize: 17.3,
                                      fontWeight: FontWeight.w400,
                                      color: active,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
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
                      const SizedBox(
                        width: 5,
                      ),
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
                      border: Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                  height: 20,
                ),
                SizedBox(
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Vessel Name",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 230,
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 5, color: const Color(0xffF0F0F0)),
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
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            const SizedBox(
                              height: 5,
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
                                padding:
                                    const EdgeInsets.only(left: 18, bottom: 8),
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
                        width: 100,
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
                            const SizedBox(
                              height: 5,
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
                                padding:
                                    const EdgeInsets.only(left: 18, bottom: 8),
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
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Edit Data Success',
                        width: 400,
                        confirmBtnColor: Colors.green);
                  },
                  child: Container(
                    width: 90,
                    height: 37.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xffEC1D26)),
                    child: Center(
                      child: Text("EDIT",
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
