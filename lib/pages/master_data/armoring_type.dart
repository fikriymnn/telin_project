import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/master_data/add_data/add_armoring_type.dart';
import 'package:telin_project/widgets/master_data/table/table_armoring_type.dart';

class ArmoringTypeScreens extends StatelessWidget {
  const ArmoringTypeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            Text("Add Armoring",
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
            height: 50,
          ),
          Expanded(child: TableArmoringType())
        ],
      ),
    );
  }
}
