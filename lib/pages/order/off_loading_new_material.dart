import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:telin_project/widgets/order/new_material/add_new_material.dart';
import 'package:telin_project/widgets/order/new_material/form_new_material.dart';
import 'package:telin_project/widgets/order/new_material/table/table_new_cable.dart';
import 'package:telin_project/widgets/order/new_material/table/table_new_material.dart';
import 'package:telin_project/widgets/order/new_material/table/table_new_non_cable.dart';

class OffLoadingNewMatrial extends StatefulWidget {
  const OffLoadingNewMatrial({super.key});

  @override
  State<OffLoadingNewMatrial> createState() => _OffLoadingNewMatrialState();
}

class _OffLoadingNewMatrialState extends State<OffLoadingNewMatrial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.3),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FormNewMaterial()));
                      },
                      child: Container(
                        width: 200,
                        height: 50.6,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xffA5C176), width: 3.3),
                            borderRadius: BorderRadius.circular(4),
                            color: const Color(0xffB1CC85)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.6),
                          child: Center(
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xffB1CC85),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text("Add New Material",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.3,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "New Cable",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(child: TableNewMaterial()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
