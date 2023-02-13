import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/pages/layout.dart';
import 'package:telin_project/widgets/depo/depo_widget.dart';

class DepoLarge extends StatelessWidget {
  const DepoLarge({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return  Column(
        children: [
          Container(
            width: screenSize.width,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 359,
                  height: 110,
                  margin: const EdgeInsets.only(top: 20, left: 50),
                  child: Image.asset(
                    'assets/images/logo_telin_login.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 236),
                    child: Text('Site Management Dasboard',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Divider(
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
              child: Container(
                width: screenSize.width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 130),
                      child: Text('Choose Your Site !',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: screenSize.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DepoWidget(
                            screenSize: screenSize,
                            site: "Batam Site",
                            depo: "Depo Sarana Citranusa Kabil-Batam",
                            route: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SiteLayout()));
                            },
                          ),
                          SizedBox(
                            width: 300,
                          ),
                          DepoWidget(
                            screenSize: screenSize,
                            site: "Makasar Site",
                            depo: "Depo 104-Pelindo IV Makassar",
                            route: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
   
  }
}