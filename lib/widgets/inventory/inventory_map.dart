import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/pages/inventory/cage.dart';
import 'package:telin_project/pages/inventory/rak.dart';
import 'package:telin_project/widgets/inventory/floor/floor.dart';
import 'package:telin_project/widgets/inventory/refregerator/refregerator.dart';
import 'package:telin_project/widgets/inventory/tank_1.dart';
import 'package:telin_project/widgets/inventory/tank_10.dart';
import 'package:telin_project/widgets/inventory/tank_11.dart';
import 'package:telin_project/widgets/inventory/tank_2.dart';
import 'package:telin_project/widgets/inventory/tank_4.dart';
import 'package:telin_project/widgets/inventory/tank_5.dart';
import 'package:telin_project/widgets/inventory/tank_6.dart';
import 'package:telin_project/widgets/inventory/tank_7.dart';
import 'package:telin_project/widgets/inventory/tank_8.dart';
import 'package:telin_project/widgets/inventory/tank_9.dart';

import '../../widgets/inventory/tank_3.dart';

class InventoriMapView extends StatefulWidget {
  const InventoriMapView({super.key});

  @override
  State<InventoriMapView> createState() => _InventoriMapViewState();
}

bool hoverTank1 = false;
bool hoverTank2 = false;
bool hoverTank3 = false;
bool hoverTank4 = false;
bool hoverTank5 = false;
bool hoverTank6 = false;
bool hoverTank7 = false;
bool hoverTank8 = false;
bool hoverTank9 = false;
bool hoverTank10 = false;
bool hoverTank11 = false;

class _InventoriMapViewState extends State<InventoriMapView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: 1102,
              height: 544.6,
              child: Stack(
                children: [
                  SizedBox(
                    width: 1102,
                    height: 544.6,
                    child: Image.asset(
                      'assets/images/map_view.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: InkWell(
                      //rak
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "RAK",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const RacksInventory(),
                              );
                            });
                      },
                      child: const SizedBox(
                        width: 107,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 167, left: 100),
                    child: InkWell(
                      //floor
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "FLOOR",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableFloor(),
                              );
                            });
                      },
                      child: const SizedBox(
                        width: 107,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 285, left: 100),
                    child: InkWell(
                      //refrigenerator
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "REFRIGENERATOR",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableRefregerator(),
                              );
                            });
                      },
                      child: const SizedBox(
                        width: 107,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 400, left: 100),
                    child: InkWell(
                      //cage
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const CageInventory(),
                              );
                            });
                      },
                      child: const SizedBox(
                        width: 107,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 49, left: 420),
                    child: InkWell(
                      //Tank 1
                      onHover: (value) {
                        setState(() {
                          hoverTank1 = !hoverTank1;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 1",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank1(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank1
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  hoverTank1 ? active : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 1",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank1 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 49, left: 586),
                    child: InkWell(
                      //Tank 2
                      onHover: (value) {
                        setState(() {
                          hoverTank2 = !hoverTank2;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 2",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank2(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank2
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  hoverTank2 ? active : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 2",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank2 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 49, left: 751),
                    child: InkWell(
                      //Tank 3
                      onHover: (value) {
                        setState(() {
                          hoverTank3 = !hoverTank3;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 3",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank3(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank3
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  hoverTank3 ? active : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 3",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank3 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 49, left: 915),
                    child: InkWell(
                      //Tank 10
                      onHover: (value) {
                        setState(() {
                          hoverTank10 = !hoverTank10;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 10",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank10(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank10
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: hoverTank10
                                  ? active
                                  : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 10",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank10 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 201, left: 420),
                    child: InkWell(
                      //Tank 6
                      onHover: (value) {
                        setState(() {
                          hoverTank6 = !hoverTank6;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 6",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank6(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank6
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  hoverTank6 ? active : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 6",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank6 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 201, left: 586),
                    child: InkWell(
                      //Tank 5
                      onHover: (value) {
                        setState(() {
                          hoverTank5 = !hoverTank5;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 5",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank5(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank5
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  hoverTank5 ? active : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 5",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank5 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 201, left: 751),
                    child: InkWell(
                      //Tank 4
                      onHover: (value) {
                        setState(() {
                          hoverTank4 = !hoverTank4;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 4",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank4(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank4
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  hoverTank4 ? active : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 4",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank4 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 201, left: 915),
                    child: InkWell(
                      //Tank 11
                      onHover: (value) {
                        setState(() {
                          hoverTank11 = !hoverTank11;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 11",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank11(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank11
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: hoverTank11
                                  ? active
                                  : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 11",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank11 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 369, left: 338),
                    child: InkWell(
                      //Tank 9
                      onHover: (value) {
                        setState(() {
                          hoverTank9 = !hoverTank9;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 9",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank9(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank9
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  hoverTank9 ? active : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 9",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank9 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 369, left: 503),
                    child: InkWell(
                      //Tank 8
                      onHover: (value) {
                        setState(() {
                          hoverTank8 = !hoverTank8;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 8",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank8(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank8
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  hoverTank8 ? active : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 8",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank8 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 369, left: 669),
                    child: InkWell(
                      //Tank 7
                      onHover: (value) {
                        setState(() {
                          hoverTank7 = !hoverTank7;
                        });
                      },
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Text(
                                    "TANK 7",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 59.3, top: 5, bottom: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 107.3,
                                            height: 37.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB8B8B8),
                                                    width: 1)),
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
                                body: const TableTank7(),
                              );
                            });
                      },
                      child: Container(
                        width: 145,
                        height: 121,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hoverTank7
                              ? const Color(0xff4B6B7C)
                              : Colors.black,
                        ),
                        child: Center(
                          child: Container(
                            width: 97,
                            height: 87,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  hoverTank7 ? active : const Color(0xffc2c2c2),
                            ),
                            child: Center(
                              child: Text(
                                "TANK 7",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: hoverTank7 ? light : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
