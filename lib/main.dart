import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:telin_project/controllers/navigation_controllers.dart';
import 'package:telin_project/layout.dart';
import 'package:telin_project/pages/404/error_page.dart';
import 'package:telin_project/pages/auth/login_screen.dart';
import 'package:telin_project/routing/routes.dart';

import 'package:telin_project/controllers/menu_controllers.dart';

void main() {
  Get.put(MenuControllers());
  Get.put(NavigationControllers());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AuthenticationPageRoute,
      unknownRoute: GetPage(
          name: "/notfound",
          page: () => const PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(
            name: RootRoute,
            page: () => const SiteLayout(
                  role: "",
                )),
        GetPage(name: AuthenticationPageRoute, page: () => const LoginScreen()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Spare Management',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme:
            GoogleFonts.robotoTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: const Color(0xFFED1D25),
      ),

      //home: Depo(),
    );
  }
}
