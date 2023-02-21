import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/home/chart.dart';
import 'package:telin_project/widgets/home/table_home.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 116, right: 116),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 327.6,
              child: ChartDataCuy(),
            ),
          ),
           Expanded(child: TableHome()),
          
        ],
      ),
    );
  }
}
