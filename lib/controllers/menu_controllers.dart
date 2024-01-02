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
      case KursDisplayName:
        return _customIcon(FontAwesomeIcons.dollarSign, itemName);
      case ArmoringDisplayName:
        return _customIcon(Icons.settings_input_component, itemName);
      case CableTypeDisplayName:
        return _customIcon(Icons.cable_sharp, itemName);
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
      case LoadingDisplayName:
        return _customIcon(Icons.keyboard_double_arrow_up, itemName);
      case OffLoadingDisplayName:
        return _customIcon(Icons.keyboard_double_arrow_down, itemName);
      case NewMaterialDisplayName:
        return _customIcon(Icons.new_label_outlined, itemName);
      case ExistingMaterialDisplayName:
        return _customIcon(Icons.label_outline, itemName);
      case ReportDisplayName:
        return _customIcon(FontAwesomeIcons.listCheck, itemName);
      case CableReportDisplayName:
        return _customIcon(Icons.cable, itemName);
      case NonCableReportDisplayName:
        return _customIcon(FontAwesomeIcons.tools, itemName);
      case SettingsDisplayName:
        return _customIcon(FontAwesomeIcons.gear, itemName);
      case AuthenticationDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      case VesselDisplayName:
        return _customIcon(FontAwesomeIcons.ship, itemName);
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
    return FaIcon(icon, color: isHovering(itemName) ? active : light);
  }
}
