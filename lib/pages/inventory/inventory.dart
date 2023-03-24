import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/pages/inventory/cage.dart';
import 'package:telin_project/pages/inventory/floor.dart';
import 'package:telin_project/pages/inventory/list_tank.dart';
import 'package:telin_project/pages/inventory/rak.dart';
import 'package:telin_project/pages/inventory/refrigerator.dart';
import 'package:telin_project/widgets/custom_text.dart';

class InventoryViewPage extends StatefulWidget {
  const InventoryViewPage({super.key});

  @override
  State<InventoryViewPage> createState() => _InventoryViewPageState();
}

class _InventoryViewPageState extends State<InventoryViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return ListTank();
                },
              );
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
              color: Colors.amber,
              child: const Center(
                child: CustomText(
                  text: 'listview',
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            width: 1102,
            height: 544.6,
            child: Stack(
              children: [
                Container(
                  width: 1102,
                  height: 544.6,
                  child: Image.asset(
                    'assets/images/map_view.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 100),
                  child: InkWell(
                    //rak
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 167, left: 100),
                  child: InkWell(
                    //floor
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 285, left: 100),
                  child: InkWell(
                    //cage
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 400, left: 100),
                  child: InkWell(
                    //refregerator
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 438),
                  child: InkWell(
                    //Tank 1
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 604),
                  child: InkWell(
                    //Tank 2
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 771),
                  child: InkWell(
                    //Tank 3
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 935),
                  child: InkWell(
                    //Tank 10
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 205, left: 438),
                  child: InkWell(
                    //Tank 6
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 205, left: 604),
                  child: InkWell(
                    //Tank 5
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 205, left: 771),
                  child: InkWell(
                    //Tank 4
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 205, left: 935),
                  child: InkWell(
                    //Tank 11
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 370, left: 354),
                  child: InkWell(
                    //Tank 9
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 370, left: 520),
                  child: InkWell(
                    //Tank 8
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 370, left: 690),
                  child: InkWell(
                    //Tank 9
                    onTap: () {},
                    child: Container(
                      color: active,
                      width: 107,
                      height: 115,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
