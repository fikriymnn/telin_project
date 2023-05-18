import 'package:flutter/material.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/large_screen.dart';
import 'package:telin_project/widgets/small_screen.dart';
import 'package:telin_project/widgets/top_nav.dart';

import 'widgets/side_menu.dart';

class SiteLayout extends StatefulWidget {
  const SiteLayout({super.key});

  @override
  State<SiteLayout> createState() => _SiteLayoutState();
}

class _SiteLayoutState extends State<SiteLayout> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
