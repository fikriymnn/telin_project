import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/existing_material.dart/bast_existing.dart';
import 'package:telin_project/widgets/order/existing_material.dart/table_cable_off_loading.dart';
import 'package:telin_project/widgets/order/existing_material.dart/table_non_cable_off_loading.dart';
import 'package:telin_project/widgets/order/loading/cart_loading.dart';

class LakukanOffLoading extends StatefulWidget {
  const LakukanOffLoading({super.key});

  @override
  State<LakukanOffLoading> createState() => _LakukanOffLoadingState();
}

class _LakukanOffLoadingState extends State<LakukanOffLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("OFF-LOADING",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.6,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CartLoading();
                                    });
                              },
                              icon: Icon(
                                Icons.shopping_cart,
                                color: active,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 221.3,
                            height: 22.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: Color(0xffC1C1C1)),
                                color: Color(0xffF3F3F3)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 7),
                              child: TextField(
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF9D9D9D),
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF9D9D9D),
                                    ),
                                    hintText: "Search"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BastOffLoading()));
                            },
                            child: Container(
                              width: 90,
                              height: 37.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: active),
                              child: Center(
                                child: Text("Done",
                                    style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ],
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
            SizedBox(
              height: 20,
            ),
            Container(
                height: 400,
                child: Column(
                  children: [
                    Flexible(child: TableCableOffLoading()),
                  ],
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 250,
              child: Column(
                children: [
                  Expanded(child: TableNonCableOffLoading()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
