import 'package:flutter/material.dart';
import 'package:telin_project/login_screens/login_screen.dart';

import 'home_screen/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
