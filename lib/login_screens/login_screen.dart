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
          child: Row(
            children: [
              LogoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
