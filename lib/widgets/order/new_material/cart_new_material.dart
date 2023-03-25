import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/order/loading/table/table_cable_cart.dart';
import 'package:telin_project/widgets/order/loading/table/table_non_cable_cart.dart';
import 'package:telin_project/widgets/order/new_material/table/table_cart_new_cable.dart';
import 'package:telin_project/widgets/order/new_material/table/table_cart_new_material.dart';

class CartNewMaterial extends StatefulWidget {
  const CartNewMaterial({super.key});

  @override
  State<CartNewMaterial> createState() => _CartNewMaterialState();
}

class _CartNewMaterialState extends State<CartNewMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.6),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19.3, vertical: 12.6),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xFFED1D25),
                              child: Center(
                                child: Text("X",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                      height: 400,
                      child: Column(
                        children: [
                          Flexible(child: TableCartNewCable()),
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 250,
                    child: Column(
                      children: [
                        Expanded(child: TableNonCableNewCart()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
