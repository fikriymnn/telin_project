
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/cable_&_kit.dart';
import 'package:telin_project/widgets/order/loading/loading_form.dart';
import 'package:telin_project/widgets/order/loading/new_order_loading.dart';
import 'package:telin_project/widgets/order/loading/table_cable_loading.dart';
import 'package:telin_project/widgets/order/loading/table_loading.dart';


class LoadingScreens extends StatefulWidget {
  const LoadingScreens({super.key});

  @override
  State<LoadingScreens> createState() => _LoadingScreensState();
}



class _LoadingScreensState extends State<LoadingScreens> {
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                                builder: (context) => NewOrderLoading()));
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
                                Text("Add Loading",
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
          Expanded(child: TableLoading())
        ],
      ),
    );
  }
}