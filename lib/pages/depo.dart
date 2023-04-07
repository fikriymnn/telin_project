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
  final token;
  const Depo({super.key, this.token});

  @override
  State<Depo> createState() => _DepoState();
}

class _DepoState extends State<Depo> {
  late String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    username = jwtDecodedToken['username'];
  }

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
