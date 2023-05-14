import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/setting/edit_akun.dart';

class DetailAkun extends StatefulWidget {
  final String id;
  final String name;
  final String username;
  final String email;
  final String password;
  final String role;
  const DetailAkun(
      {super.key,
      required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.password,
      required this.role});

  @override
  State<DetailAkun> createState() => _DetailAkunState();
}

class _DetailAkunState extends State<DetailAkun> {
  var _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 942,
        height: 592.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.white),
        child: Column(
          children: [
            Text("User",
                style: GoogleFonts.montserrat(
                  fontSize: 33.3,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 298.6,
                    height: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 5, color: Color(0xffF0F0F0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 5,
                              offset: Offset(0, 4))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, bottom: 8),
                      child: Text(
                        widget.name,
                        style: GoogleFonts.montserrat(
                          fontSize: 10.6,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 298.6,
                    height: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 5, color: Color(0xffF0F0F0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 5,
                              offset: Offset(0, 4))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, bottom: 8),
                      child: Text(
                        widget.username,
                        style: GoogleFonts.montserrat(
                          fontSize: 10.6,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 298.6,
                    height: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 5, color: Color(0xffF0F0F0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 5,
                              offset: Offset(0, 4))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, bottom: 8),
                      child: Text(
                        widget.password,
                        style: GoogleFonts.montserrat(
                          fontSize: 10.6,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Select Role",
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 154.6,
                                height: 46.6,
                                decoration: BoxDecoration(
                                  color: Color(0xffEC1D26),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 148,
                                    height: 40,
                                    color: Colors.white,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 13.3),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 8,
                                            backgroundColor: Color(0xffEC1D26),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            widget.role,
                                            style: GoogleFonts.montserrat(
                                              fontSize: 13.3,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 101.3,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 90,
                            height: 37.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xffEC1D26)),
                            child: Center(
                              child: Text("Done",
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
