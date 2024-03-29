import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/inventory/rak/rak.dart';

class RacksInventory extends StatelessWidget {
  const RacksInventory({super.key});

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
                      'RAK',
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
                      child: const TableRak()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK A2',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakA2()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK A3',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakA3()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK A4',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakA4()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK A5',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakA5()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK A6',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakA6()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK A7',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakA7()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK B1',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakB1()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK B2',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakB2()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK B3',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakB3()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK B4',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakB4()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK B5',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakB5()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK B6',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakB6()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK B7',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakB7()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK C1',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakC1()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK C2',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakC2()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK C3',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakC3()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK C4',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakC4()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK C5',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakC5()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK C6',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakC6()),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'RAK C7',
                  //     style: GoogleFonts.montserrat(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 550, width: screnSize.width, child: TableRakC7()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
