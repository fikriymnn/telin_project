import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/pages/inventory/list_tank.dart';
import 'package:telin_project/widgets/inventory/inventory_map.dart';
import 'package:telin_project/widgets/inventory/listview.dart';

class InventoryViewPage extends StatefulWidget {
  const InventoryViewPage({super.key});

  @override
  State<InventoryViewPage> createState() => _InventoryViewPageState();
}

class _InventoryViewPageState extends State<InventoryViewPage> {
  int inventory = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.3),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("INVENTORY",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.black)),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                inventory = 1;
                              });
                            },
                            child: Container(
                              width: 124,
                              height: 33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15)),
                                  border: Border.all(color: active, width: 1),
                                  color: inventory == 1 ? active : light),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 14.6),
                                child: Center(
                                  child: Text("MAP VIEW",
                                      style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color:
                                              inventory == 1 ? light : active)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                inventory = 2;
                              });
                            },
                            child: Container(
                              width: 124,
                              height: 33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  border: Border.all(color: active, width: 1),
                                  color: inventory == 2 ? active : light),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 14.6),
                                child: Center(
                                  child: Text("LIST VIEW",
                                      style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color:
                                              inventory == 2 ? light : active)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              inventory == 1
                  ? InventoriMapView()
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TableListview(),
                      ),
                    )

              // const SizedBox(
              //   height: 50,
              // ),
              // const Expanded(child: TableSystem())
            ],
          ),
        ),
      ),
    );
  }
}
