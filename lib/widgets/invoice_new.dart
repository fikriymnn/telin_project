import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/bast/invoice_print.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;
    return Container(
      width: 329.3,
      height: 184,
      decoration: BoxDecoration(
          color: Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 25,
                offset: Offset(0, 4))
          ]),
      child: Padding(
        padding: EdgeInsets.all(6.6),
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: 124.6,
              decoration: BoxDecoration(
                  color: light,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Invoice Packing List",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text("001/TI/12/22",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 13.3,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                         SizedBox(
                      height: 15,
                    ),
                    Text("REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 13.3,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3.3,
            ),
            Container(
              width: screenSize.width,
              height: 42,
              decoration: BoxDecoration(
                  color: light,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                    showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return InvoiceLoadingPrint();
                                  });
                    },
                    child: Container(
                      height: 30.6,
                      width: 123,
                      decoration: BoxDecoration(
                        color: active,
                        borderRadius: BorderRadius.circular(6.6),
                      ),
                      child: Center(
                        child: Text('PRINT INVOICE',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.rubik(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
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
    );
  }
}