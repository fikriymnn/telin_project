import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/layout.dart';
import 'package:telin_project/routing/routes.dart';

import 'package:telin_project/widgets/depo/depo_widget.dart';

class DepoMedium extends StatefulWidget {
  const DepoMedium({super.key, required this.role});
  final String role;

  @override
  State<DepoMedium> createState() => _DepoMediumState();
}

class _DepoMediumState extends State<DepoMedium> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: screenSize.width,
          height: 302,
          color: active,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 193,
                height: 59,
                margin: const EdgeInsets.only(top: 20, left: 148),
                child: Image.asset(
                  'assets/images/logo_telin_white.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 86.6),
                  child: Text('Site Management Dashboard',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.rubik(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 66.6,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 162),
                  child: SizedBox(
                    width: screenSize.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DepoWidget(
                          screenSize: screenSize,
                          site: "Batam Site",
                          depo: "Depo Sarana Citranusa Kabil-Batam",
                          route: () {},
                          titleView: "Coming Soon",
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        DepoWidget(
                          screenSize: screenSize,
                          site: "Makasar Site",
                          depo: "Depo 104-Pelindo IV Makassar",
                          route: () {
                            // Get.offAllNamed(RootRoute);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SiteLayout(
                                          role: widget.role,
                                        )));
                          },
                          titleView: "View Dasboard >",
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
