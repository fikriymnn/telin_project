import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../home_screen/home_screen.dart';
import '../../utils/constant.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController captchaInput = TextEditingController();
  String text = "";
  late String _password;
  bool _obscureText = true;
  bool? _isLoading = false;

  // Fungsi Tombol Click Login
  signIn(String username, String password) async {
    String url = "http://192.168.43.166:1000/api/user/signin";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"username": username, "password": password};
    var jsonResponse;
    var res = await http.post(Uri.parse(url), body: body);
    // Need to check the api status
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);

      print("Response status: ${res.statusCode}");

      print("Response status: ${res.body}");

      if (jsonResponse != null) {
        sharedPreferences.setString("token", jsonResponse['token']);
        UtilsApps.showDialog(context);

        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Berhasil Login',
          btnOkOnPress: () {
            UtilsApps.hideDialog(context);

            Navigator.pushNamed(context, HomeScreen.routeName);
          },
        ).show();
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Peringatan',
        desc: 'Gagal Login',
        btnOkOnPress: () {
          UtilsApps.hideDialog(context);
        },
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 122),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(right: 420),
            child: Text('Login',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                )),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 386,
            height: 50,
            margin: EdgeInsets.only(right: 100),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Harap masukkan username dengan benar';
                } else {
                  return null;
                }
              },
              controller: usernameInput,
              style: GoogleFonts.roboto(),
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: EdgeInsets.only(left: 16, right: 15),
                  height: 24,
                  width: 29,
                  child: Image.asset('assets/images/clarity_id-badge-line.png'),
                ),
                fillColor: Color(0xffF1F0F5),
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
          SizedBox(
            height: 15,
          ),
          Container(
            width: 386,
            height: 50,
            margin: EdgeInsets.only(right: 100),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || value.length < 10) {
                  return 'Harap masukkan password dengan benar';
                } else {
                  return null;
                }
              },
              obscureText: _obscureText,
              controller: passwordInput,
              style: GoogleFonts.roboto(),
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: EdgeInsets.only(left: 16, right: 15),
                  height: 24,
                  width: 29,
                  child: Image.asset('assets/images/mdi_password-outline.png'),
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.only(right: 13),
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                fillColor: Color(0xffF1F0F5),
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
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(right: 420),
            child: Text('Captcha',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                )),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            margin: EdgeInsets.only(right: 100),
            height: 88,
            width: 245,
            child: Image.asset('assets/images/image 22.png', fit: BoxFit.cover),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 386,
            height: 50,
            margin: EdgeInsets.only(right: 100),
            child: TextFormField(
              controller: captchaInput,
              style: GoogleFonts.roboto(),
              decoration: InputDecoration(
                fillColor: Color(0xffF1F0F5),
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
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 100),
            child: ElevatedButton(
              onPressed: () {
                signIn(usernameInput.text, passwordInput.text);
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
                backgroundColor: Color(0xffEC1D26),
                fixedSize: Size(215, 50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
