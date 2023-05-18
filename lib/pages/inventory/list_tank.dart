import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/inventory/tank_1.dart';
import 'package:telin_project/widgets/inventory/tank_10.dart';
import 'package:telin_project/widgets/inventory/tank_2.dart';
import 'package:telin_project/widgets/inventory/tank_3.dart';
import 'package:telin_project/widgets/inventory/tank_4.dart';
import 'package:telin_project/widgets/inventory/tank_5.dart';
import 'package:telin_project/widgets/inventory/tank_6.dart';
import 'package:telin_project/widgets/inventory/tank_7.dart';
import 'package:telin_project/widgets/inventory/tank_8.dart';
import 'package:telin_project/widgets/inventory/tank_9.dart';

import '../../widgets/inventory/tank_11.dart';

class ListTank extends StatelessWidget {
  const ListTank({super.key});

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
            child: ListView(
              // physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 1',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank1()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 2',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank2()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 3',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank3()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 4',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank4()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 5',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank5()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 6',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank6()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 7',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank7()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 8',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank8()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 9',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank9()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 10',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank10()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'TANK 11',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: screnSize.width, height: 550, child: const TableTank11()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
