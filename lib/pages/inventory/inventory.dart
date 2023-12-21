import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/pages/inventory/list_tank.dart';
import 'package:telin_project/widgets/inventory/inventory_map.dart';

class InventoryViewPage extends StatefulWidget {
  const InventoryViewPage({super.key});

  @override
  State<InventoryViewPage> createState() => _InventoryViewPageState();
}

class _InventoryViewPageState extends State<InventoryViewPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                leading: Container(),
                                title: Text(
                                  "LIST VIEW INVENTORY",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 59.3, top: 5, bottom: 5),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 107.3,
                                          height: 37.3,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffB8B8B8),
                                                  width: 1)),
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
                              body: const ListTank(),
                            );
                          });

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const WidgetListView(),
                      //   ),
                      // );
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: active,
                      ),
                      child: Center(
                        child: Text(
                          "List View",
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: light,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const InventoriMapView()
          ],
        ),
      ),
    );
  }
}
