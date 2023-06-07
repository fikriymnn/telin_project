import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({super.key});

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  var _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_depo.png'),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 59.3, top: 32),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 107.3,
                              height: 37.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xffB8B8B8), width: 1)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.subdirectory_arrow_left,
                                    color: active,
                                    size: 28.6,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Back",
                                    style: GoogleFonts.roboto(
                                      fontSize: 17.3,
                                      fontWeight: FontWeight.w400,
                                      color: active,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              CircleAvatar(
                radius: 50,
                backgroundColor: active,
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Ubah Foto Profil",
                    style: GoogleFonts.roboto(
                      fontSize: 17.3,
                      fontWeight: FontWeight.bold,
                      color: dark,
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          const SizedBox(
                            height: 25,
                          ),
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 298.6,
                              height: 44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 5, color: const Color(0xffF0F0F0)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 5,
                                        offset: const Offset(0, 4))
                                  ]),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 18, bottom: 8),
                                child: Center(
                                  child: TextField(
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10.6,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: GoogleFonts.montserrat(
                                          fontSize: 13.3,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                        hintText: "Sarah Jamil"),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 298.6,
                              height: 44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 5, color: const Color(0xffF0F0F0)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 5,
                                        offset: const Offset(0, 4))
                                  ]),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 18, bottom: 8),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          obscureText: _obscureText,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.6,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          ),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintStyle: GoogleFonts.montserrat(
                                                fontSize: 13.3,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                              ),
                                              hintText: "gudangtelkom1"),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 90,
                  height: 37.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6), color: active),
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
        ),
      ),
    );
  }
}
