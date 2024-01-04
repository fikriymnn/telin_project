import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

import 'package:telin_project/widgets/inventory/cage/cage.dart';
import 'package:telin_project/widgets/inventory/floor/floor.dart';
import 'package:telin_project/widgets/inventory/rak/rak.dart';
import 'package:telin_project/widgets/inventory/refregerator/refrigerator.dart';
import 'package:telin_project/widgets/inventory/tank/tank_1.dart';
import 'package:telin_project/widgets/inventory/tank/tank_10.dart';
import 'package:telin_project/widgets/inventory/tank/tank_11.dart';
import 'package:telin_project/widgets/inventory/tank/tank_2.dart';
import 'package:telin_project/widgets/inventory/tank/tank_3.dart';
import 'package:telin_project/widgets/inventory/tank/tank_4.dart';
import 'package:telin_project/widgets/inventory/tank/tank_5.dart';
import 'package:telin_project/widgets/inventory/tank/tank_6.dart';
import 'package:telin_project/widgets/inventory/tank/tank_7.dart';
import 'package:telin_project/widgets/inventory/tank/tank_8.dart';
import 'package:telin_project/widgets/inventory/tank/tank_9.dart';

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
                    padding: const EdgeInsets.only(left: 100, top: 50),
                    child: InkWell(
                      //rak
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("RAKS",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableRak())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("FLOORS",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableFloor())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("REFRIGERATOR",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableRefrigerator())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("CAGE",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableCage())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 1",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank1())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 2",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank2())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 3",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank3())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 10",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank10())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 6",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank6())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 5",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank5())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 4",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank4())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 11",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank11())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 9",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank9())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 8",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank8())
                                        ],
                                      )),
                                ),
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
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                                color: active),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("TANK 7",
                                                        style:
                                                            GoogleFonts.rubik(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: light,
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 146,
                                                          height: 33,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: light,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            // border: Border.all(
                                                            //     color: const Color(
                                                            //         0xffB8B8B8),
                                                            //     width: 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "< Back",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: active,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(child: TableTank7())
                                        ],
                                      )),
                                ),
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
