import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/routing/routes.dart';

class MenuControllers extends GetxController {
  static MenuControllers instance = Get.find();
  var activeItem = HomePageDisplayName.obs;
  var hoverItem = "".obs;

  changeActiveitemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case HomePageDisplayName:
        return _customIcon(FontAwesomeIcons.house, itemName);
      case InventoryDisplayName:
        return _customIcon(Icons.task_outlined, itemName);
      case MasterDataDisplayName:
        return _customIcon(FontAwesomeIcons.coins, itemName);
      case SystemDisplayName:
        return _customIcon(FontAwesomeIcons.box, itemName);
      case ArmoringDisplayName:
        return _customIcon(FontAwesomeIcons.cableCar, itemName);
      case CableTypeDisplayName:
        return _customIcon(FontAwesomeIcons.magento, itemName);
      case ManufacturerDisplayName:
        return _customIcon(FontAwesomeIcons.hand, itemName);
      case CoreTypeDisplayName:
        return _customIcon(FontAwesomeIcons.circleCheck, itemName);
      case LocationDisplayName:
        return _customIcon(FontAwesomeIcons.locationDot, itemName);
      case UnitDisplayName:
        return _customIcon(FontAwesomeIcons.unity, itemName);
      case CompanyDisplayName:
        return _customIcon(FontAwesomeIcons.building, itemName);
      case OrderDisplayName:
        return _customIcon(FontAwesomeIcons.tag, itemName);
      case ReportDisplayName:
        return _customIcon(FontAwesomeIcons.listCheck, itemName);
      case SettingsDisplayName:
        return _customIcon(FontAwesomeIcons.gear, itemName);
      case AuthenticationDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return FaIcon(
        icon,
        size: 22,
        color: active,
      );
    }
    return FaIcon(icon, color: isHovering(itemName) ? active : lightGrey);
  }
}
