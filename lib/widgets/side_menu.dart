import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
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
bool dropDownOrder = false;
bool dropDownOffLoading = false;
bool dropDownReport = false;

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: light,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(4, 12), // changes position of shadow
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
                SizedBox(width: width / 48),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset("assets/images/logo_telin_top_nav.png"),
                ),
                const SizedBox(
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
                SizedBox(width: width / 48),
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
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(color: light),
                      child: Column(
                        children: [
                          SideMenuItem(
                            itemName: "System",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("System")) {
                                menuController.changeActiveitemTo("System");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController
                                    .navigateTo(SystemPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Armoring Type",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Armoring Type")) {
                                menuController
                                    .changeActiveitemTo("Armoring Type");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController
                                    .navigateTo(ArmoringPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Cable Type",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Cable Type")) {
                                menuController.changeActiveitemTo("Cable Type");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController
                                    .navigateTo(CableTypePageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Manufacturer",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Manufacturer")) {
                                menuController
                                    .changeActiveitemTo("Manufacturer");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController
                                    .navigateTo(ManufacturerPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Core Type",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Core Type")) {
                                menuController.changeActiveitemTo("Core Type");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController
                                    .navigateTo(CoreTypePageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Location",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Location")) {
                                menuController.changeActiveitemTo("Location");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController
                                    .navigateTo(LocationPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Unit",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Unit")) {
                                menuController.changeActiveitemTo("Unit");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController.navigateTo(UnitPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Company",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Company")) {
                                menuController.changeActiveitemTo("Company");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController
                                    .navigateTo(CompanyPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Kurs",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Kurs")) {
                                menuController.changeActiveitemTo("Kurs");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController.navigateTo(KursPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Vessel",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Vessel")) {
                                menuController.changeActiveitemTo("Vessel");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController
                                    .navigateTo(VesselPageRoute);
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
              dropp: true,
              activess: dropDownOrder,
              onTap: () {
                setState(() {
                  dropDownOrder = !dropDownOrder;
                });
              },
            ),
            dropDownOrder
                ? Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      width: width,
                      decoration:
                          BoxDecoration(color: lightGrey.withOpacity(0.10)),
                      child: Column(
                        children: [
                          SideMenuItem(
                            itemName: "Loading",
                            dropp: false,
                            size1: 13,
                            size2: 15,
                            onTap: () {
                              if (!menuController.isActive("Loading")) {
                                menuController.changeActiveitemTo("Loading");
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController
                                    .navigateTo(LoadingPageRoute);
                              }
                            },
                          ),
                          SideMenuItem(
                            itemName: "Off Loading",
                            dropp: true,
                            size1: 13,
                            size2: 15,
                            activess: dropDownOffLoading,
                            onTap: () {
                              setState(() {
                                dropDownOffLoading = !dropDownOffLoading;
                              });
                            },
                          ),
                          dropDownOffLoading
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    width: width,
                                    decoration: BoxDecoration(
                                        color: lightGrey.withOpacity(0.10)),
                                    child: Column(
                                      children: [
                                        SideMenuItem(
                                          itemName: "New Material",
                                          dropp: false,
                                          size1: 13,
                                          size2: 15,
                                          onTap: () {
                                            if (!menuController
                                                .isActive("New Material")) {
                                              menuController.changeActiveitemTo(
                                                  "New Material");
                                              if (ResponsiveWidget
                                                  .isSmallScreen(context)) {
                                                Get.back();
                                              }
                                              navigationController.navigateTo(
                                                  NewMaterialPageRoute);
                                            }
                                          },
                                        ),
                                        SideMenuItem(
                                          itemName: "Existing Material",
                                          dropp: false,
                                          size1: 13,
                                          size2: 15,
                                          onTap: () {
                                            if (!menuController.isActive(
                                                "Existing Material")) {
                                              menuController.changeActiveitemTo(
                                                  "Existing Material");
                                              if (ResponsiveWidget
                                                  .isSmallScreen(context)) {
                                                Get.back();
                                              }
                                              navigationController.navigateTo(
                                                  ExistingMaterialPageRoute);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  )
                : Container(),
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
                      width: width,
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
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
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
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
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
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.warning,
                    text: 'Are You Sure?',
                    title: 'Log Out',
                    width: 400,
                    confirmBtnColor: Colors.red,
                    onCancelBtnTap: () {},
                    onConfirmBtnTap: () {
                      if (AuthenticationPageRoute == AuthenticationPageRoute) {
                        menuController.changeActiveitemTo(HomePageDisplayName);
                        Get.offAllNamed(AuthenticationPageRoute);
                      }
                    });
              },
            ),
          ]),
        ],
      ),
    );
  }
}
