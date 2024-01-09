import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'dart:html' as html;

class DetailTableKitNewMaterial extends StatefulWidget {
  const DetailTableKitNewMaterial(
      {super.key, required this.idNewMaterial, required this.status});
  final String idNewMaterial;
  final String status;

  @override
  State<DetailTableKitNewMaterial> createState() =>
      _DetailTableKitNewMaterialState();
}

class _DetailTableKitNewMaterialState extends State<DetailTableKitNewMaterial> {
  List NewMaterialByIdkit = [];
  List NewMaterialByIdkitCart = [];

  String id = "";
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    id = widget.idNewMaterial;
    getDataNewMaterial();
    super.initState();
  }

  void getDataNewMaterial() async {
    var msg;
    try {
      response = await dio.get('$getNewMaterialById/$id');

      setState(() {
        NewMaterialByIdkit = response!.data['newMaterial'][0]
            ['submitted_new_material_kits_id_in_spare_kits'];
        NewMaterialByIdkitCart =
            response!.data['newMaterial'][0]['new_material_kits'];
      });
    } catch (e) {}
  }

  void hapuskitNewMaterial(id) async {
    bool status;
    var msg;
    try {
      response = await dio.delete(
        '$deleteKitFromNewMaterial/${widget.idNewMaterial}/$id',
      );

      msg = response!.data['message'];

      CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "$msg",
          width: 400,
          onConfirmBtnTap: () {
            getDataNewMaterial();
          });
    } catch (e) {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: "Kesalahan Server",
          width: 400);
    }
  }

  DataRow _resultsAPI(index, data) {
    bool id;
    if ((index + 1) % 2 == 1) {
      id = true;
    } else {
      id = false;
    }
    return DataRow(
        color: MaterialStatePropertyAll(id == true ? activeTable : light),
        cells: [
          DataCell(Text("${index + 1}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['rak_number'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['item_name'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['part_number'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['serial_number'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['system']['system'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['weight_kg'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['qty'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['unit'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(Text("${data['keterangan'] ?? "-"}",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ))),
          DataCell(data['evidence'] != null
              ? TextButton(
                  onPressed: () {
                    downloadEvidenceKitNewMaterial(
                        data['id'], data['evidence']['originalName']);
                  },
                  child: Text("Download evidence",
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: active,
                      )))
              : Text("-",
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
          DataCell(widget.status == "Requested"
              ? TextButton(
                  onPressed: () {
                    CoolAlert.show(
                        context: context,
                        type: CoolAlertType.confirm,
                        text: "Do you sure to delete this item",
                        width: 400,
                        confirmBtnText: "Delete",
                        cancelBtnText: "Cancle",
                        onConfirmBtnTap: () {
                          hapuskitNewMaterial('${data['id']}');
                        });
                  },
                  child: Text("Delete",
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: active,
                      )))
              : Text("",
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: active,
                  ))),
        ]);
  }

  void downloadEvidenceKitNewMaterial(id, name) async {
    bool status;
    var msg;
    String url = "$downloadEvidenceKit/${widget.idNewMaterial}/$id";

    try {
      html.AnchorElement anchorElement = new html.AnchorElement(href: url);
      anchorElement.download = url;
      anchorElement.click();
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: e.toString(),
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 52,
        columns: [
          DataColumn2(
            fixedWidth: 50,
            label: Text('NO',
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            label: Text("LOCATION",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            label: Text("ITEM NAME",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("PART",
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
                Text("NUMBER",
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          DataColumn2(
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("SERIAL",
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
                Text("NUMBER",
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          DataColumn2(
            label: Text("SYSTEM",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("WEIGHT",
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
                Text("(KG)",
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          DataColumn2(
            label: Text("QTY",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            label: Text("UNIT",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            label: Text("REMARK",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            label: Text("EVIDENCE",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          ),
          DataColumn2(
            label: Text("ACTION",
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
          )
        ],
        rows: widget.status == "Requested"
            ? List.generate(
                NewMaterialByIdkitCart.length,
                (index) => _resultsAPI(
                      index,
                      NewMaterialByIdkitCart[index],
                    ))
            : List.generate(NewMaterialByIdkit.length,
                (index) => _resultsAPI(index, NewMaterialByIdkit[index])));
  }
}
