import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

import 'package:telin_project/api/configAPI.dart';

class ChartData extends StatefulWidget {
  const ChartData({super.key});

  @override
  State<ChartData> createState() => _ChartDataState();
}

class onklik {}

class Sales {
  Function onClick;
  String year;
  int sales;
  Sales(this.year, this.sales, this.onClick);
}

class _ChartDataState extends State<ChartData> {
//   late List<Sales> _sa;
//   late List<Sales> _da;
//   late List<Sales> _sal;
//   late List<Sales> _lwp;
//   late List<Sales> _das;
//   late List<Sales> _lws;
//   late List<Sales> _lwa;
//   late List<Sales> _lw;
//   late List<charts.Series<Sales, String>> _chartdata;
//   void makeData() {
//     _sa = <Sales>[];
//     _da = <Sales>[];
//     _sal = <Sales>[];
//     _lwp = <Sales>[];
//     _das = <Sales>[];
//     _lws = <Sales>[];
//     _lwa = <Sales>[];
//     _lw = <Sales>[];

//     _chartdata = <charts.Series<Sales, String>>[];

//     {
//       _sa.add(Sales("MINISUB-36", 34543, () {}));
//       _da.add(Sales("MINISUB-36", 10000, () {}));
//       _sal.add(Sales("MINISUB-36", 12000, () {}));
//       _lwp.add(Sales("MINISUB-36", 9000, () {}));
//       _das.add(Sales("MINISUB-36", 100000, () {}));
//     }
//     {
//       _sa.add(Sales("MINISUB-R", 45645, () {}));
//       _da.add(Sales("MINISUB-R", 43645, () {}));
//       _sal.add(Sales("MINISUB-R", 8000, () {}));
//       _lwp.add(Sales("MINISUB-R", 5000, () {}));
//       _das.add(Sales("MINISUB-R", 8797, () {}));
//     }

//     {
//       _sa.add(Sales("OCC-4", 90899, () {}));
//       _da.add(Sales("OCC-4", 69889, () {}));
//       _sal.add(Sales("OCC-4", 8798, () {}));
//       _lwp.add(Sales("OCC-4", 78978, () {}));
//       _das.add(Sales("OCC-4", 89871, () {}));
//     }
//     {
//       _sa.add(Sales("OCC-SC22S", 23532, () {}));
//       _da.add(Sales("OCC-SC22S", 32432, () {}));
//       _sal.add(Sales("OCC-SC22S", 56544, () {}));
//       _lwp.add(Sales("OCC-SC22S", 76876, () {}));
//       _das.add(Sales("OCC-SC22S", 80989, () {}));
//     }

//     {
//       _sa.add(Sales("OCC-SC300", 4578, () {}));
//       _da.add(Sales("OCC-SC300", 78777, () {}));
//       _sal.add(Sales("OCC-SC300", 78976, () {}));
//       _lwp.add(Sales("OCC-SC300", 98089, () {}));
//       _das.add(Sales("OCC-SC300", 4644, () {}));
//     }
//     {
//       _sa.add(Sales("OCC-SC500", 5464, () {}));
//       _da.add(Sales("OCC-SC500", 4564, () {}));
//       _sal.add(Sales("OCC-SC500", 65767, () {}));
//       _lwp.add(Sales("OCC-SC500", 90987, () {}));
//       _das.add(Sales("OCC-SC500", 46455, () {}));
//     }
//     {
//       _sa.add(Sales("""OCC-SC500
// /SC-520""", 54754, () {}));
//       _da.add(Sales("""OCC-SC500
// /SC-520""", 7687, () {}));
//       _sal.add(Sales("""OCC-SC500
// /SC-520""", 78765, () {}));
//       _lwp.add(Sales("""OCC-SC500
// /SC-520""", 8777, () {}));
//       _das.add(Sales("""OCC-SC500
// /SC-520""", 54764, () {}));
//     }
//     {
//       _sa.add(Sales("OCC-SC530", 54745, () {}));
//       _da.add(Sales("OCC-SC530", 4444, () {}));
//       _sal.add(Sales("OCC-SC530", 5555, () {}));
//       _lwp.add(Sales("OCC-SC530", 55656, () {}));
//       _das.add(Sales("OCC-SC530", 45654, () {}));
//     }
//     {
//       _sa.add(Sales("OS-SS", 54754, () {}));
//       _da.add(Sales("OS-SS", 54746, () {}));
//       _sal.add(Sales("OS-SS", 6767, () {}));
//       _lwp.add(Sales("OS-SS", 76876, () {}));
//       _das.add(Sales("OS-SS", 76978, () {}));
//     }
//     {
//       _sa.add(Sales("URC-1", 76897, () {}));
//       _da.add(Sales("URC-1", 79899, () {}));
//       _sal.add(Sales("URC-1", 8908, () {}));
//       _lwp.add(Sales("URC-1", 1111, () {}));
//       _das.add(Sales("URC-1", 2222, () {}));
//     }

//     _chartdata.add(
//       charts.Series(
//           id: 'Sales',
//           colorFn: (datum, index) => charts.Color(r: 48, g: 120, b: 240),
//           data: _sa,
//           domainFn: (Sales sales, __) => sales.year,
//           measureFn: (Sales sales, __) => sales.sales,
//           displayName: 'Sales'),
//     );
//     _chartdata.add(
//       charts.Series(
//           id: 'Sales',
//           colorFn: (_, __) => charts.Color(r: 136, g: 108, b: 8),
//           data: _da,
//           domainFn: (Sales sales, __) => sales.year,
//           measureFn: (Sales sales, __) => sales.sales,
//           displayName: 'Sales'),
//     );
//     _chartdata.add(
//       charts.Series(
//           id: 'Sales',
//           colorFn: (_, __) => charts.Color(r: 202, g: 12, b: 12),
//           data: _sal,
//           domainFn: (Sales sales, __) => sales.year,
//           measureFn: (Sales sales, __) => sales.sales,
//           displayName: 'Sales'),
//     );
//     _chartdata.add(
//       charts.Series(
//           id: 'Sales',
//           colorFn: (_, __) => charts.Color(r: 19, g: 211, b: 61),
//           data: _lwp,
//           domainFn: (Sales sales, __) => sales.year,
//           measureFn: (Sales sales, __) => sales.sales,
//           displayName: 'Sales'),
//     );
//     _chartdata.add(
//       charts.Series(
//           id: 'Sales',
//           colorFn: (_, __) => charts.Color(r: 233, g: 68, b: 16),
//           data: _das,
//           domainFn: (Sales sales, __) => sales.year,
//           measureFn: (Sales sales, __) => sales.sales,
//           displayName: 'Sales'),
//     );
//   }

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  List<DropdownMenuItem<String>> get dropdownItemsGrafik {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Cable By Jumlah", child: Text("Cable By Jumlah")),
      const DropdownMenuItem(
          value: "Cable By Lenghth", child: Text("Cable By Length")),
    ];
    return menuItems;
  }

  String selectedValueGrafik = "Cable By Jumlah";

  @override
  void initState() {
    // TODO: implement initState

    showingTooltip = -1;
    getDataMinisub36();
  }

  List minisub36Sa = [];

  Response? response;

  var dio = Dio();
  void getDataMinisub36() async {
    try {
      response = await dio.get(getChart);

      setState(() {
        minisub36Sa = response!.data;
      });
    } catch (e) {
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     text: 'Terjadi Kesalahan Pada Server Kami',
      //     title: 'Peringatan',
      //     width: 400,
      //     confirmBtnColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  late int showingTooltip;

  BarChartGroupData generateGroupData(
    data,
    index,
  ) {
    return BarChartGroupData(
      x: int.parse(data['nomor']),
      showingTooltipIndicators:
          showingTooltip == int.parse(data['nomor']) ? [0] : [],
      barRods: [
        BarChartRodData(
          //SA

          color: data['armoring_types'][0]['armoring_type'] == "SA"
              ? const Color(0xff3078F0)
              : data['armoring_types'][0]['armoring_type'] == "DA"
                  ? const Color(0xff886C08)
                  : data['armoring_types'][0]['armoring_type'] == "SAL"
                      ? const Color(0xffCF0C18)
                      : data['armoring_types'][0]['armoring_type'] == "LWP"
                          ? const Color(0xff13D33D)
                          : data['armoring_types'][0]['armoring_type'] == "DAS"
                              ? const Color(0xffE94410)
                              : data['armoring_types'][0]['armoring_type'] ==
                                      "LWS"
                                  ? const Color(0xff2E2E2E)
                                  : data['armoring_types'][0]
                                              ['armoring_type'] ==
                                          "LWA"
                                      ? const Color(0xff9B1FC7)
                                      : data['armoring_types'][0]
                                                  ['armoring_type'] ==
                                              "LW"
                                          ? const Color(0xffFFBDBD)
                                          : null,
          toY: data['armoring_types'][0]['length'],
        ),
        BarChartRodData(
          //DA
          color: data['armoring_types'][1]['armoring_type'] == "SA"
              ? const Color(0xff3078F0)
              : data['armoring_types'][1]['armoring_type'] == "DA"
                  ? const Color(0xff886C08)
                  : data['armoring_types'][1]['armoring_type'] == "SAL"
                      ? const Color(0xffCF0C18)
                      : data['armoring_types'][1]['armoring_type'] == "LWP"
                          ? const Color(0xff13D33D)
                          : data['armoring_types'][1]['armoring_type'] == "DAS"
                              ? const Color(0xffE94410)
                              : data['armoring_types'][1]['armoring_type'] ==
                                      "LWS"
                                  ? const Color(0xff2E2E2E)
                                  : data['armoring_types'][1]
                                              ['armoring_type'] ==
                                          "LWA"
                                      ? const Color(0xff9B1FC7)
                                      : data['armoring_types'][1]
                                                  ['armoring_type'] ==
                                              "LW"
                                          ? const Color(0xffFFBDBD)
                                          : null,
          toY: data['armoring_types'][1]['length'] ?? 0,
        ),
        BarChartRodData(
          //SAL
          color: data['armoring_types'][2]['armoring_type'] == "SA"
              ? const Color(0xff3078F0)
              : data['armoring_types'][2]['armoring_type'] == "DA"
                  ? const Color(0xff886C08)
                  : data['armoring_types'][2]['armoring_type'] == "SAL"
                      ? const Color(0xffCF0C18)
                      : data['armoring_types'][2]['armoring_type'] == "LWP"
                          ? const Color(0xff13D33D)
                          : data['armoring_types'][2]['armoring_type'] == "DAS"
                              ? const Color(0xffE94410)
                              : data['armoring_types'][2]['armoring_type'] ==
                                      "LWS"
                                  ? const Color(0xff2E2E2E)
                                  : data['armoring_types'][2]
                                              ['armoring_type'] ==
                                          "LWA"
                                      ? const Color(0xff9B1FC7)
                                      : data['armoring_types'][2]
                                                  ['armoring_type'] ==
                                              "LW"
                                          ? const Color(0xffFFBDBD)
                                          : null,
          toY: data['armoring_types'][2]['length'] ?? 0,
        ),
        BarChartRodData(
          //LWP
          color: data['armoring_types'][3]['armoring_type'] == "SA"
              ? const Color(0xff3078F0)
              : data['armoring_types'][3]['armoring_type'] == "DA"
                  ? const Color(0xff886C08)
                  : data['armoring_types'][3]['armoring_type'] == "SAL"
                      ? const Color(0xffCF0C18)
                      : data['armoring_types'][3]['armoring_type'] == "LWP"
                          ? const Color(0xff13D33D)
                          : data['armoring_types'][3]['armoring_type'] == "DAS"
                              ? const Color(0xffE94410)
                              : data['armoring_types'][3]['armoring_type'] ==
                                      "LWS"
                                  ? const Color(0xff2E2E2E)
                                  : data['armoring_types'][3]
                                              ['armoring_type'] ==
                                          "LWA"
                                      ? const Color(0xff9B1FC7)
                                      : data['armoring_types'][3]
                                                  ['armoring_type'] ==
                                              "LW"
                                          ? const Color(0xffFFBDBD)
                                          : null,
          toY: data['armoring_types'][3]['length'] ?? 0,
        ),
        BarChartRodData(
          //DAS
          color: data['armoring_types'][4]['armoring_type'] == "SA"
              ? const Color(0xff3078F0)
              : data['armoring_types'][4]['armoring_type'] == "DA"
                  ? const Color(0xff886C08)
                  : data['armoring_types'][4]['armoring_type'] == "SAL"
                      ? const Color(0xffCF0C18)
                      : data['armoring_types'][4]['armoring_type'] == "LWP"
                          ? const Color(0xff13D33D)
                          : data['armoring_types'][4]['armoring_type'] == "DAS"
                              ? const Color(0xffE94410)
                              : data['armoring_types'][4]['armoring_type'] ==
                                      "LWS"
                                  ? const Color(0xff2E2E2E)
                                  : data['armoring_types'][4]
                                              ['armoring_type'] ==
                                          "LWA"
                                      ? const Color(0xff9B1FC7)
                                      : data['armoring_types'][4]
                                                  ['armoring_type'] ==
                                              "LW"
                                          ? const Color(0xffFFBDBD)
                                          : null,
          toY: data['armoring_types'][4]['length'] ?? 0,
        ),
        BarChartRodData(
          //LWS

          color: data['armoring_types'][5]['armoring_type'] == "SA"
              ? const Color(0xff3078F0)
              : data['armoring_types'][5]['armoring_type'] == "DA"
                  ? const Color(0xff886C08)
                  : data['armoring_types'][5]['armoring_type'] == "SAL"
                      ? const Color(0xffCF0C18)
                      : data['armoring_types'][5]['armoring_type'] == "LWP"
                          ? const Color(0xff13D33D)
                          : data['armoring_types'][5]['armoring_type'] == "DAS"
                              ? const Color(0xffE94410)
                              : data['armoring_types'][5]['armoring_type'] ==
                                      "LWS"
                                  ? const Color(0xff2E2E2E)
                                  : data['armoring_types'][5]
                                              ['armoring_type'] ==
                                          "LWA"
                                      ? const Color(0xff9B1FC7)
                                      : data['armoring_types'][5]
                                                  ['armoring_type'] ==
                                              "LW"
                                          ? const Color(0xffFFBDBD)
                                          : null,
          toY: data['armoring_types'][5]['length'] ?? 0,
        ),
        BarChartRodData(
          //LWA

          color: data['armoring_types'][6]['armoring_type'] == "SA"
              ? const Color(0xff3078F0)
              : data['armoring_types'][6]['armoring_type'] == "DA"
                  ? const Color(0xff886C08)
                  : data['armoring_types'][6]['armoring_type'] == "SAL"
                      ? const Color(0xffCF0C18)
                      : data['armoring_types'][6]['armoring_type'] == "LWP"
                          ? const Color(0xff13D33D)
                          : data['armoring_types'][6]['armoring_type'] == "DAS"
                              ? const Color(0xffE94410)
                              : data['armoring_types'][6]['armoring_type'] ==
                                      "LWS"
                                  ? const Color(0xff2E2E2E)
                                  : data['armoring_types'][6]
                                              ['armoring_type'] ==
                                          "LWA"
                                      ? const Color(0xff9B1FC7)
                                      : data['armoring_types'][6]
                                                  ['armoring_type'] ==
                                              "LW"
                                          ? const Color(0xffFFBDBD)
                                          : null,
          toY: data['armoring_types'][6]['length'] ?? 0,
        ),
        BarChartRodData(
          //LW
          color: data['armoring_types'][7]['armoring_type'] == "SA"
              ? const Color(0xff3078F0)
              : data['armoring_types'][7]['armoring_type'] == "DA"
                  ? const Color(0xff886C08)
                  : data['armoring_types'][7]['armoring_type'] == "SAL"
                      ? const Color(0xffCF0C18)
                      : data['armoring_types'][7]['armoring_type'] == "LWP"
                          ? const Color(0xff13D33D)
                          : data['armoring_types'][7]['armoring_type'] == "DAS"
                              ? const Color(0xffE94410)
                              : data['armoring_types'][7]['armoring_type'] ==
                                      "LWS"
                                  ? const Color(0xff2E2E2E)
                                  : data['armoring_types'][7]
                                              ['armoring_type'] ==
                                          "LWA"
                                      ? const Color(0xff9B1FC7)
                                      : data['armoring_types'][7]
                                                  ['armoring_type'] ==
                                              "LW"
                                          ? const Color(0xffFFBDBD)
                                          : null,
          toY: data['armoring_types'][7]['length'] ?? 0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int item = 0;
    return SizedBox(
      height: 327.6,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        const SizedBox(width: 90),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xff3078F0)),
                          child: Center(
                            child: Text("SA",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xff886C08)),
                          child: Center(
                            child: Text("DA",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xffCF0C18)),
                          child: Center(
                            child: Text("SAL",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xff13D33D)),
                          child: Center(
                            child: Text("LWP",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xffE94410)),
                          child: Center(
                            child: Text("DAS",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xff2E2E2E)),
                          child: Center(
                            child: Text("LWS",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xff9B1FC7)),
                          child: Center(
                            child: Text("LWA",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xffFFBDBD)),
                          child: Center(
                            child: Text("LW",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 102.6,
                    height: 28,
                    decoration: BoxDecoration(
                        color: const Color(0xffF0F0F0),
                        border: Border.all(color: const Color(0xffDADADA)),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          )
                        ]),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            style: GoogleFonts.montserrat(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValueGrafik = newValue!;
                              });
                            },
                            dropdownColor: const Color(0xffF0F0F0),
                            value: selectedValueGrafik,
                            items: dropdownItemsGrafik),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: BarChart(
            BarChartData(
              groupsSpace: 10,
              barGroups: List.generate(
                  minisub36Sa.length,
                  (index) => generateGroupData(
                        minisub36Sa[index],
                        index,
                      )),
              barTouchData: BarTouchData(
                  enabled: true,
                  handleBuiltInTouches: true,

                  // touchCallback: (event, response) {
                  //   if (response != null &&
                  //       response.spot != null &&
                  //       event is FlTapUpEvent) {
                  //     setState(() {
                  //       final x = response.spot!.touchedBarGroup.x;
                  //       final isShowing = showingTooltip == x;
                  //       if (isShowing) {
                  //         showingTooltip = -1;
                  //       } else {
                  //         showingTooltip = x;
                  //       }
                  //     });
                  //   }
                  // },
                  mouseCursorResolver: (event, response) {
                    return response == null || response.spot == null
                        ? MouseCursor.defer
                        : SystemMouseCursors.click;
                  }),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: getTitles,
                    reservedSize: 42,
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final titles = <String>[
      '',
      'OCC-SC500',
      'OAL C4',
      'MINISUB-36',
      'OCC-SC500/ SC-520',
      'URC-1',
      'OALC-4',
      'OCC-SC300',
      'OCC-SC530',
      'PIRELLI',
      'OCC-SC22S',
      'MINISUB - 36',
      'MINISUB-R',
      'OS-SS',
      '',
      'URC-2',
      'OCC-SC531'
    ];

    final Widget text = SizedBox(
      width: 50,
      child: Column(
        children: [
          Flexible(
            child: Text(
              titles[value.toInt()],
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0, //margin top
      child: text,
    );
  }
}
