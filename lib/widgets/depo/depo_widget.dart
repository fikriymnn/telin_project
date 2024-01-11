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
      width: 518,
      height: 204,
      decoration: BoxDecoration(
          color: light,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 9.4,
                offset: const Offset(0, 4))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: screenSize.width,
          height: 204,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(site,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              Text(depo,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.rubik(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 56),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        route();
                      },
                      child: Center(
                        child: Text(titleView,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.rubik(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: active,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
