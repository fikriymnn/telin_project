import 'package:flutter/material.dart';
import 'package:telin_project/pages/auth/login_screen.dart';
import 'package:telin_project/pages/home/home.dart';
import 'package:telin_project/routing/routes.dart';

import '../pages/inventory/inventory.dart';
import '../pages/master_data/master_data.dart';
import '../pages/order/order.dart';
import '../pages/report/report.dart';
import '../pages/settings/settings.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return _getPageRoute(HomeViewPage());
    case InventoryPageRoute:
      return _getPageRoute(InventoryViewPage());
    case MasterDataPageRoute:
      return _getPageRoute(MasterDataViewPage());
    case OrderPageRoute:
      return _getPageRoute(OrderViewPage());
    case ReportPageRoute:
      return _getPageRoute(ReportViewPage());
    case SettingsPageRoute:
      return _getPageRoute(SettingsViewPage());
    case AuthenticationPageRoute:
      return _getPageRoute(LoginScreen());
    default:
      return _getPageRoute(HomeViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
