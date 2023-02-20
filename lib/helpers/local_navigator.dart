import 'package:flutter/widgets.dart';
import 'package:telin_project/constants/controllers.dart';
import 'package:telin_project/routing/router.dart';
import 'package:telin_project/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: HomePageRoute,
      onGenerateRoute: generateRoute,
    );
