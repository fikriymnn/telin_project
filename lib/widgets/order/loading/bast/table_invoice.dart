import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_perusahaan.dart';
import 'package:telin_project/widgets/order/loading/bats_loading.dart';

import 'package:telin_project/widgets/order/loading/form/edit_form_loading.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableInvoiceLoadingPrint extends StatefulWidget {
  const TableInvoiceLoadingPrint({super.key});

  @override
  State<TableInvoiceLoadingPrint> createState() => _TableInvoiceLoadingPrintState();
}

class _TableInvoiceLoadingPrintState extends State<TableInvoiceLoadingPrint> {
  late List<Invoice> invoice;
  List<Invoice> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    invoice = Invoice.getInvoice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        
        
        dataRowHeight: 20,
        minWidth: 3000,
        border: TableBorder.all(width: 2),
        columns: [
          DataColumn2(
              label: Center(
                child: Text(
                  'No',
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              fixedWidth: 30),
          DataColumn2(
              label: Center(
                child: Text('Description',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 70),
          DataColumn2(
              label: Center(
                child: Text('Model/Part No',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 70),
          DataColumn2(
              label: Center(
                child: Text('Lenght (Km)',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 70),
          DataColumn2(
              label: Center(
                child: Text('QTY (Box)',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 80),
          DataColumn2(
              label: Center(
                child: Text('Weight (Kg)',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 80),
          DataColumn2(

              label: Text(
                "Unit Price (USD)",
                style: GoogleFonts.montserrat(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              fixedWidth: 90),

          DataColumn2(
              label: Text(
                "Total Price (USD)",
                style: GoogleFonts.montserrat(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 90),
          DataColumn2(
              label: Center(
                child: Text('Unit Price (IDR)',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 90),
              DataColumn2(
              label: Center(
                child: Text('Total Price (IDR)',
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              fixedWidth: 90),
          // const DataColumn2(
          //   label: Text(''),
          //   fixedWidth: 150
          // ),
        ],
        rows: _createRowsManufacture());
  }

  List<DataRow> _createRowsManufacture() {
    return invoice
        .map((invoice) => DataRow(cells: [
              DataCell(Text(invoice.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Center(
                child: Text(invoice.description,
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              )),
              DataCell(

                Text(invoice.model,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(invoice.lenght,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(invoice.qty,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(invoice.weight,
                  style: GoogleFonts.montserrat(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(
                Text(invoice.priceUsd,
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              ),

              DataCell(Text(invoice.totalPriceUsd,
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),),
              DataCell(
                Text(invoice.priceIdr,
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ))
              ),
              DataCell(
                Text(invoice.totalPriceIdr,
                    style: GoogleFonts.montserrat(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ))
              )
            ]))
        .toList();
  }
}

class Invoice {
  final String no, description, model, lenght, qty, weight,priceUsd,totalPriceUsd,priceIdr,totalPriceIdr;

  const Invoice(
      {required this.no,
      required this.description,
      required this.model,
      required this.qty,
      required this.lenght,
      required this.weight,
      required this.priceUsd,
      required this.totalPriceUsd,
      required this.priceIdr,
      required this.totalPriceIdr});

  static List<Invoice> getInvoice() {
    return <Invoice>[
      const Invoice(
          no: "1",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
      const Invoice(
          no: "2",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
          const Invoice(
          no: "3",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
          const Invoice(
          no: "4",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
          const Invoice(
          no: "5",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
          const Invoice(
          no: "6",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
          const Invoice(
          no: "7",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
          const Invoice(
          no: "8",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
          const Invoice(
          no: "9",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
          const Invoice(
          no: "10",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
          const Invoice(
          no: "11",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
          const Invoice(
          no: "12",
          description: "OCC-SC500",
          model: "-",
          qty: "-",
          totalPriceUsd: "11.748,77",
          weight: "365,85",
          lenght: "2,439",
          priceIdr: "71.788.404",
          priceUsd: "4.817,044",
          totalPriceIdr: "175.091.917"
          ),
      
    ];
  }
}
