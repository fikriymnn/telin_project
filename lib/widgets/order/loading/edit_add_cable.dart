import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

import 'package:telin_project/widgets/order/loading/table/table_cable_loading.dart';

class EditAddCable extends StatelessWidget {
  const EditAddCable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 59.3, top: 5, bottom: 5),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 107.3,
                  height: 37.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xffB8B8B8), width: 1)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.subdirectory_arrow_left,
                        color: active,
                        size: 28.6,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Back",
                        style: GoogleFonts.roboto(
                          fontSize: 17.3,
                          fontWeight: FontWeight.w400,
                          color: active,
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
      body: const TableCableLoading(),
    );
  }
}
