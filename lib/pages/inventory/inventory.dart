import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/custom_text.dart';

import 'package:telin_project/widgets/inventory/tank_1.dart';
import 'package:telin_project/widgets/inventory/tank_11.dart';
import 'package:telin_project/widgets/inventory/tank_2.dart';
import 'package:telin_project/widgets/inventory/tank_3.dart';
import 'package:telin_project/widgets/inventory/tank_4.dart';
import 'package:telin_project/widgets/inventory/tank_5.dart';
import 'package:telin_project/widgets/inventory/tank_6.dart';
import 'package:telin_project/widgets/inventory/tank_7.dart';
import 'package:telin_project/widgets/inventory/tank_8.dart';
import 'package:telin_project/widgets/inventory/tank_9.dart';
import 'package:telin_project/widgets/inventory/tank_10.dart';

class InventoryViewPage extends StatefulWidget {
  const InventoryViewPage({super.key});

  @override
  State<InventoryViewPage> createState() => _InventoryViewPageState();
}

class _InventoryViewPageState extends State<InventoryViewPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              var screnSize = MediaQuery.of(context).size;
              return SingleChildScrollView(
                child: Container(
                  width: screnSize.width,
                  height: screnSize.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/background_login_full.png"),
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
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 1',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank1()),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 2',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank2()),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 3',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank3()),
                              Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 4',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank4()),
                              Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 5',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank5()),
                              Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 6',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank6()),
                              Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 7',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank7()),
                              Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 8',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank8()),
                              Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 9',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank9()),
                              Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 10',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank10()),
                              Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'TANK 11',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              width: screnSize.width,
                              height: 550,
                              child: TableTank11()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const WidgetListView(),
          //   ),
          // );
        },
        child: Container(
          width: 150,
          height: 40,
          color: Colors.amber,
          child: const Center(
            child: CustomText(
              text: 'listview',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
