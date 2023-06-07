import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

class DepoWidget extends StatelessWidget {
  const DepoWidget({
    super.key,
    required this.screenSize,
    required this.site,
    required this.depo,
    required this.route,
    required this.titleView,
  });

  final Size screenSize;
  final String site;
  final String depo;
  final String titleView;
  final Function route;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329.3,
      height: 184,
      decoration: BoxDecoration(
          color: const Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 25,
                offset: const Offset(0, 4))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(6.6),
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: 124.6,
              decoration: BoxDecoration(
                  color: light,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(site,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(depo,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 13.3,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 3.3,
            ),
            Container(
              width: screenSize.width,
              height: 42,
              decoration: BoxDecoration(
                  color: light,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      route();
                    },
                    child: Container(
                      height: 30.6,
                      width: 92.6,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEC1D26),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(titleView,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.rubik(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
