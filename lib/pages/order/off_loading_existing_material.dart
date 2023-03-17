import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/order/existing_material.dart/table_existing.dart';

class OffLoadingExistingScreens extends StatelessWidget {
  const OffLoadingExistingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Existing Material",style: GoogleFonts.montserrat(
                                fontSize: 23.3,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),),
                              Container(
                                  width: 258.6,
                                  height: 37.06,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.6),
                                      border: Border.all(
                                          width: 1, color: Color(0xffC1C1C1)),
                                      color: Color(0xffF3F3F3)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 15),
                                    child: TextField(
                                      style: GoogleFonts.roboto(
                                        fontSize: 10.6,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF9D9D9D),
                                      ),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: GoogleFonts.roboto(
                                            fontSize: 10.6,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF9D9D9D),
                                          ),
                                          hintText: "Search"),
                                    ),
                                  ),
                                )
            
                ],
              ),
            ),
            Expanded(child: TableExistingMaterial())
          ],
        ),
      ) ,
    );
  }
}