import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

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
              onPressed: () {},
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
