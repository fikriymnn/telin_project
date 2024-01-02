import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  final double? size1;
  final double? size2;

  const HorizontalMenuItem(
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
        child: Obx(() => Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                    color: menuController.isHovering(itemName) ||
                            menuController.isActive(itemName)
                        ? activeTable
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 27,
                          height: 25,
                          child: Center(
                            child: menuController.returnIconFor(itemName),
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      if (!menuController.isActive(itemName))
                        Container(
                          height: 25,
                          child: Center(
                            child: CustomText(
                              text: itemName,
                              size: size1,
                              fontWeight: FontWeight.w600,
                              color: menuController.isHovering(itemName)
                                  ? active
                                  : light,
                            ),
                          ),
                        )
                      else
                        Container(
                          height: 25,
                          child: Center(
                            child: CustomText(
                              text: itemName,
                              color: active,
                              size: size2 ?? 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

class HorizontalMenuItemDropDown extends StatelessWidget {
  final String itemName;
  final Function onTap;
  final bool activess;
  final double? size1;
  final double? size2;
  const HorizontalMenuItemDropDown(
      {super.key,
      required this.itemName,
      required this.onTap,
      required this.activess,
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
        child: Obx(() => Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                    color: menuController.isHovering(itemName) ||
                            menuController.isActive(itemName)
                        ? activeTable
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 27,
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            menuController.returnIconFor(itemName),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      if (!menuController.isActive(itemName))
                        Container(
                          height: 25,
                          child: Center(
                            child: CustomText(
                              text: itemName,
                              size: size1,
                              fontWeight: FontWeight.bold,
                              color: menuController.isHovering(itemName)
                                  ? active
                                  : light,
                            ),
                          ),
                        )
                      else
                        Container(
                          height: 25,
                          child: Center(
                            child: CustomText(
                              text: itemName,
                              color: active,
                              size: size2 ?? 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      activess == false
                          ? Flexible(
                              child: Icon(
                              Icons.arrow_drop_down,
                              color: menuController.isHovering(itemName)
                                  ? active
                                  : light,
                            ))
                          : Flexible(
                              child: Icon(
                              Icons.arrow_drop_up,
                              color: menuController.isHovering(itemName)
                                  ? active
                                  : light,
                            ))
                    ],
                  ),
                ),
              ),
            )));
  }
}
