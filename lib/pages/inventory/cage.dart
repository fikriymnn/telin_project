import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/inventory/cage/cage1.dart';
import 'package:telin_project/widgets/inventory/cage/cage2.dart';
import 'package:telin_project/widgets/inventory/cage/cage9.dart';
import 'package:telin_project/widgets/inventory/rak/rak_a1.dart';

import '../../widgets/inventory/cage/cage3.dart';
import '../../widgets/inventory/cage/cage4.dart';
import '../../widgets/inventory/cage/cage5.dart';
import '../../widgets/inventory/cage/cage6.dart';
import '../../widgets/inventory/cage/cage7.dart';
import '../../widgets/inventory/cage/cage8.dart';

class CageInventory extends StatelessWidget {
  const CageInventory({super.key});

  @override
  Widget build(BuildContext context) {
    var screnSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: screnSize.width,
        height: screnSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_login_full.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: screnSize.width,
            height: screnSize.height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'CAGE 1',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      height: 550, width: screnSize.width, child: TableCage1()),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'CAGE 2',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      height: 550, width: screnSize.width, child: TableCage2()),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'CAGE 3',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      height: 550, width: screnSize.width, child: TableCage3()),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'CAGE 4',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      height: 550, width: screnSize.width, child: TableCage4()),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'CAGE 5',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      height: 550, width: screnSize.width, child: TableCage5()),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'CAGE 6',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      height: 550, width: screnSize.width, child: TableCage6()),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'CAGE 7',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      height: 550, width: screnSize.width, child: TableCage7()),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'CAGE 8',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      height: 550, width: screnSize.width, child: TableCage8()),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'CAGE 9',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      height: 550, width: screnSize.width, child: TableCage9()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
