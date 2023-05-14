import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/setting/add_user.dart';

import 'package:telin_project/widgets/setting/table_akun.dart';
import 'package:telin_project/widgets/setting/table_akun_delete.dart';
import 'package:telin_project/widgets/setting/table_akun_delete_mobile.dart';
import 'package:telin_project/widgets/setting/table_akun_delete_small.dart';
import 'package:telin_project/widgets/setting/table_akun_mobile.dart';
import 'package:telin_project/widgets/setting/table_akun_small.dart';

class SettingsViewPage extends StatefulWidget {
  const SettingsViewPage({super.key});

  @override
  State<SettingsViewPage> createState() => _SettingsViewPageState();
}

bool btnDelete = false;

class _SettingsViewPageState extends State<SettingsViewPage> {
  @override
  Widget build(BuildContext context) {
    int _groupValue = -1;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_depo.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ResponsiveWidget(
                largeScreen: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 148,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddUser()));
                        },
                        child: Container(
                          width: 170.6,
                          height: 50.6,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffA5C176), width: 3.3),
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xffB1CC85)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.6),
                            child: Center(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xffB1CC85),
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("Add User",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.3,
                                          color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                smallScreen: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 148,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddUser()));
                        },
                        child: Container(
                          width: 170.6,
                          height: 50.6,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffA5C176), width: 3.3),
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xffB1CC85)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.6),
                            child: Center(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xffB1CC85),
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("Add User",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.3,
                                          color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.6, right: 16.6),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 508.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 26.6),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 258.6,
                                height: 37.06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.6),
                                    border: Border.all(
                                        width: 1, color: Color(0xffC1C1C1)),
                                    color: Color(0xffF3F3F3)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 15),
                                  child: TextField(
                                    style: GoogleFonts.roboto(
                                      fontSize: 10.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: GoogleFonts.roboto(
                                          fontSize: 10.6,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF9D9D9D),
                                        ),
                                        hintText: "Search"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "User List",
                                style: GoogleFonts.montserrat(
                                  fontSize: 26.6,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: const ResponsiveWidget(
                          largeScreen: TableAkun(),
                          mediumScreen: TableAkun(),
                          smallScreen: TableAkunSmall(),
                          mobileScreen: TableAkunMobile(),
                        )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
