import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:telin_project/widgets/custom_text.dart';
import 'package:telin_project/widgets/inventory/coba_datatable.dart';
import 'package:telin_project/widgets/inventory/k.dart';

class InventoryViewPage extends StatefulWidget {
  const InventoryViewPage({super.key});

  @override
  State<InventoryViewPage> createState() => _InventoryViewPageState();
}

class _InventoryViewPageState extends State<InventoryViewPage> {
  List<Coba> tank1 = [
    Coba(
      no: "1",
      label: "20208",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "255",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "1",
      remark: "IGG-S14.5 # S146C01-3",
      description: "SCRAP",
    ),
    Coba(
      no: "2",
      label: "20207",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "628",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "2",
      remark: "IGG-S14.6 # S146C01-2",
      description: "SCRAP",
    ),
    Coba(
      no: "3",
      label: "20206",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "6.200",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "3",
      remark: "#IGG-ISP-2FP-SA01",
      description: "SCRAP",
    ),
    Coba(
      no: "4",
      label: "20106",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "DAS",
      coretype: "-",
      core: "-",
      length: "211",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "4",
      remark: "IGG-S7.3 # S073C01-1A",
      description: "SCRAP",
    ),
    Coba(
      no: "5",
      label: "20105",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "DAS",
      coretype: "-",
      core: "-",
      length: "378",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "5",
      remark: "IGGS14.3 # S13C01-1A",
      description: "SCRAP",
    ),
    Coba(
      no: "6",
      label: "20205",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "107",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "6",
      remark: "IGGS14.3 # S13C01-2A",
      description: "SCRAP",
    ),
    Coba(
      no: "7",
      label: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      description: "SCRAP",
    ),
    Coba(
      no: "8",
      label: "23105",
      system: "UNKNOWN-12",
      cabletype: "MINISUB-36",
      manufacturer: "NEC",
      amorigtype: "DA",
      coretype: "-",
      core: "-",
      length: "2.449",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "8",
      remark: "-",
      description: "SISA SPARE",
    ),
    Coba(
      no: "9",
      label: "23104",
      system: "UNKNOWN-11",
      cabletype: "MINISUB-36",
      manufacturer: "NEC",
      amorigtype: "DA",
      coretype: "-",
      core: "-",
      length: "150",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "9",
      remark: "-",
      description: "SISA SPARE",
    ),
    Coba(
      no: "10",
      label: "17222",
      system: "SMPCS",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "1.663",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "10",
      remark: "RECOVERED BIAK CABLE",
      description: "SCRAP",
    ),
  ];
  List<Coba> tank2 = [
    Coba(
      no: "1",
      label: "22301",
      system: "BALOM",
      cabletype: "MINISUB-36",
      manufacturer: "NSW",
      amorigtype: "LWP",
      coretype: "EX-2000",
      core: "12",
      length: "1.017",
      inner: "Tank-2",
      outer: "-",
      tanklevel: "1",
      remark: "-",
      description: "SPARE",
    ),
    Coba(
      no: "2",
      label: "22301",
      system: "BALOM",
      cabletype: "MINISUB-36",
      manufacturer: "NSW",
      amorigtype: "LWP",
      coretype: "EX-2000",
      core: "12",
      length: "560",
      inner: "Tank-2",
      outer: "-",
      tanklevel: "2",
      remark: "-",
      description: "SPARE",
    ),
    Coba(
      no: "3",
      label: "15301",
      system: "LTCS",
      cabletype: "MINSUB-36",
      manufacturer: "NSW",
      amorigtype: "LWP",
      coretype: "EX-2000",
      core: "12",
      length: "1.736",
      inner: "Tank-2",
      outer: "-",
      tanklevel: "3",
      remark: "-",
      description: "SPARE",
    ),
    Coba(
      no: "4",
      label: "20304",
      system: "IGG",
      cabletype: "OCC-SC500/SC-520",
      manufacturer: "NEC",
      amorigtype: "LW",
      coretype: "Sumitomo Z+",
      core: "8",
      length: "6.501",
      inner: "Tank-2",
      outer: "-",
      tanklevel: "4",
      remark: "-",
      description: "SPARE",
    ),
    Coba(
      no: "5",
      label: "14302",
      system: "MKCS Z+",
      cabletype: "URC-1",
      manufacturer: "NEXAN",
      amorigtype: "LWA",
      coretype: "Sumitomo Z+",
      core: "12",
      length: "4.806",
      inner: "Tank-2",
      outer: "-",
      tanklevel: "5",
      remark: "-",
      description: "SPARE",
    ),
    Coba(
      no: "6",
      label: "14303",
      system: "MKCS Z+",
      cabletype: "URC-1",
      manufacturer: "NEXAN",
      amorigtype: "LWA",
      coretype: "Sumitomo Z+",
      core: "12",
      length: "5.540",
      inner: "Tank-2",
      outer: "-",
      tanklevel: "6",
      remark: "-",
      description: "SPARE",
    ),
    Coba(
      no: "7",
      label: "13302",
      system: "MKCS Z",
      cabletype: "URC-1",
      manufacturer: "NEXAN",
      amorigtype: "LWA",
      coretype: "Sumitomo Z",
      core: "12",
      length: "3.375",
      inner: "Tank-2",
      outer: "-",
      tanklevel: "7",
      remark: "-",
      description: "SPARE",
    ),
    Coba(
      no: "8",
      label: "13303",
      system: "MKCS Z",
      cabletype: "URC-1",
      manufacturer: "NEXAN",
      amorigtype: "LWA",
      coretype: "Sumitomo Z",
      core: "12",
      length: "6.254",
      inner: "Tank-2",
      outer: "-",
      tanklevel: "8",
      remark: "-",
      description: "SPARE",
    ),
    Coba(
      no: "9",
      label: "20305",
      system: "IGG",
      cabletype: "OCC-SC500/SC-520",
      manufacturer: "NEC",
      amorigtype: "LWS",
      coretype: "Sumitomo Z+",
      core: "10",
      length: "36.330",
      inner: "Tank-2",
      outer: "-",
      tanklevel: "9",
      remark: "-",
      description: "SPARE",
    ),
    Coba(
      no: "10",
      label: "17305",
      system: "SMPCS P#1",
      cabletype: "OALC-4",
      manufacturer: "ASN",
      amorigtype: "LWP",
      coretype: "Sumitomo Z+",
      core: "8",
      length: "4.217",
      inner: "Tank-2",
      outer: "-",
      tanklevel: "10",
      remark: "-",
      description: "SPARE",
    ),
  ];
  List<Coba> tank3 = [
    Coba(
      no: "1",
      label: "20208",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "255",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "1",
      remark: "IGG-S14.5 # S146C01-3",
      description: "SCRAP",
    ),
    Coba(
      no: "2",
      label: "20207",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "628",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "2",
      remark: "IGG-S14.6 # S146C01-2",
      description: "SCRAP",
    ),
    Coba(
      no: "3",
      label: "20206",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "6.200",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "3",
      remark: "#IGG-ISP-2FP-SA01",
      description: "SCRAP",
    ),
    Coba(
      no: "4",
      label: "20106",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "DAS",
      coretype: "-",
      core: "-",
      length: "211",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "4",
      remark: "IGG-S7.3 # S073C01-1A",
      description: "SCRAP",
    ),
    Coba(
      no: "5",
      label: "20105",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "DAS",
      coretype: "-",
      core: "-",
      length: "378",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "5",
      remark: "IGGS14.3 # S13C01-1A",
      description: "SCRAP",
    ),
    Coba(
      no: "6",
      label: "20205",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "107",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "6",
      remark: "IGGS14.3 # S13C01-2A",
      description: "SCRAP",
    ),
    Coba(
      no: "7",
      label: "20204",
      system: "IGG",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "218",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "7",
      remark: "IGGS14.3 # S13C01-2A",
      description: "SCRAP",
    ),
    Coba(
      no: "8",
      label: "23105",
      system: "UNKNOWN-12",
      cabletype: "MINISUB-36",
      manufacturer: "NEC",
      amorigtype: "DA",
      coretype: "-",
      core: "-",
      length: "2.449",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "8",
      remark: "-",
      description: "SISA SPARE",
    ),
    Coba(
      no: "9",
      label: "23104",
      system: "UNKNOWN-11",
      cabletype: "MINISUB-36",
      manufacturer: "NEC",
      amorigtype: "DA",
      coretype: "-",
      core: "-",
      length: "150",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "9",
      remark: "-",
      description: "SISA SPARE",
    ),
    Coba(
      no: "10",
      label: "17222",
      system: "SMPCS",
      cabletype: "OCC-SC500",
      manufacturer: "NEC",
      amorigtype: "SA",
      coretype: "-",
      core: "-",
      length: "1.663",
      inner: "-",
      outer: "Tank-1",
      tanklevel: "10",
      remark: "RECOVERED BIAK CABLE",
      description: "SCRAP",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              var screnSize = MediaQuery.of(context).size;
              return SingleChildScrollView(
                child: Container(
                  width: screnSize.width,
                  height: screnSize.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/background_login_full.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: screnSize.width,
                      height: screnSize.height,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      child: ListView(
                        // physics: NeverScrollableScrollPhysics(),
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: CustomText(
                              text: 'TANK 1',
                            ),
                          ),
                          Container(
                            width: screnSize.width,
                            height: 550,
                            child: DataTable2(
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
                              rows: tank1
                                  .map(
                                    (e) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(e.no ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.label ?? ""),
                                        ),
                                        DataCell(
                                          Text(
                                            e.system ?? "",
                                            style: const TextStyle(
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(e.cabletype ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.manufacturer ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.amorigtype ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.coretype ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.core ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.length ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.inner ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.outer ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.tanklevel ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.remark ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.description ?? ""),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: CustomText(
                              text: 'TANK 2',
                            ),
                          ),
                          Container(
                            width: screnSize.width,
                            height: 550,
                            child: DataTable2(
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
                              rows: tank2
                                  .map(
                                    (e) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(e.no ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.label ?? ""),
                                        ),
                                        DataCell(
                                          Text(
                                            e.system ?? "",
                                            style: const TextStyle(
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(e.cabletype ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.manufacturer ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.amorigtype ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.coretype ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.core ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.length ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.inner ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.outer ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.tanklevel ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.remark ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.description ?? ""),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: CustomText(
                              text: 'TANK 3',
                            ),
                          ),
                          Container(
                            width: screnSize.width,
                            height: 550,
                            child: DataTable2(
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
                              rows: tank3
                                  .map(
                                    (e) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(e.no ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.label ?? ""),
                                        ),
                                        DataCell(
                                          Text(
                                            e.system ?? "",
                                            style: const TextStyle(
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(e.cabletype ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.manufacturer ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.amorigtype ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.coretype ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.core ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.length ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.inner ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.outer ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.tanklevel ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.remark ?? ""),
                                        ),
                                        DataCell(
                                          Text(e.description ?? ""),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
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
    );
  }
}
