import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_cable_large.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_cable_mobile.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_cable_small.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_noncable_large.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_noncable_mobile.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_noncable_small.dart';
import 'package:telin_project/widgets/order/new_material/cart_new_material.dart';

class AddnewMaterialScreens extends StatefulWidget {
  const AddnewMaterialScreens({super.key});

  @override
  State<AddnewMaterialScreens> createState() => _AddnewMaterialScreensState();
}

class _AddnewMaterialScreensState extends State<AddnewMaterialScreens> {
  bool selectButon = true;
  bool selectNonCable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("New Material",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 23.3,
                          color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.only(right: 59.3, top: 32),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 107.3,
                          height: 37.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color(0xffB8B8B8), width: 1)),
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
                              return const CartNewMaterial();
                            });
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: active,
                      )),
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
                ? const ResponsiveWidget(
                    largeScreen: AddNewCableLarge(),
                    smallScreen: AddNewCableSmall(),
                    mobileScreen: AddNewCableMobile(),
                  )
                : const ResponsiveWidget(
                    largeScreen: AddNewNonCableLarge(),
                    smallScreen: AddNewNonCableSmall(),
                    mobileScreen: AddNewNonCableMobile(),
                  )
          ],
        ),
      ),
    );
  }
}
