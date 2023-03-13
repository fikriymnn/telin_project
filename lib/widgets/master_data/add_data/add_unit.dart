import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/helpers/responsive.dart';

import 'package:telin_project/widgets/setting/edit_akun.dart';

class AddUnit extends StatefulWidget {
  const AddUnit({super.key});

  @override
  State<AddUnit> createState() => _AddUnitState();
}

class _AddUnitState extends State<AddUnit> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          width: 900,
          height: 588.6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.white),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Text("Add New Unit",
                    style: GoogleFonts.montserrat(
                      fontSize: 23.3,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 30,
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
                      border: Border.all(width: 5, color: Color(0xffF0F0F0)),
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
                            hintText: "Unit Name"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
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
                      child: Text("Submit",
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
          ))),
    );
  }
}
