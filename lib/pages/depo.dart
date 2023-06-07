import 'package:flutter/material.dart';
import 'package:telin_project/helpers/responsive.dart';

import 'package:telin_project/widgets/depo/depo_widget_large.dart';

import '../widgets/depo/depo_widget_small.dart';

class Depo extends StatefulWidget {
  const Depo({super.key, required this.role});
  final String role;

  @override
  State<Depo> createState() => _DepoState();
}

class _DepoState extends State<Depo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        largeScreen: DepoLarge(role: widget.role),
        smallScreen: DepoSmall(role: widget.role),
      ),
    );
  }
}
