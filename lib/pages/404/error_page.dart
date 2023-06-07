import 'package:flutter/material.dart';
import 'package:telin_project/widgets/custom_text.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "Page not found.",
              size: 24,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
