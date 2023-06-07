import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:telin_project/widgets/order/loading/bast/table_invoice.dart';

class printInvoiceExisting {
  Future<void> InvoiceExistingPrinttt(
      List dataLoading, List dataLoadingCable, List dataLoadingKit) async {
    final doc = pw.Document();
    final TelinLogo =
        await imageFromAssetBundle('assets/images/logo_telin_login.png');
    var totCableUsd = List.generate(
        dataLoadingCable.length,
        (index) =>
            dataLoadingCable[index]['priceUsd'] *
            dataLoadingCable[index]['length_report']);
    var totSparekitUsd = List.generate(
        dataLoadingKit.length,
        (index) =>
            dataLoadingKit[index]['unitPriceUsd'] *
            dataLoadingKit[index]['qty']);
    var totCableIdr = List.generate(
        dataLoadingCable.length,
        (index) =>
            dataLoadingCable[index]['priceIdr'] *
            dataLoadingCable[index]['length_report']);
    var totSparekitIdr = List.generate(
        dataLoadingKit.length,
        (index) =>
            dataLoadingKit[index]['unitPriceIdr'] *
            dataLoadingKit[index]['qty']);
    var totalCableUsd = totCableUsd.reduce((a, b) => a + b);
    var totalSparekitUsd = totSparekitUsd.reduce((a, b) => a + b);
    var totalSparekitIdr = totSparekitIdr.reduce((a, b) => a + b);
    var totalCableIdr = totCableIdr.reduce((a, b) => a + b);

    var totalQtySparekit = List.generate(dataLoadingKit.length,
        (index) => dataLoadingKit[index]['weight_kg']).reduce((a, b) => a + b);

    doc.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        build: (pw.Context context) {
          return [
            pw.Container(
                child: pw.Column(
              children: [
                pw.Container(
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                      pw.Container(
                          width: 140, height: 70, child: pw.Image(TelinLogo)),
                      pw.Container(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Text("INVOICE",
                                style: pw.TextStyle(
                                  fontSize: 16.6,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.black,
                                )),
                            pw.Text("Packing List",
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColors.black,
                                )),
                          ],
                        ),
                      )
                    ])),
                pw.SizedBox(
                  height: 5,
                ),
                pw.Container(
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Text(
                          "No Invoice: ${dataLoading[0]['no_bast_offloading'] ?? "-"}",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.normal,
                            color: PdfColors.black,
                          ))
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 30,
                ),
                pw.Container(
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Container(
                        child: pw.Column(
                          children: [
                            pw.Container(
                              width: 250,
                              child: pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text("SHIPPER",
                                      style: pw.TextStyle(
                                        fontSize: 16.6,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.black,
                                      )),
                                ],
                              ),
                            ),
                            pw.Container(
                              width: 250,
                              height: 100,
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 7)),
                              child: pw.Padding(
                                padding: const pw.EdgeInsets.all(10),
                                child: pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Container(
                                      child: pw.Row(
                                        children: [
                                          pw.Container(
                                            width: 40,
                                            child: pw.Text("Name",
                                                style: pw.TextStyle(
                                                  fontSize: 8,
                                                  fontWeight:
                                                      pw.FontWeight.normal,
                                                  color: PdfColors.black,
                                                )),
                                          ),
                                          pw.Flexible(
                                              child: pw.Text(
                                                  ": PT. Infrastruktur Telekomunikasi Indonesia",
                                                  style: pw.TextStyle(
                                                    fontSize: 8,
                                                    fontWeight:
                                                        pw.FontWeight.normal,
                                                    color: PdfColors.black,
                                                  )))
                                        ],
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Container(
                                      child: pw.Row(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Container(
                                            width: 40,
                                            child: pw.Text("Addres",
                                                style: pw.TextStyle(
                                                  fontSize: 8,
                                                  fontWeight:
                                                      pw.FontWeight.normal,
                                                  color: PdfColors.black,
                                                )),
                                          ),
                                          pw.Flexible(
                                            child: pw.Text(
                                                ": Telkom Landmark Tower, Tower 2, Lantai 19 Jl. Jend. Gatot Subroto Kav. 52 Kel. Kuningan Barat Kec. Mampang Prapatan, Jakarta Selatan  12710",
                                                style: pw.TextStyle(
                                                  fontSize: 8,
                                                  fontWeight:
                                                      pw.FontWeight.normal,
                                                  color: PdfColors.black,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Container(
                                      child: pw.Row(
                                        children: [
                                          pw.Container(
                                            child: pw.Row(
                                              children: [
                                                pw.Container(
                                                  width: 40,
                                                  child: pw.Text("City",
                                                      style: pw.TextStyle(
                                                        fontSize: 8,
                                                        fontWeight: pw
                                                            .FontWeight.normal,
                                                        color: PdfColors.black,
                                                      )),
                                                ),
                                                pw.Text(": Jakarta",
                                                    style: pw.TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          pw.FontWeight.normal,
                                                      color: PdfColors.black,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          pw.SizedBox(
                                            width: 20,
                                          ),
                                          pw.Text("State",
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                fontWeight:
                                                    pw.FontWeight.normal,
                                                color: PdfColors.black,
                                              )),
                                          pw.SizedBox(
                                            width: 10,
                                          ),
                                          pw.Text(": Indonesia",
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                fontWeight:
                                                    pw.FontWeight.normal,
                                                color: PdfColors.black,
                                              ))
                                        ],
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Container(
                                      child: pw.Row(
                                        children: [
                                          pw.Container(
                                            width: 40,
                                            child: pw.Text("Phone",
                                                style: pw.TextStyle(
                                                  fontSize: 8,
                                                  fontWeight:
                                                      pw.FontWeight.normal,
                                                  color: PdfColors.black,
                                                )),
                                          ),
                                          pw.Text(": +62 822-3754-1321 (Hanif)",
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                fontWeight:
                                                    pw.FontWeight.normal,
                                                color: PdfColors.black,
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
                      pw.Container(
                        child: pw.Column(
                          children: [
                            pw.Container(
                              width: 250,
                              child: pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text("CONSIGNEE",
                                      style: pw.TextStyle(
                                        fontSize: 16.6,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.black,
                                      )),
                                ],
                              ),
                            ),
                            pw.Container(
                              width: 250,
                              height: 100,
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(width: 7)),
                              child: pw.Padding(
                                padding: const pw.EdgeInsets.all(6),
                                child: pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Container(
                                      child: pw.Row(
                                        children: [
                                          pw.Container(
                                            width: 40,
                                            child: pw.Text("Name",
                                                style: pw.TextStyle(
                                                  fontSize: 8,
                                                  fontWeight:
                                                      pw.FontWeight.normal,
                                                  color: PdfColors.black,
                                                )),
                                          ),
                                          pw.Text(
                                              ": ${dataLoading[0]['perusahaan']['company_name'] ?? "-"}",
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                fontWeight:
                                                    pw.FontWeight.normal,
                                                color: PdfColors.black,
                                              ))
                                        ],
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Container(
                                      child: pw.Row(
                                        children: [
                                          pw.Container(
                                            width: 40,
                                            child: pw.Text("Ship",
                                                style: pw.TextStyle(
                                                  fontSize: 8,
                                                  fontWeight:
                                                      pw.FontWeight.normal,
                                                  color: PdfColors.black,
                                                )),
                                          ),
                                          pw.Text(": -",
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                fontWeight:
                                                    pw.FontWeight.normal,
                                                color: PdfColors.black,
                                              ))
                                        ],
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Container(
                                      child: pw.Row(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Container(
                                            width: 40,
                                            child: pw.Text("Addres",
                                                style: pw.TextStyle(
                                                  fontSize: 8,
                                                  fontWeight:
                                                      pw.FontWeight.normal,
                                                  color: PdfColors.black,
                                                )),
                                          ),
                                          pw.Flexible(
                                            child: pw.Text(
                                                ": ${dataLoading[0]['perusahaan']['address'] ?? "-"}",
                                                style: pw.TextStyle(
                                                  fontSize: 8,
                                                  fontWeight:
                                                      pw.FontWeight.normal,
                                                  color: PdfColors.black,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Container(
                                      child: pw.Row(
                                        children: [
                                          pw.Container(
                                            child: pw.Row(
                                              children: [
                                                pw.Container(
                                                  width: 40,
                                                  child: pw.Text("City",
                                                      style: pw.TextStyle(
                                                        fontSize: 8,
                                                        fontWeight: pw
                                                            .FontWeight.normal,
                                                        color: PdfColors.black,
                                                      )),
                                                ),
                                                pw.Text(
                                                    ": ${dataLoading[0]['perusahaan']['city'] ?? "-"}",
                                                    style: pw.TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          pw.FontWeight.normal,
                                                      color: PdfColors.black,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          pw.SizedBox(
                                            width: 20,
                                          ),
                                          pw.Text("State",
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                fontWeight:
                                                    pw.FontWeight.normal,
                                                color: PdfColors.black,
                                              )),
                                          pw.Text(
                                              ": ${dataLoading[0]['perusahaan']['state'] ?? "-"}",
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                fontWeight:
                                                    pw.FontWeight.normal,
                                                color: PdfColors.black,
                                              ))
                                        ],
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Container(
                                      child: pw.Row(
                                        children: [
                                          pw.Container(
                                            width: 40,
                                            child: pw.Text("Phone",
                                                style: pw.TextStyle(
                                                  fontSize: 8,
                                                  fontWeight:
                                                      pw.FontWeight.normal,
                                                  color: PdfColors.black,
                                                )),
                                          ),
                                          pw.Text(
                                              ": ${dataLoading[0]['perusahaan']['phone'] ?? "-"}",
                                              style: pw.TextStyle(
                                                fontSize: 8,
                                                fontWeight:
                                                    pw.FontWeight.normal,
                                                color: PdfColors.black,
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
                pw.SizedBox(height: 10),
                pw.Container(
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: 100,
                        child: pw.Text("Port Off Loading",
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.normal,
                              color: PdfColors.black,
                            )),
                      ),
                      pw.SizedBox(
                        width: 20,
                      ),
                      pw.Text(": Makassar",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.normal,
                            color: PdfColors.black,
                          ))
                    ],
                  ),
                ),
                pw.Container(
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: 100,
                        child: pw.Text("Port Off Discharge",
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.normal,
                              color: PdfColors.black,
                            )),
                      ),
                      pw.SizedBox(
                        width: 20,
                      ),
                      pw.Text(": Ambon",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.normal,
                            color: PdfColors.black,
                          ))
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 15,
                ),
                pw.Container(
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: 100,
                        child: pw.Text("Cable",
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.normal,
                              color: PdfColors.black,
                            )),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 5,
                ),

                pw.Container(
                    child: pw.Row(children: [
                  pw.Container(
                      height: 20,
                      width: 15,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("No",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 80,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Deskription",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Model/Part No",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Length (Km)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Qty (Box)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Weight (Kg)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Unit Price (USD)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Total Price (USD)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Unit Price (IDR)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Total Price (IDR)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              ))))
                ])),
                pw.ListView.builder(
                  itemCount: dataLoadingCable.length,
                  itemBuilder: (context, index) {
                    return pw.Container(
                      child: pw.Row(
                        children: [
                          pw.Container(
                              height: 20,
                              width: 15,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text("${index + 1}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 80,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingCable[index]['description'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingCable[index]['system'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingCable[index]['length_report']}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text("-",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text("-",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingCable[index]['priceUsd'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingCable[index]['priceUsd'] * dataLoadingCable[index]['length_report'] ?? ""}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingCable[index]['priceIdr'] ?? ""}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingCable[index]['priceIdr'] * dataLoadingCable[index]['length_report'] ?? ""}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      ))))
                        ],
                      ),
                    );
                  },
                ),
                pw.Container(
                    child: pw.Row(children: [
                  pw.Container(
                    height: 20,
                    width: 15,
                  ),
                  pw.Container(
                    height: 20,
                    width: 80,
                  ),
                  pw.Container(
                    height: 20,
                    width: 60,
                  ),
                  pw.Container(
                      height: 20,
                      width: 120,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Total Weight (Kg)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("-",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Total Price (USD)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("$totalCableUsd",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Total Price (IDR)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("$totalCableIdr",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              ))))
                ])),

                pw.SizedBox(
                  height: 20,
                ),
                pw.Container(
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: 100,
                        child: pw.Text("Non Cable",
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.normal,
                              color: PdfColors.black,
                            )),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 5,
                ),

                pw.Container(
                    child: pw.Row(children: [
                  pw.Container(
                      height: 20,
                      width: 15,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("No",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 80,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Deskription",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Model/Part No",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Length (Km)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Qty (Box)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Weight (Kg)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Unit Price (USD)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Total Price (USD)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Unit Price (IDR)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Total Price (IDR)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              ))))
                ])),
                pw.ListView.builder(
                  itemCount: dataLoadingKit.length,
                  itemBuilder: (context, index) {
                    return pw.Container(
                      child: pw.Row(
                        children: [
                          pw.Container(
                              height: 20,
                              width: 15,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text("${index + 1}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 80,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingKit[index]['item_name'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingKit[index]['part_number'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text("-",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingKit[index]['qty'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingKit[index]['weight_kg']}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingKit[index]['unitPriceUsd'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingKit[index]['unitPriceUsd'] * dataLoadingKit[index]['qty'] ?? ""}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingKit[index]['unitPriceIdr'] ?? ""}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      )))),
                          pw.Container(
                              height: 20,
                              width: 60,
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              child: pw.Center(
                                  child: pw.Text(
                                      "${dataLoadingKit[index]['unitPriceIdr'] * dataLoadingKit[index]['qty'] ?? ""}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.normal,
                                        color: PdfColors.black,
                                      ))))
                        ],
                      ),
                    );
                  },
                ),
                pw.Container(
                    child: pw.Row(children: [
                  pw.Container(
                    height: 20,
                    width: 15,
                  ),
                  pw.Container(
                    height: 20,
                    width: 80,
                  ),
                  pw.Container(
                    height: 20,
                    width: 60,
                  ),
                  pw.Container(
                      height: 20,
                      width: 120,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Total Weight (Kg)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("$totalQtySparekit",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Total Price (USD)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("$totalSparekitUsd",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("Total Price (IDR)",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
                  pw.Container(
                      height: 20,
                      width: 60,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Center(
                          child: pw.Text("$totalSparekitIdr",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              ))))
                ])),
                // pw.Container(
                //   height: 320,
                //   child: pw.Column(
                //     children: [
                //       //  pw.Expanded(child: TableInvoiceLoadingPrint()),
                //       pw.Container(
                //         child: pw.Row(
                //           mainAxisAlignment: pw.MainAxisAlignment.end,
                //           children: [
                //             pw.Container(
                //               width: 150,
                //               height: 20,
                //               decoration: pw.BoxDecoration(
                //                   border: pw.Border(
                //                       left: pw.BorderSide(width: 2),
                //                       top: pw.BorderSide(width: 2),
                //                       bottom: pw.BorderSide(width: 2))),
                //               child: pw.Center(
                //                 child: pw.Text("Total Weight (Kg)",
                //                     style: pw.TextStyle(
                //                       fontSize: 8,
                //                       fontWeight: pw.FontWeight.bold,
                //                       fontStyle: pw.FontStyle.italic,
                //                       color: PdfColors.black,
                //                     )),
                //               ),
                //             ),
                //             pw.Container(
                //               width: 80,
                //               height: 20,
                //               decoration: pw.BoxDecoration(
                //                   border: pw.Border(
                //                       left: pw.BorderSide(width: 2),
                //                       top: pw.BorderSide(width: 2),
                //                       bottom: pw.BorderSide(width: 2))),
                //               child: pw.Center(
                //                 child: pw.Text("4.2.10.85",
                //                     style: pw.TextStyle(
                //                       fontSize: 8,
                //                       fontWeight: pw.FontWeight.bold,
                //                       fontStyle: pw.FontStyle.italic,
                //                       color: PdfColors.black,
                //                     )),
                //               ),
                //             ),
                //             pw.Container(
                //               width: 90,
                //               height: 20,
                //               decoration: pw.BoxDecoration(
                //                   border: pw.Border(
                //                       left: pw.BorderSide(width: 2),
                //                       top: pw.BorderSide(width: 2),
                //                       bottom: pw.BorderSide(width: 2))),
                //               child: pw.Center(
                //                 child: pw.Text("Total Price (USD)",
                //                     style: pw.TextStyle(
                //                       fontSize: 8,
                //                       fontWeight: pw.FontWeight.bold,
                //                       fontStyle: pw.FontStyle.italic,
                //                       color: PdfColors.black,
                //                     )),
                //               ),
                //             ),
                //             pw.Container(
                //               width: 90,
                //               height: 20,
                //               decoration: pw.BoxDecoration(
                //                   border: pw.Border(
                //                       left: pw.BorderSide(width: 2),
                //                       top: pw.BorderSide(width: 2),
                //                       bottom: pw.BorderSide(width: 2))),
                //               child: pw.Center(
                //                 child: pw.Text("176.532.32",
                //                     style: pw.TextStyle(
                //                       fontSize: 8,
                //                       fontWeight: pw.FontWeight.bold,
                //                       fontStyle: pw.FontStyle.italic,
                //                       color: PdfColors.black,
                //                     )),
                //               ),
                //             ),
                //             pw.Container(
                //               width: 90,
                //               height: 20,
                //               decoration: pw.BoxDecoration(
                //                   border: pw.Border(
                //                       left: pw.BorderSide(width: 2),
                //                       top: pw.BorderSide(width: 2),
                //                       bottom: pw.BorderSide(width: 2))),
                //               child: pw.Center(
                //                 child: pw.Text("Total Price (IDR)",
                //                     style: pw.TextStyle(
                //                       fontSize: 8,
                //                       fontWeight: pw.FontWeight.bold,
                //                       fontStyle: pw.FontStyle.italic,
                //                       color: PdfColors.black,
                //                     )),
                //               ),
                //             ),
                //             pw.Container(
                //               width: 97,
                //               height: 20,
                //               decoration: pw.BoxDecoration(
                //                   border: pw.Border(
                //                       left: pw.BorderSide(width: 2),
                //                       top: pw.BorderSide(width: 2),
                //                       bottom: pw.BorderSide(width: 2),
                //                       right: pw.BorderSide(width: 2))),
                //               child: pw.Center(
                //                 child: pw.Text("2.630.389.849",
                //                     style: pw.TextStyle(
                //                       fontSize: 8,
                //                       fontWeight: pw.FontWeight.bold,
                //                       fontStyle: pw.FontStyle.italic,
                //                       color: PdfColors.black,
                //                     )),
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Container(
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Container(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              width: 100,
                              child: pw.Text("Terbilang",
                                  style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.normal,
                                    color: PdfColors.black,
                                  )),
                            ),
                            pw.SizedBox(height: 5),
                            pw.Container(
                              width: 367.3,
                              height: 26.6,
                              decoration: pw.BoxDecoration(
                                  color: const PdfColor.fromInt(0xffD9D9D9),
                                  border: pw.Border.all(width: 2),
                                  borderRadius: pw.BorderRadius.circular(5)),
                              child: pw.Padding(
                                padding: const pw.EdgeInsets.only(left: 5),
                                child: pw.Column(
                                  children: [
                                    pw.Flexible(
                                        child: pw.Text(
                                            "Dua Milyar Enam Ratus Tiga Puluh Juta Delapan Ratus Enam Puluh Enam Ribu Tiga Ratus Tujuh Puluh",
                                            style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.bold,
                                              color: PdfColors.black,
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
                pw.SizedBox(
                  height: 20,
                ),
                pw.Container(
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Container(
                        child: pw.Column(
                          children: [
                            pw.Text(
                                "Jakarta, ${dataLoading[0]['submitted_date_offloading']}",
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColors.black,
                                )),
                            pw.Container(
                              height: 60,
                            ),
                            pw.Text("Nato Joko Prayoto",
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColors.black,
                                )),
                            pw.Text("VP Submarine Implementation & Operation",
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.black,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ))
          ];
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }
}
