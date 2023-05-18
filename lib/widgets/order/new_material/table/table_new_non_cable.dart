import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';


class TableNewNonCable extends StatefulWidget {
  const TableNewNonCable({super.key});

  @override
  State<TableNewNonCable> createState() => _TableNewNonCableState();
}

class _TableNewNonCableState extends State<TableNewNonCable> {
  late List<NewNonCable> newNonCable;
  List<NewNonCable> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    newNonCable = NewNonCable.getNewNonCable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 30,
        border: const TableBorder(top: BorderSide(), bottom: BorderSide()),
        showBottomBorder: false,
        columns: [
          DataColumn2(
            label: Text(
              'No',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Text(
              "Date",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Text(
              'itemName',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Text(
              'Location',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Text(
              'weight',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Text(
              'qty',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Text(
              "system",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Text(
              " ",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn2(
            label: Text(
              " ",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
        rows: _createRowsArmoring());
  }

  List<DataRow> _createRowsArmoring() {
    return newNonCable
        .map((newNonCable) => DataRow(cells: [
              DataCell(Text(newNonCable.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(newNonCable.date,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(newNonCable.itemName,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(newNonCable.location,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(newNonCable.weight,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(newNonCable.qty,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(newNonCable.system,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BastNewMaterial()));
                  },
                  child: Text("detail..",
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )))),
              DataCell(
                InkWell(
                  onTap: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                      text: 'Do you sure to delete this item',
                      confirmBtnText: 'Yes',
                      cancelBtnText: 'No',
                      customAsset: 'assets/gift/error.gif',
                      width: 400,
                      confirmBtnColor: Colors.green,
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 19.46,
                    decoration: BoxDecoration(
                        color: active, borderRadius: BorderRadius.circular(6)),
                    child: Center(
                        child: Text("Delete",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ))),
                  ),
                ),
              )
            ]))
        .toList();
  }
}

class NewNonCable {
  final String no,
      itemName,
      location,
      partNumber,
      serialNumber,
      weight,
      qty,
      system,
      unit,
      evidence,
      remark,
      date;

  const NewNonCable(
      {required this.no,
      required this.itemName,
      required this.location,
      required this.partNumber,
      required this.serialNumber,
      required this.weight,
      required this.qty,
      required this.system,
      required this.unit,
      required this.evidence,
      required this.remark,
      required this.date});

  static List<NewNonCable> getNewNonCable() {
    return <NewNonCable>[
      const NewNonCable(
          no: "1",
          itemName: "itemName",
          location: "location",
          partNumber: "partNumber",
          serialNumber: "Serial Number",
          weight: "1000",
          qty: "qty",
          system: "system",
          unit: "-",
          evidence: "evidence",
          remark: "remark",
          date: "06/02/2023"),
      const NewNonCable(
          no: "2",
          itemName: "itemName",
          location: "location",
          partNumber: "partNumber",
          serialNumber: "Serial Number",
          weight: "1000",
          qty: "qty",
          system: "system",
          unit: "-",
          evidence: "evidence",
          remark: "remark",
          date: "06/02/2023"),
      const NewNonCable(
          no: "3",
          itemName: "itemName",
          location: "location",
          partNumber: "partNumber",
          serialNumber: "Serial Number",
          weight: "1000",
          qty: "qty",
          system: "system",
          unit: "-",
          evidence: "evidence",
          remark: "remark",
          date: "06/02/2023"),
      const NewNonCable(
          no: "4",
          itemName: "itemName",
          location: "location",
          partNumber: "partNumber",
          serialNumber: "Serial Number",
          weight: "1000",
          qty: "qty",
          system: "system",
          unit: "-",
          evidence: "evidence",
          remark: "remark",
          date: "06/02/2023"),
      const NewNonCable(
          no: "5",
          itemName: "itemName",
          location: "location",
          partNumber: "partNumber",
          serialNumber: "Serial Number",
          weight: "1000",
          qty: "qty",
          system: "system",
          unit: "-",
          evidence: "evidence",
          remark: "remark",
          date: "06/02/2023"),
      const NewNonCable(
          no: "6",
          itemName: "itemName",
          location: "location",
          partNumber: "partNumber",
          serialNumber: "Serial Number",
          weight: "1000",
          qty: "qty",
          system: "system",
          unit: "-",
          evidence: "evidence",
          remark: "remark",
          date: "06/02/2023"),
    ];
  }
}
