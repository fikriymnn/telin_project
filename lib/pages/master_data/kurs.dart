import 'package:flutter/material.dart';

import 'package:telin_project/widgets/master_data/table/table_kurs.dart';

class KursScreens extends StatelessWidget {
  const KursScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.3),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(child: TableKurs())
        ],
      ),
    );
  }
}
