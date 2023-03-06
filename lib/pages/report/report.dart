import 'package:flutter/material.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/report/report_table_cable.dart';
import 'package:telin_project/widgets/report/report_table_noncable.dart';

class ReportViewPage extends StatelessWidget {
  const ReportViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CableReport()));
            },
            child: Text("Cable Report"),
          ),
          SizedBox(
            width: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NonCableReport()));
            },
            child: Text("Non Cable Report"),
          ),
        ],
      ),
    );
  }
}
