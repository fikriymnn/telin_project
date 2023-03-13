import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/helpers/responsive.dart';

import 'package:telin_project/widgets/order/new_material/add_new_material.dart';
import 'package:telin_project/widgets/order/new_material/table/table_new_cable.dart';
import 'package:telin_project/widgets/order/new_material/table/table_new_non_cable.dart';



class OffLoadingNewMatrial extends StatefulWidget {
  const OffLoadingNewMatrial({super.key});

  @override
  State<OffLoadingNewMatrial> createState() => _OffLoadingNewMatrialState();
}

class _OffLoadingNewMatrialState extends State<OffLoadingNewMatrial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.3),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddnewMaterialScreens()));
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
                                Text("Add New Material",
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
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "New Cable",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                child: Column(
                  children: [
                    Expanded(child: TableNewCable()),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "New Non Cable",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                child: Column(
                  children: [
                    Expanded(child: TableNewNonCable()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
