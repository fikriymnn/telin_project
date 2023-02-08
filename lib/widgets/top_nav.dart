import 'dart:html';

import 'package:flutter/material.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14),
                  width: 120,
                  child: Image.asset("assets/images/logo_telin_top_nav.png"),
                )
              ],
            )
          : IconButton(
              onPressed: () {
                key.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu),
              color: active,
            ),
      leadingWidth: 120,
      backgroundColor: Colors.white,
      elevation: 0,
      title: !ResponsiveWidget.isSmallScreen(context)
          ? Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        child: CustomText(
                          text: "DASHBOARD CABLE & NON CABLE SPARE",
                          color: dark,
                          size: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Visibility(
                        child: CustomText(
                          text: "DEPO 104 - PELINDO IV MAKASSAR",
                          color: lightGrey,
                          size: 13,
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
                  SizedBox(
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
                          padding: EdgeInsets.all(4),
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
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundColor: light,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_outline,
                            color: dark,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.only(left: 50),
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
                  SizedBox(
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
                          padding: EdgeInsets.all(4),
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
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundColor: light,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_outline,
                            color: dark,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      iconTheme: IconThemeData(
        color: Colors.transparent,
      ),
    );
