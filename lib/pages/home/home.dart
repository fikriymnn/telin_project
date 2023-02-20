import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/home/table_home.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Expanded(child: TableHome()),
        
      ],
    );
  }
}
