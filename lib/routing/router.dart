import 'package:flutter/material.dart';
import 'package:telin_project/pages/auth/login_screen.dart';
import 'package:telin_project/pages/depo.dart';
import 'package:telin_project/pages/home/home.dart';
import 'package:telin_project/pages/master_data/armoring_type.dart';
import 'package:telin_project/pages/master_data/cable_type.dart';
import 'package:telin_project/pages/master_data/core_type.dart';
import 'package:telin_project/pages/master_data/location.dart';
import 'package:telin_project/pages/master_data/manufacture.dart';
import 'package:telin_project/pages/master_data/perusahan.dart';
import 'package:telin_project/pages/master_data/system.dart';
import 'package:telin_project/pages/master_data/unit.dart';
import 'package:telin_project/pages/order/loading.dart';
import 'package:telin_project/pages/order/off_loading_existing_material.dart';
import 'package:telin_project/pages/order/off_loading_new_material.dart';
import 'package:telin_project/routing/routes.dart';
import 'package:telin_project/widgets/report/report_table_cable.dart';
import 'package:telin_project/widgets/report/report_table_noncable.dart';

import '../pages/inventory/inventory.dart';
import '../pages/master_data/master_data.dart';
import '../pages/order/order.dart';
import '../pages/report/report.dart';
import '../pages/settings/settings.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DepoPageRoute:
      return _getPageRoute(Depo());
    case HomePageRoute:
      return _getPageRoute(HomeViewPage());
    case InventoryPageRoute:
      return _getPageRoute(InventoryViewPage());
    case MasterDataPageRoute:
      return _getPageRoute(MasterDataViewPage());
    case SystemPageRoute:
      return _getPageRoute(SystemScreens());
    case ArmoringPageRoute:
      return _getPageRoute(ArmoringTypeScreens());
    case CableTypePageRoute:
      return _getPageRoute(CableTypeScreens());
    case ManufacturerPageRoute:
      return _getPageRoute(ManufactureScreens());
    case CoreTypePageRoute:
      return _getPageRoute(CoreTypeScreens());
    case LocationPageRoute:
      return _getPageRoute(LocationScreens());
    case UnitPageRoute:
      return _getPageRoute(UnitScreens());
    case CompanyPageRoute:
      return _getPageRoute(PerusahaanScreens());
    case OrderPageRoute:
      return _getPageRoute(OrderViewPage());
    case LoadingPageRoute:
      return _getPageRoute(LoadingScreens());
    case NewMaterialPageRoute:
      return _getPageRoute(OffLoadingNewMatrial());
    case ExistingMaterialPageRoute:
      return _getPageRoute(OffLoadingExistingScreens());
    case ReportPageRoute:
      return _getPageRoute(ReportViewPage());
    case CableReportPageRoute:
      return _getPageRoute(CableReport());
    case NonCableReportPageRoute:
      return _getPageRoute(NonCableReport());
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

PageRoute getPagesRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
