import 'package:flutter/material.dart';
import 'package:telin_project/login_screens/widgets/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                        image: AssetImage("assets/images/background_login.png"),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 800,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(0, 255, 255, 255),
                      Color(0xFFFFFFFF),
                    ],
                    stops: [0, 0.35],
                  ),
                ),
              ),
              Row(
                children: [
                  LogoWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
