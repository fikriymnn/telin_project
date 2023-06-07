import 'package:flutter/material.dart';
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
                  MaterialPageRoute(builder: (context) => const CableReport()));
            },
            child: const Text("Cable Report"),
          ),
          const SizedBox(
            width: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NonCableReport()));
            },
            child: const Text("Non Cable Report"),
          ),
        ],
      ),
    );
  }
}
