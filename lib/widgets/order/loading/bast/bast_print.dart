import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw ;
import 'package:printing/printing.dart';
import 'package:telin_project/widgets/order/loading/bast/table_bast_print.dart';
import 'package:telin_project/widgets/order/new_material/table/table_new_cable.dart';

class printBastLoading {
Future<void> BastLoadingPrint() async {


 

 final doc = pw.Document();

doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(child: pw.Text("Hallo")); // Center
      })); 
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save());
}






}







class BastLoadingPrint extends StatefulWidget {
  const BastLoadingPrint({super.key});

  @override
  State<BastLoadingPrint> createState() => _BastLoadingPrintState();
}

class _BastLoadingPrintState extends State<BastLoadingPrint> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: 700,
          height: 1000,
          child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(children: [
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Container(
                            width: 140,
                            height: 70,
                            child: Image.asset('assets/images/logo_telin_login.png')
                          ),
                          Container(
                            width: 140,
                            height: 70,
                            child: Image.asset('assets/images/wira_eka_logo.png'),
                          )
                        ])),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Statement of Fact (IN)",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Berita Acata Serah Terima Barang (Masuk)",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "On the day of THURSHDAY, 08 DECEMBER 2022 has been handover the goods of material:",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Pada hari ini KAMIS, 08 DESEMBER 2022 telah diserah terimakan barang atau material:",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const[
                                           Text(
                                            "No. BAST",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                           SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "From/Dari",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                           SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "To/Ke",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                           SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Comapny Order",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                           Text(
                                            "Project Name",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const[
                                          Text(
                                            ": 004/BAST Loading/WEB/XII/2022",
                                            style: TextStyle(
                                                fontSize: 6,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            ": DEPO 104 MAKASSAR",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            ": -",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            ": -",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            ": REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 130,
                          height: 20,
                          decoration: BoxDecoration(color: Color(0xffFFB800)),
                          child: Center(child: Text("CABLE",style: GoogleFonts.montserrat(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),),
                        ),
                      ],
                    ),
                    Container(
                      height: 120,
                      child: Column(
                        children: [
                          Expanded(child: TableBastLoadingPrint()),
                          Padding(
                      padding: const EdgeInsets.only(right: 113),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 90,
                            height: 20,
                            decoration: BoxDecoration(color: Color(0xffFFB800),border: Border(left: BorderSide(),top: BorderSide(),bottom: BorderSide())),
                            child: Center(child: Text("TOTAL",style: GoogleFonts.montserrat(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          )),),
                          ),
                          Container(
                            width: 84,
                            height: 20,
                            decoration: BoxDecoration(color: Color(0xffFFB800),border: Border.all()),
                            child: Center(child: Text("21.93",style: GoogleFonts.montserrat(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),),
                          ),
                        ],
                      ),
                    ),
                        ],
                      ),
                    ),
                    
                  ])),
        ),
      ),
    );
    
  }
}

















