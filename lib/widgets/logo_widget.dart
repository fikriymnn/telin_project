import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 444,
          height: 136,
          child: Image.asset(
            'assets/images/logo_telin_login.png',
            fit: BoxFit.contain,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 33.33, left: 100),
          width: 420,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome To',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )),
              Text('Spare Management',
                  style: GoogleFonts.rubik(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              Text('SKKL TELKOM',
                  style: GoogleFonts.rubik(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
