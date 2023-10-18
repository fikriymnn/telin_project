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

  List chartData = [];

  Response? response;

  var dio = Dio();
  void getDataMinisub36() async {
    try {
      response = await dio.get(getChart);

      setState(() {
        chartData = response!.data;
      });
    } catch (e) {
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
                  chartData.length,
                  (index) => generateGroupData(
                        chartData[index],
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
