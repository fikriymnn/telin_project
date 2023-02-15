import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/pages/layout.dart';
import 'package:telin_project/widgets/depo/depo_widget_large.dart';

import '../widgets/depo/depo_widget_medium.dart';
import '../widgets/depo/depo_widget_small.dart';

class Depo extends StatelessWidget {
  const Depo({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      
      body: ResponsiveWidget(
        largeScreen: DepoLarge(),
        mediumScreen: DepoMedium() ,
        smallScreen: DepoSmall(),
        ),
    );
  }
}


