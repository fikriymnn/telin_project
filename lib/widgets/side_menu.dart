import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/side_menu_item.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

bool dropdownMasterData = false;

class _SideMenuState extends State<SideMenu> {
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
              itemName: "Master Data",
              dropp: true,
              activess: dropdownMasterData,
              onTap: () {
                setState(() {
                  dropdownMasterData = !dropdownMasterData;
                });
              },
            ),
            dropdownMasterData
                ? Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: _width,
                      decoration: BoxDecoration(color:lightGrey.withOpacity(0.10) ),
                      child: Column(
                        children: [
                          SideMenuItem(
                            itemName: "System",
                            dropp: false,
                            
                            onTap: () {
                              if (!menuController.isActive("System")) {
                                menuController.changeActiveitemTo("System");
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController
                                    .navigateTo(SystemPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Armoring Type",
                            dropp: false,
                           
                            onTap: () {
                              if (!menuController.isActive("Armoring Type")) {
                                menuController
                                    .changeActiveitemTo("Armoring Type");
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController
                                    .navigateTo(ArmoringPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Cable Type",
                            dropp: false,
                            
                            onTap: () {
                              if (!menuController.isActive("Cable Type")) {
                                menuController.changeActiveitemTo("Cable Type");
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController
                                    .navigateTo(CableTypePageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Manufacturer",
                            dropp: false,
                            
                            onTap: () {
                              if (!menuController.isActive("Manufacturer")) {
                                menuController
                                    .changeActiveitemTo("Manufacturer");
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController
                                    .navigateTo(ManufacturerPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Core Type",
                            dropp: false,
                           
                            onTap: () {
                              if (!menuController.isActive("Core Type")) {
                                menuController.changeActiveitemTo("Core Type");
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController
                                    .navigateTo(CoreTypePageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Location",
                            dropp: false,
                           
                            onTap: () {
                              if (!menuController.isActive("Location")) {
                                menuController.changeActiveitemTo("Location");
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController
                                    .navigateTo(LocationPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Unit",
                            dropp: false,
                           
                            onTap: () {
                              if (!menuController.isActive("Unit")) {
                                menuController.changeActiveitemTo("Unit");
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController.navigateTo(UnitPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Company",
                            dropp: false,
                            
                            onTap: () {
                              if (!menuController.isActive("Company")) {
                                menuController.changeActiveitemTo("Company");
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController
                                    .navigateTo(CompanyPageRoute);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            SideMenuItem(
              itemName: "Order",
              dropp: false,
             
              onTap: () {
                if (!menuController.isActive("Order")) {
                  menuController.changeActiveitemTo("Order");
                  if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                  navigationController.navigateTo(OrderPageRoute);
                }
              },
            ),
            SideMenuItem(
              itemName: "Report",
              dropp: false,
              
              onTap: () {
                if (!menuController.isActive("Report")) {
                  menuController.changeActiveitemTo("Report");
                  if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                  navigationController.navigateTo(ReportPageRoute);
                }
              },
            ),
            SideMenuItem(
              itemName: "Settings",
              dropp: false,
              
              onTap: () {
                if (!menuController.isActive("Settings")) {
                  menuController.changeActiveitemTo("Settings");
                  if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                  navigationController.navigateTo(SettingsPageRoute);
                }
              },
            ),
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

