import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/pages/order/off_loading_existing_material.dart';
import 'package:telin_project/widgets/bast_widget.dart';
import 'package:telin_project/widgets/invoice_new.dart';

class BastOffLoading extends StatefulWidget {
  const BastOffLoading({super.key});

  @override
  State<BastOffLoading> createState() => _BastOffLoadingState();
}

class _BastOffLoadingState extends State<BastOffLoading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_depo.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 59.3, top: 32),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const OffLoadingExistingScreens()));
                          },
                          child: Container(
                            width: 107.3,
                            height: 37.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: const Color(0xffB8B8B8), width: 1)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.subdirectory_arrow_left,
                                  color: active,
                                  size: 28.6,
                                ),
                                const SizedBox(
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
                padding: const EdgeInsets.only(top: 150),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Invoice(),
                      const SizedBox(
                        width: 205,
                      ),
                      BastWidget(
                        title: "BAST- Off Loading ( Existing Material)",
                        noBast: "004/BAST-OFF-LOADING/WEB/XII/2022",
                        projectName: "REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
                        onClick: (){},
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
                      const Invoice(),
                      const SizedBox(
                        height: 100,
                      ),
                      BastWidget(
                        title: "BAST- Off Loading ( Existing Material)",
                        noBast: "004/BAST-OFF-LOADING/WEB/XII/2022",
                        projectName: "REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
                        onClick: (){},
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
