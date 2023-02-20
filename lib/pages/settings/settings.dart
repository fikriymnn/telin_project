import 'package:flutter/material.dart';
import 'package:telin_project/widgets/custom_text.dart';

class SettingsViewPage extends StatelessWidget {
  const SettingsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: "Settings View",
      ),
    );
  }
}
