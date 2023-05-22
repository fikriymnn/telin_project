import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/form/edit_form_loading.dart';
import 'package:telin_project/widgets/order/loading/table/table_cable_edit.dart';
import 'package:telin_project/widgets/order/loading/table/table_cable_loading.dart';
import 'package:telin_project/widgets/order/loading/table/table_non_cable_loading.dart';
import 'package:telin_project/widgets/order/loading/table/table_turn_over.dart';

import 'table/table_non_cable_edit.dart';

class EditLoading extends StatefulWidget {
  const EditLoading({super.key});

  @override
  State<EditLoading> createState() => _EditLoadingState();
}

class _EditLoadingState extends State<EditLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.6),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19.3, vertical: 12.6),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text(
                            "WORK ORDER",
                            style: GoogleFonts.montserrat(
                              fontSize: 10.6,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const FormEditLoading();
                                  });
                            },
                            child: Container(
                              width: 99.3,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: active),
                              child: Center(
                                child: Text("EDIT",
                                    style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 99.3,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: active),
                              child: Center(
                                child: Text("SUBMIT",
                                    style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: const Color(0xFFED1D25),
                              child: Center(
                                child: Text("X",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
                            style: GoogleFonts.montserrat(
                              fontSize: 13.3,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("LCT NAPOLEON",
                            style: GoogleFonts.montserrat(
                              fontSize: 13.3,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            )),
                        const SizedBox(
                          width: 284,
                        ),
                        Text("BANDUNG - JAKARTA",
                            style: GoogleFonts.montserrat(
                              fontSize: 13.3,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          Flexible(child: TableCableEdit()),
                        ],
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
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
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffB8B8B8),
                                                        width: 1)),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .subdirectory_arrow_left,
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: active,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                    body: TableCableLoading(
                                      loadingId: "",
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            width: 99.3,
                            height: 20.33,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: active),
                            child: Center(
                              child: Text("ADD CABLE",
                                  style: GoogleFonts.roboto(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 250,
                    child: Column(
                      children: [
                        Expanded(child: TableNonCableEdit()),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
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
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffB8B8B8),
                                                        width: 1)),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .subdirectory_arrow_left,
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: active,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                    body: const TableNonCableLoading(),
                                  );
                                });
                          },
                          child: Container(
                            width: 99.3,
                            height: 20.33,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: active),
                            child: Center(
                              child: Text("ADD SPAREPART",
                                  style: GoogleFonts.roboto(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 250,
                    child: Column(
                      children: [
                        Expanded(child: TableCableTurnOver()),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
