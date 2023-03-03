import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/helpers/responsive.dart';
import 'package:telin_project/widgets/master_data/add_new_item_large.dart';
import 'package:telin_project/widgets/master_data/add_new_item_mobile.dart';
import 'package:telin_project/widgets/master_data/add_new_item_small.dart';
import 'package:telin_project/widgets/setting/edit_akun.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({super.key});

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 900,
        height: 588.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.white),
        child: SingleChildScrollView(
          child: ResponsiveWidget(
            largeScreen: AddNewItemLarge(),
            smallScreen: AddNewItemSmall(),
            mobileScreen: AddNewItemMobile(),
            ),
        )
      ),
    );
  }
}
