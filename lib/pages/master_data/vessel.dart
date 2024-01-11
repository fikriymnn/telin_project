import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/master_data/add_data/add_core_type.dart';
import 'package:telin_project/widgets/master_data/add_data/add_vessel.dart';
import 'package:telin_project/widgets/master_data/table/table_core_type.dart';
import 'package:telin_project/widgets/master_data/table/table_vessel.dart';

class VesselScreens extends StatelessWidget {
  const VesselScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.3),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("MASTER DATA > VESSEL",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.black)),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierColor: Colors.black.withOpacity(0.50),
                              builder: (BuildContext context) {
                                return const AddVessel();
                              });
                        },
                        child: Container(
                          width: 155,
                          height: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: active),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: light,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text("ADD VESSEL",
                                    style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: light))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: light, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TableVessel(),
                ),
              )

              // const SizedBox(
              //   height: 50,
              // ),
              // const Expanded(child: TableSystem())
            ],
          ),
        ),
      ),
    );
  }
}
