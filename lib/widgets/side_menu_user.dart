import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/side_menu_item.dart';

class SideMenuUser extends StatefulWidget {
  const SideMenuUser({super.key});

  @override
  State<SideMenuUser> createState() => _SideMenuUserState();
}

bool dropdownMasterData = false;
bool dropDownOrder = false;
bool dropDownOffLoading = false;
bool dropDownReport = false;

class _SideMenuUserState extends State<SideMenuUser> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: light,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(4, 12), // changes position of shadow
          ),
        ],
      ),
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
          Column(mainAxisSize: MainAxisSize.min, children: [
            SideMenuItem(
              itemName: "Home",
              dropp: false,
              onTap: () {
                if (!menuController.isActive("Home")) {
                  menuController.changeActiveitemTo("Home");
                  if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                  navigationController.navigateTo(HomePageRoute);
                }
              },
            ),
            SideMenuItem(
              itemName: "Inventory",
              dropp: false,
              onTap: () {
                if (!menuController.isActive("Inventory")) {
                  menuController.changeActiveitemTo("Inventory");
                  if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                  navigationController.navigateTo(InventoryPageRoute);
                }
              },
            ),
            SideMenuItem(
              itemName: "Report",
              dropp: true,
              activess: dropDownReport,
              onTap: () {
                setState(() {
                  dropDownReport = !dropDownReport;
                });
              },
            ),
            dropDownReport
                ? Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: _width,
                      decoration:
                          BoxDecoration(color: lightGrey.withOpacity(0.10)),
                      child: Column(
                        children: [
                          SideMenuItem(
                            itemName: "Cable Report",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Cable Report")) {
                                menuController
                                    .changeActiveitemTo("Cable Report");
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController
                                    .navigateTo(CableReportPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Non Cable Report",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController
                                  .isActive("Non Cable Report")) {
                                menuController
                                    .changeActiveitemTo("Non Cable Report");
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController
                                    .navigateTo(NonCableReportPageRoute);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            SideMenuItem(
              itemName: "Log Out",
              dropp: false,
              onTap: () {
                if (AuthenticationPageRoute == AuthenticationPageRoute) {
                  menuController.changeActiveitemTo(HomePageDisplayName);
                  Get.offAllNamed(AuthenticationPageRoute);
                }
              },
            ),
          ]),
        ],
      ),
    );
  }
}
