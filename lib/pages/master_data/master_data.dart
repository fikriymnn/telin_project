import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/master_data/add_armoring_type.dart';
import 'package:telin_project/widgets/master_data/add_cable_type.dart';
import 'package:telin_project/widgets/master_data/add_core_type.dart';
import 'package:telin_project/widgets/master_data/add_location.dart';
import 'package:telin_project/widgets/master_data/add_manufacture.dart';
import 'package:telin_project/widgets/master_data/add_new_item.dart';
import 'package:telin_project/widgets/master_data/add_perusahaan.dart';
import 'package:telin_project/widgets/master_data/add_system.dart';
import 'package:telin_project/widgets/master_data/add_unit.dart';

class MasterDataViewPage extends StatelessWidget {
  const MasterDataViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return AddSystem();
                          });
                    },
                    child: Container(
                      width: 200,
                      height: 50.6,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffA5C176), width: 3.3),
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
                              Text("Add System",
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
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return AddArmoringType();
                          });
                    },
                    child: Container(
                      width: 200,
                      height: 50.6,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffA5C176), width: 3.3),
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
                              Text("Add Armoring Type",
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
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return AddCableType();
                          });
                    },
                    child: Container(
                      width: 200,
                      height: 50.6,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffA5C176), width: 3.3),
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
                              Text("Add Cable Type",
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
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return AddManufacture();
                          });
                    },
                    child: Container(
                      width: 200,
                      height: 50.6,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffA5C176), width: 3.3),
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
                              Text("Add Manufacture",
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
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return AddCoreType();
                          });
                    },
                    child: Container(
                      width: 200,
                      height: 50.6,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffA5C176), width: 3.3),
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
                              Text("Add Core Type",
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
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return AddLocation();
                          });
                    },
                    child: Container(
                      width: 200,
                      height: 50.6,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffA5C176), width: 3.3),
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
                              Text("Add Location",
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
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return AddUnit();
                          });
                    },
                    child: Container(
                      width: 200,
                      height: 50.6,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffA5C176), width: 3.3),
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
                              Text("Add Unit",
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
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return AddPerusahaan();
                          });
                    },
                    child: Container(
                      width: 200,
                      height: 50.6,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffA5C176), width: 3.3),
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
                              Text("Add Perusahaan",
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
            )
          ],
        ),
      ),
    );
  }
}
