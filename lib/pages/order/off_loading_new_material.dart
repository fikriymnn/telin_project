import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/order/add_new_cable_large.dart';
import 'package:telin_project/widgets/order/add_new_cable_mobile.dart';
import 'package:telin_project/widgets/order/add_new_cable_small.dart';
import 'package:telin_project/widgets/order/add_new_noncable_large.dart';
import 'package:telin_project/widgets/order/add_new_noncable_small.dart';

import '../../widgets/order/add_new_noncable_mobile.dart';

class OffLoadingNewMatrial extends StatefulWidget {
  const OffLoadingNewMatrial({super.key});

  @override
  State<OffLoadingNewMatrial> createState() => _OffLoadingNewMatrialState();
}

class _OffLoadingNewMatrialState extends State<OffLoadingNewMatrial> {
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
                            color: selectButon? active:dark)),
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
                            color:selectButon?dark: active)),
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
