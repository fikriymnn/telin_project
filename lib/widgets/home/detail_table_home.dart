import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/home/table_cable.dart';
import 'package:telin_project/widgets/home/table_turn_over.dart';

class DetailTableHome extends StatefulWidget {
  const DetailTableHome({super.key});

  @override
  State<DetailTableHome> createState() => _DetailTableHomeState();
}

class _DetailTableHomeState extends State<DetailTableHome> {
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height ,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 19.3, vertical: 12.6),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          "WORK ORDER",
                          style: GoogleFonts.montserrat(
                            fontSize: 10.6,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 77.3,
                            height: 19.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(33.3),
                                color: Color(0xFFED1D25)),
                            child: Center(
                              child: Text("Edit",
                                  style: GoogleFonts.roboto(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0xFFED1D25),
                            child: Center(
                              child: Text("X",
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
                          style: GoogleFonts.montserrat(
                            fontSize: 13.3,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("LCT NAPOLEON",
                          style: GoogleFonts.montserrat(
                            fontSize: 13.3,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          )),
                      SizedBox(
                        width: 284,
                      ),
                      Text("BANDUNG - JAKARTA",
                          style: GoogleFonts.montserrat(
                            fontSize: 13.3,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                Expanded(child: TableCableHome()),
                        SizedBox(height: 15,),
                        // Expanded(child: TableCableTurnOverHome())
                
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
