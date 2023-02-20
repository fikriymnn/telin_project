import 'package:flutter/material.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/inventory/coba_datatable.dart';

class InventoryViewPage extends StatelessWidget {
  const InventoryViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WidgetListView(),
            ),
          );
        },
        child: Container(
          width: 150,
          height: 40,
          color: Colors.amber,
          child: const Center(
            child: CustomText(
              text: 'listview',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
