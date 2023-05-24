import 'package:flutter/material.dart';
import 'package:telin_project/helpers/local_navigator.dart';
import 'package:telin_project/widgets/side_menu.dart';
import 'package:telin_project/widgets/side_menu_admin.dart';
import 'package:telin_project/widgets/side_menu_user.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({super.key, required this.role});
  final String role;

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: widget.role == "super-admin"
                ? SideMenu()
                : widget.role == "admin"
                    ? SideMenuAdmin()
                    : SideMenuUser()),
        Expanded(
          flex: 5,
          child: localNavigator(),
        )
      ],
    );
  }
}
