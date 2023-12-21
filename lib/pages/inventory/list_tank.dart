import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/inventory/listview.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
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
              child: Column(
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'List Cable',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: screnSize.width,
                      height: 550,
                      child: const TableListview()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
