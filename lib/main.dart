import 'package:flutter/material.dart';
import 'package:telin_project/home_screen.dart';
import 'package:telin_project/login_screens/login_screen.dart';
import 'package:telin_project/services/shared_service.dart';
import 'package:url_strategy/url_strategy.dart';

Widget _defaultHome = const LoginScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // bool _result = await SharedService.isLoggedIn();
  // if (_result) {
  //   _defaultHome = const HomeScreen();
  // }
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telkom Infra - Spare Management (SPAREMAN)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => _defaultHome,
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
