import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoadingScreens extends StatelessWidget {
  const LoadingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Loading Screens",style: TextStyle(fontSize: 50),),
    );
  }
}