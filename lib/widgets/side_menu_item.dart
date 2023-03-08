import 'package:flutter/material.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/vertical_menu_item.dart';

import 'horizontal_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  final bool dropp;
  final bool? activess;
  const SideMenuItem(
    
      {
        super.key,
      
      required this.itemName,
      required this.onTap,
      required this.dropp, this.activess});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomScreen(context)) {
      return VerticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    }
    return dropp == false
        ? HorizontalMenuItem(
            itemName: itemName,
            onTap: onTap,
          )
        : HorizontalMenuItemDropDown(itemName: itemName, onTap: onTap,activess: activess!,);
  }
}
