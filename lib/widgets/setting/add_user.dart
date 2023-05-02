import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/helpers/responsive.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController txtNama = TextEditingController();
  TextEditingController txtusername = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  String? role;
  var _obscureText = true;
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  Response? response;

  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_depo.png'),
              fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.only(left: 38),
        child: Column(
          children: [
            Container(
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
                                  color: Color(0xffB8B8B8), width: 1)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.subdirectory_arrow_left,
                                color: Color(0xffED1D25),
                                size: 28.6,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Back",
                                style: GoogleFonts.roboto(
                                  fontSize: 17.3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffED1D25),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
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
                      child: Center(
                        child: TextField(
                          controller: txtNama,
                          style: GoogleFonts.montserrat(
                            fontSize: 10.6,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              hintText: "Input Name"),
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
                      child: Center(
                        child: TextField(
                          controller: txtusername,
                          style: GoogleFonts.montserrat(
                            fontSize: 10.6,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              hintText: "Input Username"),
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
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: txtpassword,
                                obscureText: _obscureText,
                                style: GoogleFonts.montserrat(
                                  fontSize: 10.6,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  hintText: "Input Password",
                                ),
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
                        ResponsiveWidget(
                          largeScreen: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 190,
                                  height: 46.6,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: _isSelected1
                                              ? Color(0xffEC1D26)
                                              : Color(0xffF0F0F0),
                                          width: 4),
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white),
                                  child: RadioListTile(
                                    title: Text(
                                      "Super Admin",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: _isSelected1
                                            ? Color(0xffEC1D26)
                                            : Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    value: "super-admin",
                                    activeColor: Color(0xffEC1D26),
                                    groupValue: role,
                                    onChanged: (value) {
                                      setState(() {
                                        role = value.toString();
                                        _isSelected1 = true;
                                        _isSelected2 = false;
                                        _isSelected3 = false;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 15.3,
                                ),
                                Container(
                                  width: 154.6,
                                  height: 46.6,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: _isSelected2
                                              ? Color(0xffEC1D26)
                                              : Color(0xffF0F0F0),
                                          width: 4),
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white),
                                  child: Center(
                                    child: RadioListTile(
                                      title: Text(
                                        "Admin",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 13.3,
                                          fontWeight: FontWeight.w400,
                                          color: _isSelected2
                                              ? Color(0xffEC1D26)
                                              : Colors.black.withOpacity(0.6),
                                        ),
                                      ),
                                      value: "admin",
                                      activeColor: Color(0xffEC1D26),
                                      groupValue: role,
                                      onChanged: (value) {
                                        setState(() {
                                          role = value.toString();
                                          _isSelected1 = false;
                                          _isSelected2 = true;
                                          _isSelected3 = false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15.3,
                                ),
                                Container(
                                  width: 154.6,
                                  height: 46.6,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: _isSelected3
                                              ? Color(0xffEC1D26)
                                              : Color(0xffF0F0F0),
                                          width: 4),
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white),
                                  child: Center(
                                    child: RadioListTile(
                                      title: Text(
                                        "User",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 13.3,
                                          fontWeight: FontWeight.w400,
                                          color: _isSelected3
                                              ? Color(0xffEC1D26)
                                              : Colors.black.withOpacity(0.6),
                                        ),
                                      ),
                                      value: "user",
                                      activeColor: Color(0xffEC1D26),
                                      groupValue: role,
                                      onChanged: (value) {
                                        setState(() {
                                          role = value.toString();
                                          _isSelected1 = false;
                                          _isSelected2 = false;
                                          _isSelected3 = true;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          smallScreen: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 190,
                                        height: 46.6,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: _isSelected1
                                                    ? Color(0xffEC1D26)
                                                    : Color(0xffF0F0F0),
                                                width: 4),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white),
                                        child: RadioListTile(
                                          title: Text(
                                            "Super Admin",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 13.3,
                                              fontWeight: FontWeight.w400,
                                              color: _isSelected1
                                                  ? Color(0xffEC1D26)
                                                  : Colors.black
                                                      .withOpacity(0.6),
                                            ),
                                          ),
                                          value: "Super Admin",
                                          activeColor: Color(0xffEC1D26),
                                          groupValue: role,
                                          onChanged: (value) {
                                            setState(() {
                                              role = value.toString();
                                              _isSelected1 = true;
                                              _isSelected2 = false;
                                              _isSelected3 = false;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.3,
                                      ),
                                      Container(
                                        width: 154.6,
                                        height: 46.6,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: _isSelected2
                                                    ? Color(0xffEC1D26)
                                                    : Color(0xffF0F0F0),
                                                width: 4),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white),
                                        child: Center(
                                          child: RadioListTile(
                                            title: Text(
                                              "Admin",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 13.3,
                                                fontWeight: FontWeight.w400,
                                                color: _isSelected2
                                                    ? Color(0xffEC1D26)
                                                    : Colors.black
                                                        .withOpacity(0.6),
                                              ),
                                            ),
                                            value: "Admin",
                                            activeColor: Color(0xffEC1D26),
                                            groupValue: role,
                                            onChanged: (value) {
                                              setState(() {
                                                role = value.toString();
                                                _isSelected1 = false;
                                                _isSelected2 = true;
                                                _isSelected3 = false;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.3,
                                      ),
                                      Container(
                                        width: 154.6,
                                        height: 46.6,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: _isSelected3
                                                    ? Color(0xffEC1D26)
                                                    : Color(0xffF0F0F0),
                                                width: 4),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white),
                                        child: Center(
                                          child: RadioListTile(
                                            title: Text(
                                              "User",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 13.3,
                                                fontWeight: FontWeight.w400,
                                                color: _isSelected3
                                                    ? Color(0xffEC1D26)
                                                    : Colors.black
                                                        .withOpacity(0.6),
                                              ),
                                            ),
                                            value: "User",
                                            activeColor: Color(0xffEC1D26),
                                            groupValue: role,
                                            onChanged: (value) {
                                              setState(() {
                                                role = value.toString();
                                                _isSelected1 = false;
                                                _isSelected2 = false;
                                                _isSelected3 = true;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 43,
                  ),
                  InkWell(
                    onTap: () {
                      if (txtNama == '') {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Peringatan',
                            text: 'Nama Tidak Boleh Kosong',
                            width: 400,
                            confirmBtnColor: Colors.red);
                      } else if (txtusername == '') {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Peringatan',
                            text: 'Username Tidak Boleh Kosong',
                            width: 400,
                            confirmBtnColor: Colors.red);
                      } else if (txtpassword == '') {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Peringatan',
                            text: 'Password Tidak Boleh Kosong',
                            width: 400,
                            confirmBtnColor: Colors.red);
                      } else if (role == '') {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Peringatan',
                            text: 'Role Type Tidak Boleh Kosong',
                            width: 400,
                            confirmBtnColor: Colors.red);
                      } else {
                        inputDataAkun(txtNama.text, txtusername.text,
                            txtpassword.text, role);
                      }
                    },
                    child: Container(
                      width: 120.6,
                      height: 34.6,
                      decoration: BoxDecoration(
                          color: Color(0xffEC1D26),
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: Text("Create Account",
                            style: GoogleFonts.montserrat(
                              fontSize: 13.3,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clearForm() {
    txtNama.clear();
    txtusername.clear();
    txtpassword.clear();
    role = null;
    bool _isSelected1 = false;
    bool _isSelected2 = false;
    bool _isSelected3 = false;
  }

  void inputDataAkun(nama, userName, password, role) async {
    bool status;
    var msg;
    try {
      response = await dio.post(inputAkun, data: {
        'name': nama,
        'username': userName,
        'password': password,
        'role': role
      });
      _clearForm();
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: '$msg',
          width: 400,
          confirmBtnColor: Colors.green);
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }
}
