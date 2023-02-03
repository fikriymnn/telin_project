import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/clarity.dart';
import 'package:telin_project/controllers/login_controller.dart';
import 'package:telin_project/login_screens/widgets/form_login_widget.dart';
import 'package:telin_project/login_screens/widgets/logo_widget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 800,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/background_login_full.png"),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 800,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                    //center: Alignment(0.5, -0.1),
                    //radius: 1.0,
                    colors: [
                      Color.fromARGB(0, 255, 255, 255),
                      Color(0xFFFFFFFF),
                    ],
                    stops: [0, 0.35],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LogoWidget(),
                  LoginForm(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
