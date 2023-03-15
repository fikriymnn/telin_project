
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/cart_loading.dart';
import 'package:telin_project/widgets/order/loading/table_cable_loading.dart';


class CableDanKitLoading extends StatelessWidget {
  const CableDanKitLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Cable",
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                )),
                            Text("MINISUB-36",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.6,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 150,),
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
                              SizedBox(width: 10,),
                          Container(
                            width: 221.3,
                            height: 22.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 1, color: Color(0xffC1C1C1)),
                                color: Color(0xffF3F3F3)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, bottom: 7),
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
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: () {},
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 400,
              child: Column(
              children: [
                Expanded(child: TableCableLoading()),
              ],
            )),
          ],
        ),
    );
    
  }
}
