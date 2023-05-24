import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/layout.dart';

import 'package:telin_project/widgets/depo/depo_widget.dart';

import '../../routing/routes.dart';

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
    return Column(
      children: [
        SizedBox(
          width: screenSize.width,
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 239.3,
                height: 73.3,
                margin: const EdgeInsets.only(left: 30),
                child: Image.asset(
                  'assets/images/logo_telin_login.png',
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text('Site Management Dasboard',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.rubik(
                        fontSize: 26.6,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 10,
          color: Colors.black,
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background_depo.png"),
                    fit: BoxFit.fill)),
            child: SizedBox(
              width: screenSize.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 130),
                      child: Text('Choose Your Site !',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 66.6,
                    ),
                    SizedBox(
                      width: screenSize.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DepoWidget(
                            screenSize: screenSize,
                            site: "Batam Site",
                            depo: "Depo Sarana Citranusa Kabil-Batam",
                            route: () {},
                            titleView: "Coming Soon",
                          ),
                          const SizedBox(
                            height: 66.6,
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
                            titleView: "View Dasboard",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
