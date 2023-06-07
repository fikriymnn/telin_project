import 'package:flutter/material.dart';

import '../../widgets/form_login_widget.dart';
import '../../widgets/logo_widget.dart';

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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogoWidget(),
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
