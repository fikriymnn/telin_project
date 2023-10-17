import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/setting/add_user.dart';

import 'package:telin_project/widgets/setting/table_akun.dart';
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
    int groupValue = -1;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_depo.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ResponsiveWidget(
                largeScreen: SizedBox(
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
                                  builder: (context) => const AddUser()));
                        },
                        child: Container(
                          width: 170.6,
                          height: 50.6,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffA5C176), width: 3.3),
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xffB1CC85)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.6),
                            child: Center(
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xffB1CC85),
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(
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
                smallScreen: SizedBox(
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
                                  builder: (context) => const AddUser()));
                        },
                        child: Container(
                          width: 170.6,
                          height: 50.6,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffA5C176), width: 3.3),
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xffB1CC85)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.6),
                            child: Center(
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xffB1CC85),
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 26.6),
                    child: Column(
                      children: [
                        SizedBox(
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
                        const Expanded(
                            child: ResponsiveWidget(
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
