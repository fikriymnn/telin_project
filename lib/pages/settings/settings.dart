import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/custom_text.dart';

class SettingsViewPage extends StatelessWidget {
  const SettingsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 148,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background_home.png'),fit: BoxFit.cover)),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170.6,
                  height: 50.6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffA5C176), width: 3.3),
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
                          SizedBox(width: 15,),
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
                SizedBox(width: 171.3,),
                Container(
                  width: 170.6,
                  height: 50.6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE44A51), width: 3.3),
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xffEC1D26)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.6),
                    child: Center(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child:  Text("X",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.3,
                                  color: Color(0xffEC1D26)))
                          ),
                          SizedBox(width: 15,),
                          Text("Delete User",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.3,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
