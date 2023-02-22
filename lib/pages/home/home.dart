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
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background_home.png'),fit: BoxFit.fill)),
              height: 327.6,
              child: Padding(
               padding: const EdgeInsets.only(left: 146, right: 146),
                child: ChartDataCuy(),
              ),
            ),
            SizedBox(height: 50,),
             Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 20),
              height: 700,
              child: Column(
                children: [
                  Expanded(child: TableHome()),
                ],
              )),
            
          ],
        ),
      ),
    );
  }
}
