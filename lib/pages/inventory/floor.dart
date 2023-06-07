import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/inventory/rak/rak_a1.dart';

class FloorInventory extends StatelessWidget {
  const FloorInventory({super.key});

  @override
  Widget build(BuildContext context) {
    var screnSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: screnSize.width,
        height: screnSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_login_full.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: screnSize.width,
            height: screnSize.height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'FLOOR',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: screnSize.height,
                      width: screnSize.width,
                      child: const TableRakA1()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
