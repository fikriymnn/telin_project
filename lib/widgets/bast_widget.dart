import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

class BastWidget extends StatelessWidget {
  final String title, projectName, noBast;
  const BastWidget(
      {super.key,
      required this.title,
      required this.projectName,
      required this.noBast});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: 329.3,
      height: 226,
      decoration: BoxDecoration(
          color: Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 25,
                offset: Offset(0, 4))
          ]),
      child: Padding(
        padding: EdgeInsets.all(6.6),
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: 124.6,
              decoration: BoxDecoration(
                  color: light,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(noBast,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 13.3,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(projectName,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 13.3,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3.3,
            ),
            Container(
              width: screenSize.width,
              height: 84,
              decoration: BoxDecoration(
                  color: light,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30.6,
                      width: 123,
                      decoration: BoxDecoration(
                        color: active,
                        borderRadius: BorderRadius.circular(6.6),
                      ),
                      child: Center(
                        child: Text('PRINT BAST',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.rubik(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30.6,
                      width: 123,
                      decoration: BoxDecoration(
                        color: Color(0xFF69DF5F),
                        borderRadius: BorderRadius.circular(6.6),
                      ),
                      child: Center(
                        child: Text('UPLOAD EVIDENT',
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