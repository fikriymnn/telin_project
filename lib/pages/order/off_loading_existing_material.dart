import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OffLoadingExistingScreens extends StatelessWidget {
  const OffLoadingExistingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Existing Material Screeens",style: TextStyle(fontSize: 50),),
    );
  }
}