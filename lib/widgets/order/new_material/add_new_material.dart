import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_cable_large.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_cable_mobile.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_cable_small.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_noncable_large.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_noncable_mobile.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_noncable_small.dart';
import 'package:telin_project/widgets/order/new_material/bast_invoice/bast_new_material.dart';
import 'package:telin_project/widgets/order/new_material/cart_new_material.dart';

class AddnewMaterialScreens extends StatefulWidget {
  const AddnewMaterialScreens({super.key, required this.idNewMaterial});
  final String idNewMaterial;

  @override
  State<AddnewMaterialScreens> createState() => _AddnewMaterialScreensState();
}

class _AddnewMaterialScreensState extends State<AddnewMaterialScreens> {
  bool selectButon = true;
  bool selectNonCable = false;
  Response? response;

  var dio = Dio();

  void submitDataNewMaterial(id) async {
    var msg;
    try {
      response = await dio.post('$submitNewMaterial/$id');

      msg = response!.data['message'];

      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Data New Material Success Added',
          title: 'Peringatan',
          width: 400,
          barrierDismissible: true,
          confirmBtnColor: Colors.red);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BastNewMaterial(
                    idNewMaterial: widget.idNewMaterial,
                  )));
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("New Material",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 23.3,
                          color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectButon = true;
                      });
                    },
                    child: Text("Cable",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 26.6,
                            color: selectButon ? active : dark)),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectButon = false;
                      });
                    },
                    child: Text("Non Cable",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 26.6,
                            color: selectButon ? dark : active)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 59.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CartNewMaterial(
                                idNewMaterial: widget.idNewMaterial,
                              );
                            });
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: active,
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      submitDataNewMaterial(widget.idNewMaterial);
                    },
                    child: Container(
                      width: 99.3,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: active),
                      child: Center(
                        child: Text("SUBMIT",
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            selectButon
                ? ResponsiveWidget(
                    largeScreen:
                        AddNewCableLarge(idNewMaterial: widget.idNewMaterial),
                    smallScreen:
                        AddNewCableLarge(idNewMaterial: widget.idNewMaterial),
                    mobileScreen:
                        AddNewCableLarge(idNewMaterial: widget.idNewMaterial),
                  )
                : ResponsiveWidget(
                    largeScreen: AddNewNonCableLarge(
                        idNewMaterial: widget.idNewMaterial),
                    smallScreen: AddNewNonCableLarge(
                        idNewMaterial: widget.idNewMaterial),
                    mobileScreen: AddNewNonCableLarge(
                        idNewMaterial: widget.idNewMaterial),
                  )
          ],
        ),
      ),
    );
  }
}
