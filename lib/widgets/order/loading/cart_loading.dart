import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/order/loading/table/table_cable_cart.dart';
import 'package:telin_project/widgets/order/loading/table/table_non_cable_cart.dart';
import 'package:telin_project/widgets/order/loading/table/table_turn_over.dart';

class CartLoading extends StatefulWidget {
  const CartLoading({super.key});

  @override
  State<CartLoading> createState() => _CartLoadingState();
}

class _CartLoadingState extends State<CartLoading> {
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
                    child: Container(
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
                          Spacer(),
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
                          SizedBox(
                            width: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xFFED1D25),
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
                  Container(
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
                  SizedBox(
                    height: 22,
                  ),
                  Container(
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
                        SizedBox(
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
                  Container(
                      height: 400,
                      child: Column(
                        children: [
                          Flexible(child: TableCableCart()),
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 250,
                    child: Column(
                      children: [
                        Expanded(child: TableNonCableCart()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 250,
                    child: Column(
                      children: [
                        Expanded(child: TableCableTurnOver()),
                      ],
                    ),
                  ),
                  SizedBox(
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
