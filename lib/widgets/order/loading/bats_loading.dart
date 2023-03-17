import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/bast_widget.dart';
import 'package:telin_project/widgets/invoice_new.dart';

class BastLoading extends StatefulWidget {
  const BastLoading({super.key});

  @override
  State<BastLoading> createState() => _BastLoadingState();
}

class _BastLoadingState extends State<BastLoading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_depo.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 59.3, top: 32),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 107.3,
                            height: 37.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(0xffB8B8B8), width: 1)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.subdirectory_arrow_left,
                                  color: active,
                                  size: 28.6,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Back",
                                  style: GoogleFonts.roboto(
                                    fontSize: 17.3,
                                    fontWeight: FontWeight.w400,
                                    color: active,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveWidget(
              largeScreen: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Invoice(),
                      SizedBox(
                        width: 205,
                      ),
                      BastWidget(
                        title: "BAST-Loading",
                        noBast: "004/BAST-LOADING/WEB/XII/2022",
                        projectName: "REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
                      )
                    ],
                  ),
                ),
              ),
              smallScreen: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Invoice(),
                      SizedBox(
                        height: 100,
                      ),
                      BastWidget(
                        title: "BAST-Loading",
                        noBast: "004/BAST-LOADING/WEB/XII/2022",
                        projectName: "REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
