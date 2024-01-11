import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

import 'package:telin_project/widgets/order/loading/table/table_loading.dart';

import '../../widgets/order/loading/form/loading_form.dart';

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
                      Text("LOADING",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.black)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormLoading()));
                        },
                        child: Container(
                          width: 148,
                          height: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: active),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.6),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: light,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("NEW MATERIAL",
                                      style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: light))
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

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: light, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TableLoading(),
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

    // Scaffold(
    //   body: Column(
    //     children: [
    //       const SizedBox(
    //         height: 30,
    //       ),
    //       SizedBox(
    //         width: MediaQuery.of(context).size.width,
    //         child: Column(
    //           children: [
    //             InkWell(
    //               onTap: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => //TableNonCableLoading()
    //                             //TableCableLoading(loadingId: "loadingId")
    //                             FormLoading()));
    //               },
    //               child: Container(
    //                 width: 200,
    //                 height: 50.6,
    //                 decoration: BoxDecoration(
    //                     border: Border.all(
    //                         color: const Color(0xffA5C176), width: 3.3),
    //                     borderRadius: BorderRadius.circular(4),
    //                     color: const Color(0xffB1CC85)),
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(left: 14.6),
    //                   child: Center(
    //                     child: Row(
    //                       children: [
    //                         const CircleAvatar(
    //                           radius: 15,
    //                           backgroundColor: Colors.white,
    //                           child: Icon(
    //                             Icons.add,
    //                             color: Color(0xffB1CC85),
    //                             size: 20,
    //                           ),
    //                         ),
    //                         const SizedBox(
    //                           width: 15,
    //                         ),
    //                         Text("Add Loading",
    //                             style: GoogleFonts.roboto(
    //                                 fontWeight: FontWeight.w500,
    //                                 fontSize: 13.3,
    //                                 color: Colors.white))
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       const Expanded(child: TableLoading())
    //     ],
    //   ),
    // );
  }
}
