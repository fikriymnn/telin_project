
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/home/chart/chart.dart';

import 'package:telin_project/widgets/home/table_home/table_cable_medium.dart';
import 'package:telin_project/widgets/home/table_home/table_home.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background_home.png'),fit: BoxFit.fill)),
              height: 327.6,
              child: const ResponsiveWidget(
                largeScreen: Padding(
               padding:  EdgeInsets.only(left: 146, right: 146),
                child: ChartData(),
              ),
              mediumScreen:  Padding(
               padding:  EdgeInsets.only(left: 90, right: 90),
                child: ChartData(),
              ),
              )
              
            ),
            const SizedBox(height: 50,),
             Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 20),
              height: 700,
              child: Column(
                children:const [

                   Expanded(
                    child:ResponsiveWidget(largeScreen:  TableHome(),)
                     
                    ),
                ],
              )),
            
          ],
        ),
      ),
    );
  }
}
