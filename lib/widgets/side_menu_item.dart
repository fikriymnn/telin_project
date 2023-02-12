import 'package:flutter/material.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/vertical_menu_item.dart';

import 'horizontal_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const SideMenuItem({super.key, required this.itemName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomScreen(context)) {
      return VerticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    }
    return HorizontalMenuItem(
      itemName: itemName,
      onTap: onTap,
    );
  }
}
