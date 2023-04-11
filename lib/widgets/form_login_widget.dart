import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/layout.dart';
import 'package:telin_project/pages/depo.dart';
import 'package:telin_project/pages/home/home.dart';
import 'package:telin_project/routing/router.dart';
import 'package:telin_project/routing/routes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController userInput = TextEditingController();
  TextEditingController passInput = TextEditingController();
  TextEditingController captchaInput = TextEditingController();
  String text = "";
  late String _password;
  bool _obscureText = true;
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<Response?> loginUser() async {
    var dio = Dio();
    try {
      var response = await dio.post(userLogin,
          data: {"username": userInput.text, "password": passInput.text},
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      Navigator.push(context, MaterialPageRoute(builder: (context) => Depo()));
      return response;
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Username atau Password salah',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
    return null;
    // if (userInput.text.isNotEmpty && passInput.text.isNotEmpty) {
    //   var reqBody = {"username": userInput.text, "password": passInput.text};

    //   var response = await http.post(Uri.parse(userLogin),
    //       headers: {
    //         'Content-Type': 'application/json',
    //         'Accept': 'application/json',
    //       },
    //       body: jsonEncode(reqBody));

    //   var jsonResponse = jsonDecode(response.body);
    //   if (jsonResponse['status']) {
    //     var myToken = jsonResponse['token'];
    //     prefs.setString('token', myToken);
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => Depo(
    //                   token: myToken,
    //                 )));
    //   } else {
    //     QuickAlert.show(
    //         context: context,
    //         type: QuickAlertType.error,
    //         text: 'Username atau Password salah',
    //         title: 'Peringatan',
    //         width: 400,
    //         confirmBtnColor: Colors.red);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 122),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(right: 420),
            child: Text('Login',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 386,
            height: 50,
            margin: const EdgeInsets.only(right: 100),
            child: TextFormField(
              controller: userInput,
              style: GoogleFonts.roboto(),
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: const EdgeInsets.only(left: 16, right: 15),
                  height: 24,
                  width: 29,
                  child: Image.asset('assets/images/clarity_id-badge-line.png'),
                ),
                fillColor: const Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
                ),
                labelText: 'Username',
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 386,
            height: 50,
            margin: const EdgeInsets.only(right: 100),
            child: TextFormField(
              obscureText: _obscureText,
              controller: passInput,
              style: GoogleFonts.roboto(),
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: const EdgeInsets.only(left: 16, right: 15),
                  height: 24,
                  width: 29,
                  child: Image.asset('assets/images/mdi_password-outline.png'),
                ),
                suffixIcon: IconButton(
                  padding: const EdgeInsets.only(right: 13),
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                fillColor: const Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
                ),
                labelText: 'Password',
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(right: 420),
            child: Text('Captcha',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                )),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            margin: const EdgeInsets.only(right: 100),
            height: 88,
            width: 245,
            child: Image.asset('assets/images/image 22.png', fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            width: 386,
            height: 50,
            margin: const EdgeInsets.only(right: 100),
            child: TextFormField(
              controller: captchaInput,
              style: GoogleFonts.roboto(),
              decoration: InputDecoration(
                fillColor: const Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
                ),
                labelText: 'Enter Captcha',
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 100),
            child: ElevatedButton(
              onPressed: () {
                if (userInput.text == '') {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.info,
                      title: 'Peringatan',
                      text: 'Username Tidak Boleh Kosong',
                      width: 400,
                      confirmBtnColor: Colors.red);
                } else if (passInput.text == '') {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.info,
                      title: 'Peringatan',
                      text: 'Password Tidak Boleh Kosong',
                      width: 400,
                      confirmBtnColor: Colors.red);
                } else {
                  loginUser();
                }
              },
              child: Text('Login',
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  )),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 12,
                backgroundColor: const Color(0xffEC1D26),
                fixedSize: const Size(215, 50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
