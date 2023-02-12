import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationControllers extends GetxController {
  static NavigationControllers instance = Get.find();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  goBack() => navigationKey.currentState!.pop();
}
