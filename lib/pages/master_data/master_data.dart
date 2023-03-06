import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/pages/master_data/armoring_type.dart';
import 'package:telin_project/pages/master_data/cable_type.dart';
import 'package:telin_project/pages/master_data/core_type.dart';
import 'package:telin_project/pages/master_data/location.dart';
import 'package:telin_project/pages/master_data/manufacture.dart';
import 'package:telin_project/pages/master_data/perusahan.dart';
import 'package:telin_project/pages/master_data/system.dart';
import 'package:telin_project/pages/master_data/unit.dart';
import 'package:telin_project/widgets/custom_text.dart';

class MasterDataViewPage extends StatelessWidget {
  const MasterDataViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SystemScreens()));
                  },
                  child: Container(
                    width: 170.6,
                    height: 50.6,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffA5C176), width: 3.3),
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffB1CC85)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.6),
                      child: Center(
                        child: Text("System",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.3,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ArmoringTypeScreens()));
                  },
                  child: Container(
                    width: 170.6,
                    height: 50.6,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffA5C176), width: 3.3),
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffB1CC85)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.6),
                      child: Center(
                        child: Text("Armoring Type",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.3,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CableTypeScreens()));
                  },
                  child: Container(
                    width: 170.6,
                    height: 50.6,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffA5C176), width: 3.3),
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffB1CC85)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.6),
                      child: Center(
                        child: Text("Cable Type",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.3,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ManufactureScreens()));
                  },
                  child: Container(
                    width: 170.6,
                    height: 50.6,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffA5C176), width: 3.3),
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffB1CC85)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.6),
                      child: Center(
                        child: Text("Manufacture",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.3,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CoreTypeScreens()));
                  },
                  child: Container(
                    width: 170.6,
                    height: 50.6,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffA5C176), width: 3.3),
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffB1CC85)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.6),
                      child: Center(
                        child: Text("Core Type",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.3,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreens()));
                  },
                  child: Container(
                    width: 170.6,
                    height: 50.6,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffA5C176), width: 3.3),
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffB1CC85)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.6),
                      child: Center(
                        child: Text("Location",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.3,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UnitScreens()));
                  },
                  child: Container(
                    width: 170.6,
                    height: 50.6,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffA5C176), width: 3.3),
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffB1CC85)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.6),
                      child: Center(
                        child: Text("Unit",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.3,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PerusahaanScreens()));
                  },
                  child: Container(
                    width: 170.6,
                    height: 50.6,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffA5C176), width: 3.3),
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffB1CC85)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.6),
                      child: Center(
                        child: Text("Perusahaan",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.3,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
              
          ],
        ),
      ),
    );
  }
}
