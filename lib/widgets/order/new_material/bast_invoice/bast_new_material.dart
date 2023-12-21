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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_depo.png'),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 59.3, top: 32),
                        child: InkWell(
                            onTap: () {
                              navigationController
                                  .navigateTo(NewMaterialPageRoute);
                            },
                            child: Container(
                              width: 107.3,
                              height: 37.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xffB8B8B8),
                                      width: 1)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.subdirectory_arrow_left,
                                    color: active,
                                    size: 28.6,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Back",
                                    style: GoogleFonts.roboto(
                                      fontSize: 17.3,
                                      fontWeight: FontWeight.w400,
                                      color: active,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveWidget(
                largeScreen: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BastWidget(
                          title: "BAST-Off Loading (New Material)",
                          noBast: NewMaterialById[0]['no_bast'],
                          projectName: NewMaterialById[0]['project_name'],
                          onClick: () {
                            printBastNewMaterial().BastNewMaterialPrinttt(
                                NewMaterialByIdCable,
                                NewMaterialByIdKits,
                                NewMaterialById);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                smallScreen: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BastWidget(
                          title: "BAST-Off Loading (New Material)",
                          noBast: "004/BAST-OFF-Loading/WEB/XII/2022",
                          projectName:
                              "REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
                          onClick: () {
                            printBastNewMaterial().BastNewMaterialPrinttt(
                                NewMaterialByIdCable,
                                NewMaterialByIdKits,
                                NewMaterialById);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
