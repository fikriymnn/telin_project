import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pluto_grid_export/pluto_grid_export.dart';
import 'package:printing/printing.dart';

class printBastLoading {
  Future<void> BastLoadingPrinttt(
      List dataLoadingCable, List dataLoadingSparekit, List dataLoading) async {
    final doc = pw.Document();
    final TelinLogo =
        await imageFromAssetBundle('assets/images/logo_telin_login.png');
    final WiraEkaLogo =
        await imageFromAssetBundle('assets/images/logo_telin_login.png');

    doc.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(47.5),
        build: (pw.Context context) {
          return [
            pw.Column(children: [
              pw.Container(
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                    pw.Container(
                        width: 140, height: 70, child: pw.Image(TelinLogo)),
                    pw.Container(
                      width: 140,
                      height: 70,
                      child: pw.Image(WiraEkaLogo),
                    )
                  ])),
              pw.SizedBox(
                height: 15,
              ),
              pw.Container(
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Container(
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "Statement of Fact (IN)",
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.bold,
                              fontStyle: pw.FontStyle.italic,
                            ),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Text(
                            "Berita Acata Serah Terima Barang (Keluar)",
                            style: const pw.TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          pw.SizedBox(
                            height: 15,
                          ),
                          pw.Text(
                            "On the day of ${dataLoading[0]['submitted_date_loading']} has been handover the goods of material:",
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.bold,
                              fontStyle: pw.FontStyle.italic,
                            ),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Text(
                            "Pada hari ini ${dataLoading[0]['submitted_date_loading']} telah diserah terimakan barang atau material:",
                            style: const pw.TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          pw.SizedBox(
                            height: 15,
                          ),
                          pw.Container(
                              child: pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            children: [
                              pw.Container(
                                child: pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      "No. BAST",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.red,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Text(
                                      "From/Dari",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Text(
                                      "To/Ke",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Text(
                                      "Comapny Order",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Text(
                                      "Project Name",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(
                                width: 40,
                              ),
                              pw.Container(
                                child: pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      ": ${dataLoading[0]['no_bast'] ?? "-"}",
                                      style: pw.TextStyle(
                                          fontSize: 6,
                                          fontWeight: pw.FontWeight.bold,
                                          color: PdfColors.red),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Text(
                                      ": ${dataLoading[0]['from'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Text(
                                      ": ${dataLoading[0]['to'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Text(
                                      ": ${dataLoading[0]['perusahaan']['company_name'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                    pw.Text(
                                      ": ${dataLoading[0]['project_name'] ?? "-"}",
                                      style: pw.TextStyle(
                                        fontSize: 6,
                                        fontWeight: pw.FontWeight.bold,
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
              pw.SizedBox(
                height: 15,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                    width: 100,
                    height: 20,
                    decoration: const pw.BoxDecoration(
                        color: PdfColor.fromInt(0xffFFB800)),
                    child: pw.Center(
                      child: pw.Text("CABLE",
                          style: pw.TextStyle(
                            fontSize: 8,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                    ),
                  ),
                ],
              ),
              TableCableBast(dataLoadingCable),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                    width: 100,
                    height: 20,
                    decoration: const pw.BoxDecoration(
                        color: PdfColor.fromInt(0xffFFB800)),
                    child: pw.Center(
                      child: pw.Text("NON CABLE",
                          style: pw.TextStyle(
                            fontSize: 8,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                    ),
                  ),
                ],
              ),
              TableNonCableBast(dataLoadingSparekit),
              pw.SizedBox(height: 50),
              pw.Container(
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                    pw.Container(
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                          pw.Text(
                            "All the material have been submitted and received in good condition.",
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(height: 3),
                          pw.Text(
                            "Seluruh material telah diserahkan dan diterima dalam kondisi baik. ",
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.bold,
                              fontStyle: pw.FontStyle.italic,
                            ),
                          ),
                        ])),
                  ])),
              pw.SizedBox(height: 50),
              pw.Container(
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                    pw.Container(
                        child: pw.Column(children: [
                      pw.Text("Disrahkan oleh,",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                      pw.Container(height: 60, child: pw.Column()),
                      pw.Text("${dataLoading[0]['diserahkan']['name']}",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                      pw.Text("( Depo 104 MKS, PT. W.E.B )",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                    ])),
                    pw.Container(
                        child: pw.Column(children: [
                      pw.Text("Diterima oleh,",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                      pw.Container(
                        height: 60,
                      ),
                      pw.Text("${dataLoading[0]['diterima']}",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                      pw.Text(
                          "( ${dataLoading[0]['perusahaan']['company_name']} )",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                    ])),
                    pw.Container(
                        child: pw.Column(children: [
                      pw.Text("Diketahui oleh,",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                      pw.Container(
                        height: 60,
                      ),
                      pw.Text("${dataLoading[0]['diketahui']['name']}",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                      pw.Text("( PT. TELKOMINFRA )",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          )),
                    ]))
                  ]))
            ])
          ];
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  static TableCableBast(List dataLoadingCable) {
    var totalLength = List.generate(dataLoadingCable.length,
            (index) => dataLoadingCable[index]['length_report'])
        .reduce((a, b) => a + b);
    return pw.Column(children: [
      pw.Container(
          child: pw.Row(children: [
        pw.Container(
            height: 20,
            width: 40,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("ID",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("SYSTEM",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("TYPE",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 40,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("MFG",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("ARMOUR",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("\u03A3 CORE",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text('''RESINTANCE
(M)''',
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text('''LENGTH
(M)
              ''',
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("REMARK",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
      ])),
      pw.ListView.builder(
          itemCount: dataLoadingCable.length,
          itemBuilder: (context, index) {
            return pw.Container(
                child: pw.Row(children: [
              pw.Container(
                  height: 20,
                  width: 40,
                  decoration: pw.BoxDecoration(border: pw.Border.all()),
                  child: pw.Center(
                      child: pw.Text(
                          "${dataLoadingCable[index]['label_id'] ?? "-"}",
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
                      child: pw.Text(
                          "${dataLoadingCable[index]['system']['system'] ?? "-"}",
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
                      child: pw.Text(
                          "${dataLoadingCable[index]['cable_type']['cable_type'] ?? "-"}",
                          style: pw.TextStyle(
                            fontSize: 6,
                            fontWeight: pw.FontWeight.normal,
                            color: PdfColors.black,
                          )))),
              pw.Container(
                  height: 20,
                  width: 40,
                  decoration: pw.BoxDecoration(border: pw.Border.all()),
                  child: pw.Center(
                      child: pw.Text(
                          "${dataLoadingCable[index]['manufacturer']['manufacturer'] ?? "-"}",
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
                      child: pw.Text(
                          "${dataLoadingCable[index]['armoring_type']['armoring_type'] ?? "-"}",
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
                      child: pw.Text(
                          "${dataLoadingCable[index]['sigma_core'] ?? "-"}",
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
                      child: pw.Text(
                          "${dataLoadingCable[index]['length_report'] ?? "-"}",
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
                      child:
                          pw.Text("${dataLoadingCable[index]['remark'] ?? "-"}",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )))),
            ]));
          }),
      pw.Container(
          child: pw.Row(children: [
        pw.Container(
          height: 20,
          width: 40,
        ),
        pw.Container(
          height: 20,
          width: 60,
        ),
        pw.Container(
          height: 20,
          width: 60,
        ),
        pw.Container(
          height: 20,
          width: 40,
        ),
        pw.Container(
          height: 20,
          width: 60,
        ),
        pw.Container(
          height: 20,
          width: 60,
        ),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(
                border: pw.Border.all(),
                color: const PdfColor.fromInt(0xffFFB800)),
            child: pw.Center(
                child: pw.Text("TOTAL",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                      fontStyle: pw.FontStyle.italic,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(
                border: pw.Border.all(),
                color: const PdfColor.fromInt(0xffFFB800)),
            child: pw.Center(
                child: pw.Text("$totalLength",
                    style: pw.TextStyle(
                      fontSize: 6,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
          height: 20,
          width: 60,
        ),
      ]))
    ]);
  }

  List SerialNumber = [
    ["749849", "045904"],
    {"7458932", "4567450"}
  ];

  static TableNonCableBast(List DataLoadingSparekit) {
    var totalQty = List.generate(DataLoadingSparekit.length,
            (index) => DataLoadingSparekit[index]['qty_taken'])
        .reduce((a, b) => a + b);
    var totalWeight = List.generate(DataLoadingSparekit.length,
            (index) => DataLoadingSparekit[index]['weight_kg'])
        .reduce((a, b) => a + b);
    return pw.Column(children: [
      pw.Container(
          child: pw.Row(children: [
        pw.Container(
            height: 20,
            width: 20,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("NO",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 150,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("ITEM NAME",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("TYPE",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("""SERIAL
NUMBER""",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 30,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("QTY",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 40,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("UNIT",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("WEIGHT",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 80,
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            child: pw.Center(
                child: pw.Text("REMARK",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
      ])),
      pw.ListView.builder(
          itemCount: DataLoadingSparekit.length,
          itemBuilder: (context, index) {
            return pw.Container(
                decoration: pw.BoxDecoration(border: pw.Border.all()),
                child: pw.Column(children: [
                  pw.Container(
                      child: pw.Row(children: [
                    pw.Container(
                        width: 20,
                        height: 20,
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Center(
                          child: pw.Text("${index + 1}",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )),
                        )),
                    pw.Container(
                        width: 150,
                        height: 20,
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: pw.Center(
                              child: pw.Text(
                                  "${DataLoadingSparekit[index]['item_name'] ?? "-"}",
                                  style: pw.TextStyle(
                                    fontSize: 6,
                                    fontWeight: pw.FontWeight.normal,
                                    color: PdfColors.black,
                                  )),
                            ))),
                    pw.Container(
                        width: 60,
                        height: 20,
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Center(
                          child: pw.Text("-",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )),
                        )),
                    pw.Container(
                        width: 60,
                        height: 20,
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Center(
                            child: pw.Text(
                                "${DataLoadingSparekit[index]['serial_number'] ?? "-"}",
                                style: pw.TextStyle(
                                  fontSize: 6,
                                  fontWeight: pw.FontWeight.normal,
                                  color: PdfColors.black,
                                )))),
                    pw.Container(
                        width: 30,
                        height: 20,
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Center(
                          child: pw.Text(
                              "${DataLoadingSparekit[index]['qty_taken'] ?? "-"}",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )),
                        )),
                    pw.Container(
                        width: 40,
                        height: 20,
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Center(
                          child: pw.Text(
                              "${DataLoadingSparekit[index]['unit'] ?? "-"}",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )),
                        )),
                    pw.Container(
                        width: 60,
                        height: 20,
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Center(
                          child: pw.Text(
                              "${DataLoadingSparekit[index]['weight_kg'] ?? "-"}",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )),
                        )),
                    pw.Container(
                        width: 80,
                        height: 20,
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Center(
                          child: pw.Text(
                              "${DataLoadingSparekit[index]['remark'] ?? "-"}",
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black,
                              )),
                        )),
                  ])),
                  // pw.Container(
                  //     child: pw.Row(children: [
                  //   pw.Container(
                  //       height: 20,
                  //       width: 290,
                  //       decoration: pw.BoxDecoration(
                  //         border: pw.Border.all(),
                  //       ),
                  //       child: pw.Center(
                  //           child: pw.Text("Sub Total",
                  //               style: pw.TextStyle(
                  //                 fontSize: 8,
                  //                 fontWeight: pw.FontWeight.bold,
                  //                 color: PdfColors.red,
                  //               )))),
                  //   pw.Container(
                  //       height: 20,
                  //       width: 30,
                  //       decoration: pw.BoxDecoration(
                  //         border: pw.Border.all(),
                  //       ),
                  //       child: pw.Center(
                  //           child: pw.Text("8",
                  //               style: pw.TextStyle(
                  //                 fontSize: 8,
                  //                 fontWeight: pw.FontWeight.bold,
                  //                 color: PdfColors.red,
                  //               )))),
                  //   pw.Container(
                  //       height: 20,
                  //       width: 40,
                  //       decoration: pw.BoxDecoration(
                  //         border: pw.Border.all(),
                  //       ),
                  //       child: pw.Center(
                  //           child: pw.Text("",
                  //               style: pw.TextStyle(
                  //                 fontSize: 8,
                  //                 fontWeight: pw.FontWeight.bold,
                  //                 fontStyle: pw.FontStyle.italic,
                  //                 color: PdfColors.black,
                  //               )))),
                  //   pw.Container(
                  //       height: 20,
                  //       width: 60,
                  //       decoration: pw.BoxDecoration(
                  //         border: pw.Border.all(),
                  //       ),
                  //       child: pw.Center(
                  //           child: pw.Text("28,00",
                  //               style: pw.TextStyle(
                  //                 fontSize: 8,
                  //                 fontWeight: pw.FontWeight.bold,
                  //                 color: PdfColors.red,
                  //               )))),
                  //   pw.Container(
                  //       height: 20,
                  //       width: 80,
                  //       child: pw.Center(
                  //           child: pw.Text("",
                  //               style: pw.TextStyle(
                  //                 fontSize: 8,
                  //                 fontWeight: pw.FontWeight.bold,
                  //                 fontStyle: pw.FontStyle.italic,
                  //                 color: PdfColors.black,
                  //               )))),
                  // ])),
                ]));
          }),
      pw.Container(
          child: pw.Row(children: [
        pw.Container(
            height: 20,
            width: 20,
            child: pw.Center(
                child: pw.Text("",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 150,
            child: pw.Center(
                child: pw.Text("",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 120,
            decoration: pw.BoxDecoration(
                border: pw.Border.all(),
                color: const PdfColor.fromInt(0xffFFB800)),
            child: pw.Center(
                child: pw.Text("GRANDE TOTAL",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                      fontStyle: pw.FontStyle.italic,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 30,
            decoration: pw.BoxDecoration(
                border: pw.Border.all(),
                color: const PdfColor.fromInt(0xffFFB800)),
            child: pw.Center(
                child: pw.Text("$totalQty",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                      fontStyle: pw.FontStyle.italic,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 40,
            decoration: pw.BoxDecoration(
                border: pw.Border.all(),
                color: const PdfColor.fromInt(0xffFFB800)),
            child: pw.Center(
                child: pw.Text("",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                      fontStyle: pw.FontStyle.italic,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 60,
            decoration: pw.BoxDecoration(
                border: pw.Border.all(),
                color: const PdfColor.fromInt(0xffFFB800)),
            child: pw.Center(
                child: pw.Text("$totalWeight",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                      fontStyle: pw.FontStyle.italic,
                      color: PdfColors.black,
                    )))),
        pw.Container(
            height: 20,
            width: 80,
            child: pw.Center(
                child: pw.Text("",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                      fontStyle: pw.FontStyle.italic,
                      color: PdfColors.black,
                    )))),
      ])),
    ]);
  }
}


// pw.Container(
//                 decoration: pw.BoxDecoration(border: pw.Border.all()),
//                 child: pw.Column(children: [
//                   pw.Container(
//                       child: pw.Row(children: [
//                     pw.Container(
//                         child: pw.ListView.builder(
//                       itemCount: 1,
//                       itemBuilder: (context, index) {
//                         return pw.Padding(
//                           padding: const pw.EdgeInsets.symmetric(vertical: 5),
//                           child: pw.Container(
//                               width: 20,
//                               child: pw.Center(
//                                   child: pw.Text("${index + 1}",
//                                       style: pw.TextStyle(
//                                         fontSize: 6,
//                                         fontWeight: pw.FontWeight.normal,
//                                         color: PdfColors.black,
//                                       )))),
//                         );
//                       },
//                     )),
//                     pw.Container(
//                         child: pw.ListView.builder(
//                       itemCount: 1,
//                       itemBuilder: (context, index) {
//                         return pw.Padding(
//                           padding: const pw.EdgeInsets.symmetric(vertical: 5),
//                           child: pw.Container(
//                               width: 150,
//                               child: pw.Center(
//                                   child: pw.Text(
//                                       "UJ REMOULD KIT FOR COMMON COMPONENT",
//                                       style: pw.TextStyle(
//                                         fontSize: 6,
//                                         fontWeight: pw.FontWeight.normal,
//                                         color: PdfColors.black,
//                                       )))),
//                         );
//                       },
//                     )),
//                     pw.Container(
//                         child: pw.ListView.builder(
//                       itemCount: 1,
//                       itemBuilder: (context, index) {
//                         return pw.Padding(
//                           padding: const pw.EdgeInsets.symmetric(vertical: 5),
//                           child: pw.Container(
//                               width: 60,
//                               child: pw.Center(
//                                   child: pw.Text("KIT 17010",
//                                       style: pw.TextStyle(
//                                         fontSize: 6,
//                                         fontWeight: pw.FontWeight.normal,
//                                         color: PdfColors.black,
//                                       )))),
//                         );
//                       },
//                     )),
//                     pw.Container(
//                         decoration: pw.BoxDecoration(border: pw.Border.all()),
//                         child: pw.ListView.builder(
//                           itemCount: 3,
//                           itemBuilder: (context, index) {
//                             return pw.Padding(
//                                 padding:
//                                     const pw.EdgeInsets.symmetric(vertical: 5),
//                                 child: pw.Container(
//                                     width: 60,
//                                     child: pw.Center(
//                                         child: pw.Text("0734465",
//                                             style: pw.TextStyle(
//                                               fontSize: 6,
//                                               fontWeight: pw.FontWeight.normal,
//                                               color: PdfColors.black,
//                                             )))));
//                           },
//                         )),
//                     pw.Container(
//                         decoration: pw.BoxDecoration(border: pw.Border.all()),
//                         child: pw.ListView.builder(
//                           itemCount: 3,
//                           itemBuilder: (context, index) {
//                             return pw.Padding(
//                               padding:
//                                   const pw.EdgeInsets.symmetric(vertical: 5),
//                               child: pw.Container(
//                                   width: 30,
//                                   child: pw.Center(
//                                       child: pw.Text("4",
//                                           style: pw.TextStyle(
//                                             fontSize: 6,
//                                             fontWeight: pw.FontWeight.normal,
//                                             color: PdfColors.black,
//                                           )))),
//                             );
//                           },
//                         )),
//                     pw.Container(
//                         decoration: pw.BoxDecoration(border: pw.Border.all()),
//                         child: pw.ListView.builder(
//                           itemCount: 3,
//                           itemBuilder: (context, index) {
//                             return pw.Padding(
//                               padding:
//                                   const pw.EdgeInsets.symmetric(vertical: 5),
//                               child: pw.Container(
//                                   width: 40,
//                                   child: pw.Center(
//                                       child: pw.Text("PCS",
//                                           style: pw.TextStyle(
//                                             fontSize: 6,
//                                             fontWeight: pw.FontWeight.normal,
//                                             color: PdfColors.black,
//                                           )))),
//                             );
//                           },
//                         )),
//                     pw.Container(
//                         decoration: pw.BoxDecoration(border: pw.Border.all()),
//                         child: pw.ListView.builder(
//                           itemCount: 3,
//                           itemBuilder: (context, index) {
//                             return pw.Padding(
//                               padding:
//                                   const pw.EdgeInsets.symmetric(vertical: 5),
//                               child: pw.Container(
//                                   width: 60,
//                                   child: pw.Center(
//                                       child: pw.Text("2.665",
//                                           style: pw.TextStyle(
//                                             fontSize: 6,
//                                             fontWeight: pw.FontWeight.normal,
//                                             color: PdfColors.black,
//                                           )))),
//                             );
//                           },
//                         )),
//                     pw.Container(
//                         decoration: pw.BoxDecoration(border: pw.Border.all()),
//                         child: pw.ListView.builder(
//                           itemCount: 3,
//                           itemBuilder: (context, index) {
//                             return pw.Padding(
//                               padding:
//                                   const pw.EdgeInsets.symmetric(vertical: 5),
//                               child: pw.Container(
//                                   width: 80,
//                                   child: pw.Center(
//                                       child: pw.Text(
//                                           "hjvgjhcvyfctghfhgjyghfjtyjut",
//                                           style: pw.TextStyle(
//                                             fontSize: 6,
//                                             fontWeight: pw.FontWeight.normal,
//                                             color: PdfColors.black,
//                                           )))),
//                             );
//                           },
//                         )),
//                   ])),
//                   pw.Container(
//                       child: pw.Row(children: [
//                     pw.Container(
//                         height: 20,
//                         width: 290,
//                         decoration: pw.BoxDecoration(
//                           border: pw.Border.all(),
//                         ),
//                         child: pw.Center(
//                             child: pw.Text("Sub Total",
//                                 style: pw.TextStyle(
//                                   fontSize: 8,
//                                   fontWeight: pw.FontWeight.bold,
//                                   color: PdfColors.red,
//                                 )))),
//                     pw.Container(
//                         height: 20,
//                         width: 30,
//                         decoration: pw.BoxDecoration(
//                           border: pw.Border.all(),
//                         ),
//                         child: pw.Center(
//                             child: pw.Text("8",
//                                 style: pw.TextStyle(
//                                   fontSize: 8,
//                                   fontWeight: pw.FontWeight.bold,
//                                   color: PdfColors.red,
//                                 )))),
//                     pw.Container(
//                         height: 20,
//                         width: 40,
//                         decoration: pw.BoxDecoration(
//                           border: pw.Border.all(),
//                         ),
//                         child: pw.Center(
//                             child: pw.Text("",
//                                 style: pw.TextStyle(
//                                   fontSize: 8,
//                                   fontWeight: pw.FontWeight.bold,
//                                   fontStyle: pw.FontStyle.italic,
//                                   color: PdfColors.black,
//                                 )))),
//                     pw.Container(
//                         height: 20,
//                         width: 60,
//                         decoration: pw.BoxDecoration(
//                           border: pw.Border.all(),
//                         ),
//                         child: pw.Center(
//                             child: pw.Text("28,00",
//                                 style: pw.TextStyle(
//                                   fontSize: 8,
//                                   fontWeight: pw.FontWeight.bold,
//                                   color: PdfColors.red,
//                                 )))),
//                     pw.Container(
//                         height: 20,
//                         width: 80,
//                         child: pw.Center(
//                             child: pw.Text("",
//                                 style: pw.TextStyle(
//                                   fontSize: 8,
//                                   fontWeight: pw.FontWeight.bold,
//                                   fontStyle: pw.FontStyle.italic,
//                                   color: PdfColors.black,
//                                 )))),
//                   ])),
//                 ]));