import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../constants/style.dart';
import 'custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  final double? size1;
  final double? size2;
  const VerticalMenuItem(
      {super.key,
      required this.itemName,
      required this.onTap,
      this.size1,
      this.size2});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () => onTap(),
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? active.withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                children: [
                  Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      width: 3,
                      height: 72,
                      color: active,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: menuController.returnIconFor(itemName),
                        ),
                        if (!menuController.isActive(itemName))
                          Flexible(
                              child: CustomText(
                            text: itemName,
                            size: size1,
                            fontWeight: FontWeight.bold,
                            color: menuController.isHovering(itemName)
                                ? active
                                : dark,
                          ))
                        else
                          Flexible(
                              child: CustomText(
                            text: itemName,
                            color: active,
                            size: size2 ?? 18,
                            fontWeight: FontWeight.bold,
                          ))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class VerticalMenuItemDropDown extends StatelessWidget {
  final String itemName;
  final Function onTap;
  final bool activess;
  final double? size1;
  final double? size2;
  const VerticalMenuItemDropDown(
      {super.key,
      required this.itemName,
      required this.onTap,
      this.size1,
      this.size2,
      required this.activess});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () => onTap(),
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? active.withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                children: [
                  Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      width: 3,
                      height: 72,
                      color: active,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: menuController.returnIconFor(itemName),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!menuController.isActive(itemName))
                                CustomText(
                                  text: itemName,
                                  size: size1,
                                  fontWeight: FontWeight.bold,
                                  color: menuController.isHovering(itemName)
                                      ? active
                                      : dark,
                                )
                              else
                                CustomText(
                                  text: itemName,
                                  color: active,
                                  size: size2 ?? 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              activess == false
                                  ? const Flexible(
                                      child: Icon(Icons.arrow_drop_down))
                                  : const Flexible(
                                      child: Icon(Icons.arrow_drop_up))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
