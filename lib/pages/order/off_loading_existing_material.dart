import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

import '../../widgets/order/existing_material.dart/table/table_existing.dart';

class OffLoadingExistingScreens extends StatelessWidget {
  const OffLoadingExistingScreens({super.key});

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
                      Text("OFF LOADING > EXISTING MATERIAL",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: light, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TableExistingMaterial(),
                ),
              )

              // const SizedBox(
              //   height: 50,
              // ),
              // const Expanded(child: TableSystem())
            ],
          ),
        ),
      ),
    );

    //  Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 24),
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 24),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 "Existing Material",
    //                 style: GoogleFonts.montserrat(
    //                   fontSize: 23.3,
    //                   fontWeight: FontWeight.w500,
    //                   color: Colors.black,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         const Expanded(child: )
    //       ],
    //     ),
    //   ),
    // );
  }
}
