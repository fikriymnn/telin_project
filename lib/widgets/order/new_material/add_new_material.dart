import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_cable_large.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_cable_mobile.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_cable_small.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_noncable_large.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_noncable_mobile.dart';
import 'package:telin_project/widgets/order/new_material/add_item/add_new_noncable_small.dart';


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
            Container(
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
                                  color: Color(0xffB8B8B8), width: 1)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.subdirectory_arrow_left,
                                color: active,
                                size: 28.6,
                              ),
                              SizedBox(
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
            SizedBox(
              height: 20,
            ),
            Container(
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
                  SizedBox(
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
            SizedBox(height: 50,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 59.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                            onPressed: () {
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return CartLoading();
                              //     });
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: active,
                            )),
                            SizedBox(width: 40,),
                             InkWell(
                          onTap: () {},
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
                        )
              ],
            ),
            ),
            SizedBox(
              height: 70,
            ),
            selectButon
                ? ResponsiveWidget(
                    largeScreen: AddNewCableLarge(),
                    smallScreen: AddNewCableSmall(),
                    mobileScreen: AddNewCableMobile(),
                  )
                : ResponsiveWidget(
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
