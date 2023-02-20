import 'package:flutter/material.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/inventory/k.dart';

class WidgetListView extends StatefulWidget {
  const WidgetListView({super.key});

  @override
  State<WidgetListView> createState() => _WidgetListViewState();
}

class _WidgetListViewState extends State<WidgetListView> {
  // List<Coba> isicoba = [
  //   Coba(
  //     no: "1",
  //     label: "IGG",
  //     system: "OCC-SC500",
  //     cabletype: "NEC",
  //     manufacturer: "SA",
  //     amorigtype: "-",
  //     coretype: "-",
  //     core: "-",
  //     length: "IGG",
  //     inner: "IGG",
  //     outer: "IGG",
  //     tanklevel: "IGG",
  //     remark: "IGG",
  //     description: "IGG",
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    var screnSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screnSize.width,
          height: screnSize.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_login_full.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: screnSize.width,
              height: screnSize.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 45, left: 30, bottom: 7),
                    child: CustomText(
                      text: "TANK 1",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(
                        label: Text("NO"),
                      ),
                      DataColumn(
                        label: Text("LABEL"),
                      ),
                      DataColumn(
                        label: Text("SYSTEM"),
                      ),
                      DataColumn(
                        label: Text("CABLE TYPE"),
                      ),
                      DataColumn(
                        label: Text("MANUFACTURER"),
                      ),
                      DataColumn(
                        label: Text("ARMORIG TYPE"),
                      ),
                      DataColumn(
                        label: Text("CORE TYPE"),
                      ),
                      DataColumn(
                        label: Text("CORE"),
                      ),
                      DataColumn(
                        label: Text("LENGTH (METER)"),
                      ),
                      DataColumn(
                        label: Text("INNER"),
                      ),
                      DataColumn(
                        label: Text("OUTER"),
                      ),
                      DataColumn(
                        label: Text("TANK LEVEL (FR BOTTOM)"),
                      ),
                      DataColumn(
                        label: Text("REMARK"),
                      ),
                      DataColumn(
                        label: Text("DESCRIPTION"),
                      ),
                    ],
                    rows: const [
                      DataRow(
                        cells: [
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("20208"),
                          ),
                          DataCell(
                            Text(
                              "IGG",
                              style: TextStyle(color: Colors.amberAccent),
                            ),
                          ),
                          DataCell(
                            Text("OCC-SC500"),
                          ),
                          DataCell(
                            Text("NEC"),
                          ),
                          DataCell(
                            Text("SA"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("255"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("Tank-1"),
                          ),
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("IGG-S14.5 # S146C01-3"),
                          ),
                          DataCell(
                            Text("SCRAP"),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text("2"),
                          ),
                          DataCell(
                            Text("20208"),
                          ),
                          DataCell(
                            Text("IGG"),
                          ),
                          DataCell(
                            Text("OCC-SC500"),
                          ),
                          DataCell(
                            Text("NEC"),
                          ),
                          DataCell(
                            Text("SA"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("255"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("Tank-1"),
                          ),
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("IGG-S14.5 # S146C01-3"),
                          ),
                          DataCell(
                            Text("SCRAP"),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text("3"),
                          ),
                          DataCell(
                            Text("20208"),
                          ),
                          DataCell(
                            Text("IGG"),
                          ),
                          DataCell(
                            Text("OCC-SC500"),
                          ),
                          DataCell(
                            Text("NEC"),
                          ),
                          DataCell(
                            Text("SA"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("255"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("Tank-1"),
                          ),
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("IGG-S14.5 # S146C01-3"),
                          ),
                          DataCell(
                            Text("SCRAP"),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text("4"),
                          ),
                          DataCell(
                            Text("20208"),
                          ),
                          DataCell(
                            Text("IGG"),
                          ),
                          DataCell(
                            Text("OCC-SC500"),
                          ),
                          DataCell(
                            Text("NEC"),
                          ),
                          DataCell(
                            Text("SA"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("255"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("Tank-1"),
                          ),
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("IGG-S14.5 # S146C01-3"),
                          ),
                          DataCell(
                            Text("SCRAP"),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text("5"),
                          ),
                          DataCell(
                            Text("20208"),
                          ),
                          DataCell(
                            Text("IGG"),
                          ),
                          DataCell(
                            Text("OCC-SC500"),
                          ),
                          DataCell(
                            Text("NEC"),
                          ),
                          DataCell(
                            Text("SA"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("255"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("Tank-1"),
                          ),
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("IGG-S14.5 # S146C01-3"),
                          ),
                          DataCell(
                            Text("SCRAP"),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text("6"),
                          ),
                          DataCell(
                            Text("20208"),
                          ),
                          DataCell(
                            Text("IGG"),
                          ),
                          DataCell(
                            Text("OCC-SC500"),
                          ),
                          DataCell(
                            Text("NEC"),
                          ),
                          DataCell(
                            Text("SA"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("255"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("Tank-1"),
                          ),
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("IGG-S14.5 # S146C01-3"),
                          ),
                          DataCell(
                            Text("SCRAP"),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text("7"),
                          ),
                          DataCell(
                            Text("20208"),
                          ),
                          DataCell(
                            Text("IGG"),
                          ),
                          DataCell(
                            Text("OCC-SC500"),
                          ),
                          DataCell(
                            Text("NEC"),
                          ),
                          DataCell(
                            Text("SA"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("255"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("Tank-1"),
                          ),
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("IGG-S14.5 # S146C01-3"),
                          ),
                          DataCell(
                            Text("SCRAP"),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text("8"),
                          ),
                          DataCell(
                            Text("20208"),
                          ),
                          DataCell(
                            Text("IGG"),
                          ),
                          DataCell(
                            Text("OCC-SC500"),
                          ),
                          DataCell(
                            Text("NEC"),
                          ),
                          DataCell(
                            Text("SA"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("255"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("Tank-1"),
                          ),
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("IGG-S14.5 # S146C01-3"),
                          ),
                          DataCell(
                            Text("SCRAP"),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text("9"),
                          ),
                          DataCell(
                            Text("20208"),
                          ),
                          DataCell(
                            Text("IGG"),
                          ),
                          DataCell(
                            Text("OCC-SC500"),
                          ),
                          DataCell(
                            Text("NEC"),
                          ),
                          DataCell(
                            Text("SA"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("255"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("Tank-1"),
                          ),
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("IGG-S14.5 # S146C01-3"),
                          ),
                          DataCell(
                            Text("SCRAP"),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text("10"),
                          ),
                          DataCell(
                            Text("20208"),
                          ),
                          DataCell(
                            Text("IGG"),
                          ),
                          DataCell(
                            Text("OCC-SC500"),
                          ),
                          DataCell(
                            Text("NEC"),
                          ),
                          DataCell(
                            Text("SA"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("255"),
                          ),
                          DataCell(
                            Text("-"),
                          ),
                          DataCell(
                            Text("Tank-1"),
                          ),
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("IGG-S14.5 # S146C01-3"),
                          ),
                          DataCell(
                            Text("SCRAP"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
