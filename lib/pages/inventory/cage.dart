import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/inventory/cage/cage1.dart';
import 'package:telin_project/widgets/inventory/cage/cage2.dart';
import 'package:telin_project/widgets/inventory/cage/cage9.dart';

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
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'CAGE',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: screnSize.height,
                      width: screnSize.width,
                      child: const TableCage1()),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'CAGE 2',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //     height: 550, width: screnSize.width, child: const TableCage2()),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'CAGE 3',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //     height: 550, width: screnSize.width, child: const TableCage3()),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'CAGE 4',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //     height: 550, width: screnSize.width, child: const TableCage4()),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'CAGE 5',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //     height: 550, width: screnSize.width, child: const TableCage5()),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'CAGE 6',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //     height: 550, width: screnSize.width, child: const TableCage6()),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'CAGE 7',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //     height: 550, width: screnSize.width, child: const TableCage7()),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'CAGE 8',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //     height: 550, width: screnSize.width, child: const TableCage8()),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'CAGE 9',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //     height: 550, width: screnSize.width, child: const TableCage9()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
