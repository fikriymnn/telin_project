import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                SizedBox(width: _width / 48),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset("assets/images/logo_telin_top_nav.png"),
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: CustomText(
                    text: "SPARE MANAGEMENT DEPO MAKASSAR",
                    size: 12,
                    fontWeight: FontWeight.bold,
                    color: dark,
                  ),
                ),
                SizedBox(width: _width / 48),
              ],
            ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map(
                  (itemName) => SideMenuItem(
                    itemName: itemName == AuthenticationPageRoute
                        ? "LogOut"
                        : itemName,
                    onTap: () {
                      if (itemName == AuthenticationPageRoute) {
                        // TODO:: go to login screen
                      }

                      if (!menuController.isActive(itemName)) {
                        menuController.changeActiveitemTo(itemName);
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        navigationController.navigateTo(itemName);
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
