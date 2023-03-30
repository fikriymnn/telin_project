import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:telin_project/helpers/local_navigator.dart';
import 'package:telin_project/widgets/side_menu.dart';
import 'package:telin_project/widgets/side_menu_admin.dart';
import 'package:telin_project/widgets/side_menu_user.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SideMenu(),
        ),
        Expanded(
          flex: 5,
          child: localNavigator(),
        )
      ],
    );
  }
}
