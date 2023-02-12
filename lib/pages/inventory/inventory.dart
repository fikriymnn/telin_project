import 'package:flutter/material.dart';
import 'package:telin_project/widgets/custom_text.dart';

class InventoryViewPage extends StatelessWidget {
  const InventoryViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: "Inventory View",
      ),
    );
  }
}
