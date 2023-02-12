import 'package:flutter/material.dart';
import 'package:telin_project/widgets/custom_text.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: "Home View",
      ),
    );
  }
}
