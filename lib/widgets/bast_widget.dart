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
      width: 329.3,
      height: 226,
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
                padding: const EdgeInsets.only(left: 10, top: 15),
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
                    const SizedBox(
                      height: 5,
                    ),
                    Text(noBast,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 13.3,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 5,
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
            const SizedBox(
              height: 3.3,
            ),
            Container(
              width: screenSize.width,
              height: 84,
              decoration: BoxDecoration(
                  color: light,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      onClick();
                    },
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
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                width: 300,
                                height: 232,
                                decoration: BoxDecoration(
                                    color: light,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 175,
                                      height: 150,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add_circle,
                                            color: active,
                                            size: 100,
                                          )),
                                    ),
                                    Text("ADD FILE",
                                        style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      height: 30.6,
                      width: 123,
                      decoration: BoxDecoration(
                        color: const Color(0xFF69DF5F),
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
