import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

class BastWidget extends StatelessWidget {
  final String title, projectName, noBast;
  final Function onClick;
  const BastWidget(
      {super.key,
      required this.title,
      required this.projectName,
      required this.onClick,
      required this.noBast});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: 518,
      height: 213,
      decoration: BoxDecoration(
          color: const Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 9.4,
                offset: const Offset(0, 4))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                textAlign: TextAlign.start,
                style: GoogleFonts.rubik(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(noBast,
                textAlign: TextAlign.start,
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(projectName,
                textAlign: TextAlign.start,
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    onClick();
                  },
                  child: Container(
                    height: 44,
                    width: 213,
                    decoration: BoxDecoration(
                      color: active,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text('PRINT BAST',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: light,
                          )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
