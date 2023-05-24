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
import '../pages/master_data/kurs.dart';
import '../pages/master_data/master_data.dart';
import '../pages/order/order.dart';
import '../pages/report/report.dart';
import '../pages/settings/settings.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return _getPageRoute(const HomeViewPage());
    case InventoryPageRoute:
      return _getPageRoute(const InventoryViewPage());
    case MasterDataPageRoute:
      return _getPageRoute(const MasterDataViewPage());
    case SystemPageRoute:
      return _getPageRoute(const SystemScreens());
    case KursPageRoute:
      return _getPageRoute(const KursScreens());
    case ArmoringPageRoute:
      return _getPageRoute(const ArmoringTypeScreens());
    case CableTypePageRoute:
      return _getPageRoute(const CableTypeScreens());
    case ManufacturerPageRoute:
      return _getPageRoute(const ManufactureScreens());
    case CoreTypePageRoute:
      return _getPageRoute(const CoreTypeScreens());
    case LocationPageRoute:
      return _getPageRoute(const LocationScreens());
    case UnitPageRoute:
      return _getPageRoute(const UnitScreens());
    // case EditUnitPageRoute:
    //   return _getPageRoute(EditUnit());
    case CompanyPageRoute:
      return _getPageRoute(const PerusahaanScreens());
    case OrderPageRoute:
      return _getPageRoute(const OrderViewPage());
    case LoadingPageRoute:
      return _getPageRoute(const LoadingScreens());
    case NewMaterialPageRoute:
      return _getPageRoute(const OffLoadingNewMatrial());
    case ExistingMaterialPageRoute:
      return _getPageRoute(const OffLoadingExistingScreens());
    case ReportPageRoute:
      return _getPageRoute(const ReportViewPage());
    case CableReportPageRoute:
      return _getPageRoute(const CableReport());
    case NonCableReportPageRoute:
      return _getPageRoute(const NonCableReport());
    case SettingsPageRoute:
      return _getPageRoute(const SettingsViewPage());
    case AuthenticationPageRoute:
      return _getPageRoute(const LoginScreen());
    default:
      return _getPageRoute(const HomeViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

PageRoute getPagesRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
