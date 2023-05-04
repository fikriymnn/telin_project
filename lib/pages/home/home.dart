import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/home/chart/chart.dart';

import 'package:telin_project/widgets/home/table_home/table_cable_medium.dart';
import 'package:telin_project/widgets/home/table_home/table_home.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_home.png'),
                      fit: BoxFit.fill)),
              height: 380,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ChartData(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(bottom: 20),
                height: 700,
                child: Column(
                  children: const [
                    Expanded(
                        child: ResponsiveWidget(
                      largeScreen: TableHome(),
                    )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
