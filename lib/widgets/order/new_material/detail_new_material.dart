import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';

import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';
import 'package:telin_project/widgets/order/new_material/table/detail_cable_new_material.dart';
import 'package:telin_project/widgets/order/new_material/table/detail_kit_new_material.dart';

class DetailNewMaterial extends StatefulWidget {
  const DetailNewMaterial({super.key, required this.idNewMaterial});
  final String idNewMaterial;

  @override
  State<DetailNewMaterial> createState() => _DetailNewMaterialState();
}

class _DetailNewMaterialState extends State<DetailNewMaterial> {
  dynamic NewMaterialById;

  List NewMaterialByIdCable = [];
  List NewMaterialByIdKit = [];

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
      response = await dio.get('$getNewMaterialById/${widget.idNewMaterial}');

      setState(() {
        NewMaterialById = response!.data['newMaterial'];

        // NewMaterialByIdCable =
        //     response!.data['newMaterial']['submitted_new_material_cables_id_in_spare_cable'];
        // NewMaterialByIdKit =
        //     response!.data['newMaterial']['submitted_new_material_kits_id_in_spare_kits'];
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.3),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("OFF LOADING > NEW MATERIAL",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.black)),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BastNewMaterial(
                                            idNewMaterial: widget.idNewMaterial,
                                          )));
                            },
                            child: Container(
                              width: 148,
                              height: 33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: active),
                              child: Center(
                                child: Text("BAST",
                                    style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: light)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 21,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 148,
                                height: 33,
                                decoration: BoxDecoration(
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
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: light, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 62,
                      decoration: BoxDecoration(
                        color: active,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "${NewMaterialById[0]['project_name'] ?? "-"}",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: light,
                                    )),
                                Container(
                                  width: 124,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: light),
                                  child: Center(
                                    child: Text("Status",
                                        style: GoogleFonts.rubik(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue,
                                        )),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    "${NewMaterialById[0]['from'] ?? ""} - ${NewMaterialById[0]['to'] ?? ""}",
                                    style: GoogleFonts.rubik(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: light,
                                    )),
                                Text(
                                    "${NewMaterialById[0]['perusahaan']["company_name"] ?? "-"}",
                                    style: GoogleFonts.rubik(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: light,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text("CABLE",
                                  style: GoogleFonts.rubik(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: active,
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: DetailTableCableNewMaterial(
                                idNewMaterial: widget.idNewMaterial,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text("NON-CABLE",
                                  style: GoogleFonts.rubik(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: active,
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: DetailTableKitNewMaterial(
                                idNewMaterial: widget.idNewMaterial,
                              ),
                            ),
                          ],
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
    );
  }
}
