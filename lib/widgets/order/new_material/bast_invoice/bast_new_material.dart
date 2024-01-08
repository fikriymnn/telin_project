import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/bast_widget.dart';
import 'package:telin_project/widgets/invoice_new.dart';
import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_print.dart';

import '../../../../api/configAPI.dart';
import '../../../../constants/controllers.dart';

class BastNewMaterial extends StatefulWidget {
  const BastNewMaterial({super.key, required this.idNewMaterial});
  final String idNewMaterial;

  @override
  State<BastNewMaterial> createState() => _BastNewMaterialState();
}

class _BastNewMaterialState extends State<BastNewMaterial> {
  List NewMaterialById = [];
  List NewMaterialByIdCable = [];
  List NewMaterialByIdKits = [];
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
        NewMaterialById = response!.data['newMaterial'];
        NewMaterialByIdCable = response!.data['newMaterial'][0]
            ['submitted_new_material_cables_id_in_spare_cable'];
        NewMaterialByIdKits = response!.data['newMaterial'][0]
            ['submitted_new_material_kits_id_in_spare_kits'];
      });
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgGray,
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 171,
              color: Color(0xffC70D14),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LOADING SUBMITTED",
                          style: GoogleFonts.roboto(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: light,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 148,
                              height: 33,
                              decoration: BoxDecoration(
                                //border: Border.all(color: active, width: 1),
                                color: light,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  "< Back",
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: active,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  BastWidget(
                    title: "BAST-Off Loading (New Material)",
                    noBast: NewMaterialById.isEmpty
                        ? "-"
                        : NewMaterialById[0]['no_bast'],
                    projectName: NewMaterialById.isEmpty
                        ? "-"
                        : NewMaterialById[0]['project_name'],
                    onClick: () {
                      printBastNewMaterial().BastNewMaterialPrinttt(
                          NewMaterialByIdCable,
                          NewMaterialByIdKits,
                          NewMaterialById);
                    },
                  )
                ],
              ),
            )
          ],
        )));
  }
}
