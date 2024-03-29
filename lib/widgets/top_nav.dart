import 'package:flutter/material.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/edit_profile/edit_profile.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  width: 144,
                  child: Image.asset("assets/images/logo_telin_white.png"),
                )
              ],
            )
          : IconButton(
              onPressed: () {
                key.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu),
              color: active,
            ),
      leadingWidth: 144,
      backgroundColor: active,
      elevation: 0,
      title: !ResponsiveWidget.isSmallScreen(context)
          ? Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        child: CustomText(
                          text: "Makassar Site",
                          color: light,
                          size: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Visibility(
                        child: CustomText(
                          text: "DEPO 104 - PELINDO IV MAKASSAR",
                          color: light,
                          size: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    width: 1,
                    height: 22,
                    color: lightGrey,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: dark.withOpacity(.7),
                        ),
                      ),
                      Positioned(
                        top: 7,
                        right: 7,
                        child: Container(
                          width: 12,
                          height: 12,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: active,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: light,
                              width: 2,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    width: 1,
                    height: 22,
                    color: lightGrey,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: dark.withOpacity(.7),
                        ),
                      ),
                      Positioned(
                        top: 7,
                        right: 7,
                        child: Container(
                          width: 12,
                          height: 12,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: active,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: light,
                              width: 2,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
      iconTheme: const IconThemeData(
        color: Colors.transparent,
      ),
    );
