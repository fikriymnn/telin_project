import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
 
  const HorizontalMenuItem(
      {super.key, required this.itemName, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                      width: 6,
                      height: 40,
                      color: active,
                    ),
                  ),
                  SizedBox(width: _width / 80),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: CustomText(
                      text: itemName,
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
                      size: 18,
                      fontWeight: FontWeight.bold,
                    )),
                   
                    
                ],
              ),
            )));
  }
}



class HorizontalMenuItemDropDown extends StatelessWidget {
  final String itemName;
  final Function onTap;
  final bool activess;
  const HorizontalMenuItemDropDown(
      {super.key, required this.itemName, required this.onTap,required this.activess});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                      width: 6,
                      height: 40,
                      color: active,
                    ),
                  ),
                  SizedBox(width: _width / 80),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: CustomText(
                      text: itemName,
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
                      size: 18,
                      fontWeight: FontWeight.bold,
                    )),
                    
                    activess == false?
                    Flexible(child: Icon(Icons.arrow_drop_down)):
                    Flexible(child: Icon(Icons.arrow_drop_up))
                   
                    
                ],
              ),
            )));
  }
}
