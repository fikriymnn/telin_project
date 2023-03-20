import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:telin_project/widgets/order/loading/bast/table_bast_print.dart';
import 'package:telin_project/widgets/order/loading/bast/table_invoice.dart';
import 'package:telin_project/widgets/order/new_material/table/table_new_cable.dart';

class InvoiceLoadingPrint extends StatefulWidget {
  const InvoiceLoadingPrint({super.key});

  @override
  State<InvoiceLoadingPrint> createState() => _InvoiceLoadingPrintState();
}

class _InvoiceLoadingPrintState extends State<InvoiceLoadingPrint> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
            width: 794,
            height: 1000,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Container(
                            width: 140,
                            height: 70,
                            child: Image.asset(
                                'assets/images/logo_telin_login.png')),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("INVOICE",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16.6,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              Text("Packing List",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        )
                      ])),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("No Invoice: 001/TI/12/22",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: 332,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("SHIPPER",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16.6,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                width: 332,
                                height: 140,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              child: Text("Name",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                                ": PT. Infrastruktur Telekomunikasi Indonesia",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 40,
                                              child: Text("Addres",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Flexible(
                                              child: Text(
                                                  ": Telkom Landmark Tower, Tower 2, Lantai 19 Jl. Jend. Gatot Subroto Kav. 52 Kel. Kuningan Barat Kec. Mampang Prapatan, Jakarta Selatan  12710",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    child: Text("City",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(": Jakarta",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Text("State",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                )),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(": Indonesia",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              child: Text("Phone",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(": +62 822-3754-1321 (Hanif)",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: 332,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("CONSIGNEE",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16.6,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                width: 332,
                                height: 140,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              child: Text("Name",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(": PT. Dagang Samudera Hutama",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              child: Text("Ship",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(": -",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 40,
                                              child: Text("Addres",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Flexible(
                                              child: Text(
                                                  ": The East, Lantai 35, Unit 03 Jl. Dr. Ide Anak Agung Gede Agung, Kav. E 3.2, No. 1 DKI Jakarta  12950",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    child: Text("City",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(": Jakarta",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Text("State",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                )),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(": Indonesia",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              child: Text("Phone",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(": +62 851-6102-1791 (Ryan)",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          child: Text("Port Off Loading",
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(": Makassar",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          child: Text("Port Off Discharge",
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(": Ambon",
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 320,
                    child: Column(
                      children: [
                        Expanded(child: TableInvoiceLoadingPrint()),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                            width: 150,
                            height: 20,
                            decoration: BoxDecoration(border: Border(left: BorderSide(width: 2),top: BorderSide(width: 2),bottom: BorderSide(width: 2))),
                            child: Center(child: Text("Total Weight (Kg)",style: GoogleFonts.montserrat(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          )),),
                          ),
                          Container(
                            width: 80,
                            height: 20,
                            decoration: BoxDecoration(border: Border(left: BorderSide(width: 2),top: BorderSide(width: 2),bottom: BorderSide(width: 2))),
                            child: Center(child: Text("4.2.10.85",style: GoogleFonts.montserrat(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          )),),
                          ),
                          Container(
                            width: 90,
                            height: 20,
                            decoration: BoxDecoration(border: Border(left: BorderSide(width: 2),top: BorderSide(width: 2),bottom: BorderSide(width: 2))),
                            child: Center(child: Text("Total Price (USD)",style: GoogleFonts.montserrat(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          )),),
                          ),
                          Container(
                            width: 90,
                            height: 20,
                            decoration: BoxDecoration(border: Border(left: BorderSide(width: 2),top: BorderSide(width: 2),bottom: BorderSide(width: 2))),
                            child: Center(child: Text("176.532.32",style: GoogleFonts.montserrat(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          )),),
                          ),
                          Container(
                            width: 90,
                            height: 20,
                            decoration: BoxDecoration(border: Border(left: BorderSide(width: 2),top: BorderSide(width: 2),bottom: BorderSide(width: 2))),
                            child: Center(child: Text("Total Price (IDR)",style: GoogleFonts.montserrat(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          )),),
                          ),
                          Container(
                            width: 97,
                            height: 20,
                            decoration: BoxDecoration(border: Border(left: BorderSide(width: 2),top: BorderSide(width: 2),bottom: BorderSide(width: 2),right:BorderSide(width: 2) )),
                            child: Center(child: Text("2.630.389.849",style: GoogleFonts.montserrat(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          )),),
                          ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                child: Text("Terbilang",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    )),
                              ),
                              Container(
                                width: 367.3,
                                height: 26.6,
                                decoration: BoxDecoration(
                                    color: Color(0xffD9D9D9),
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      Flexible(
                                          child: Text(
                                              "Dua Milyar Enam Ratus Tiga Puluh Juta Delapan Ratus Enam Puluh Enam Ribu Tiga Ratus Tujuh Puluh",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ))),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text("Jakarta, 06 Desember 2022",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  )),
                              Container(
                                height: 100,
                              ),
                              Text("Nato Joko Prayoto",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  )),
                              Text("VP Submarine Implementation & Operation",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 60,),
                  Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: 90,
                      height: 37.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xffEC1D26)),
                      child: Center(
                        child: Text("Print",
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
            )),
      ),
    );
  }
}
