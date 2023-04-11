import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';

import 'package:telin_project/widgets/depo/depo_widget_large.dart';

import '../widgets/depo/depo_widget_medium.dart';
import '../widgets/depo/depo_widget_small.dart';

class Depo extends StatefulWidget {
  const Depo({super.key});

  @override
  State<Depo> createState() => _DepoState();
}

class _DepoState extends State<Depo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveWidget(
        largeScreen: DepoLarge(),
        smallScreen: DepoSmall(),
      ),
    );
  }
}
