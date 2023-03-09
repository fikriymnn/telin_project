import 'package:flutter/material.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/vertical_menu_item.dart';

import 'horizontal_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  final bool dropp;
  final bool? activess;
  final double? size1;
  final double? size2;
  const SideMenuItem(
      {super.key,
      required this.itemName,
      required this.onTap,
      required this.dropp,
      this.activess,
      this.size1,
      this.size2});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomScreen(context)) {
      return dropp == false
          ? VerticalMenuItem(
              itemName: itemName,
              onTap: onTap,
              size1: size1,
              size2: size2,
            )
          : VerticalMenuItemDropDown(
              itemName: itemName,
              onTap: onTap,
              activess: activess!,
              size1: size1,
              size2: size2,
            );
    }
    return dropp == false
        ? HorizontalMenuItem(
            itemName: itemName, onTap: onTap, size1: size1, size2: size2)
        : HorizontalMenuItemDropDown(
            itemName: itemName,
            onTap: onTap,
            activess: activess!,
            size1: size1,
            size2: size2,
          );
  }
}
