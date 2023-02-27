import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/setting/add_user.dart';

import 'package:telin_project/widgets/setting/table_akun.dart';
import 'package:telin_project/widgets/setting/table_akun_delete.dart';

class SettingsViewPage extends StatefulWidget {
  const SettingsViewPage({super.key});

  @override
  State<SettingsViewPage> createState() => _SettingsViewPageState();
}

bool btnDelete = false;

class _SettingsViewPageState extends State<SettingsViewPage> {
  @override
  Widget build(BuildContext context) {
    int _groupValue = -1;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_depo.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 148,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUser()));
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
                    SizedBox(
                      width: 171.3,
                    ),
                    btnDelete?Container():
                    InkWell(
                      onTap: (){
                        setState(() {
                          btnDelete = true;
                        });
                      },
                      child: Container(
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
                                    child: Text("X",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.3,
                                            color: Color(0xffEC1D26)))),
                                SizedBox(
                                  width: 15,
                                ),
                                Text("Delete User",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.3,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.6, right: 16.6),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 508.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 26.6),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 258.6,
                                height: 37.06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.6),
                                    border: Border.all(
                                        width: 1, color: Color(0xffC1C1C1)),
                                    color: Color(0xffF3F3F3)
                                    ),
                                child:Padding(
                                  padding: const EdgeInsets.only(left: 10,bottom: 15),
                                  child: TextField(
                                      style: GoogleFonts.roboto(
                                        fontSize: 10.6,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF9D9D9D),
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                          hintStyle: GoogleFonts.roboto(
                                            fontSize: 10.6,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF9D9D9D),
                                          ),
                                          hintText: "Search"),
                                    ),
                                ) ,
                                
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("User List",style: GoogleFonts.montserrat(
                                            fontSize: 26.6,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),),
                            ],
                          ),
                        ),
                        btnDelete?
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 26.6),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      btnDelete = false;
                                    });
                                  },
                                  child: Container(
                                    width:100 ,
                                    height: 30,
                                    decoration: BoxDecoration(color: Color(0xffEC1D26),borderRadius: BorderRadius.circular(6)),
                                    child: Center(
                                      child: Text("Done",style: GoogleFonts.roboto(
                                                fontSize: 13.3,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ):Container(),
                        Expanded(
                          child:btnDelete?
                           TableAkunDelete():
                           TableAkun()
                          ),
           
      
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

