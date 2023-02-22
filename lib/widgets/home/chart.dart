import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:google_fonts/google_fonts.dart';

class ChartDataCuy extends StatefulWidget {
  const ChartDataCuy({super.key});

  @override
  State<ChartDataCuy> createState() => _ChartDataCuyState();
}

class Sales {
  Function onClick;
  String year;
  int sales;
  Sales(this.year, this.sales, this.onClick);
}

class _ChartDataCuyState extends State<ChartDataCuy> {
  late List<Sales> _sa;
  late List<Sales> _da;
  late List<Sales> _sal;
  late List<Sales> _lwp;
  late List<Sales> _das;
  late List<Sales> _lws;
  late List<Sales> _lwa;
  late List<Sales> _lw;
  late List<charts.Series<Sales, String>> _chartdata;
  void makeData() {
    _sa = <Sales>[];
    _da = <Sales>[];
    _sal = <Sales>[];
    _lwp = <Sales>[];
    _das = <Sales>[];
    _lws = <Sales>[];
    _lwa = <Sales>[];
    _lw = <Sales>[];

    _chartdata = <charts.Series<Sales, String>>[];
    final rnd = new Random();
    {
      _sa.add(Sales("MINISUB-36", rnd.nextInt(10000), () {}));
      _da.add(Sales("MINISUB-36", rnd.nextInt(100000), () {}));
      _sal.add(Sales("MINISUB-36", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("MINISUB-36", rnd.nextInt(100000), () {}));
      _das.add(Sales("MINISUB-36", rnd.nextInt(100000), () {}));
    }
    {
      _sa.add(Sales("MINISUB-R", rnd.nextInt(100000), () {}));
      _da.add(Sales("MINISUB-R", rnd.nextInt(100000), () {}));
      _sal.add(Sales("MINISUB-R", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("MINISUB-R", rnd.nextInt(100000), () {}));
      _das.add(Sales("MINISUB-R", rnd.nextInt(100000), () {}));
    }

    {
      _sa.add(Sales("OCC-4", rnd.nextInt(100000), () {}));
      _da.add(Sales("OCC-4", rnd.nextInt(100000), () {}));
      _sal.add(Sales("OCC-4", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("OCC-4", rnd.nextInt(100000), () {}));
      _das.add(Sales("OCC-4", rnd.nextInt(100000), () {}));
    }
    {
      _sa.add(Sales("OCC-SC22S", rnd.nextInt(100000), () {}));
      _da.add(Sales("OCC-SC22S", rnd.nextInt(100000), () {}));
      _sal.add(Sales("OCC-SC22S", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("OCC-SC22S", rnd.nextInt(100000), () {}));
      _das.add(Sales("OCC-SC22S", rnd.nextInt(100000), () {}));
    }
    {
      _sa.add(Sales("MINISUB-36", rnd.nextInt(100000), () {}));
      _da.add(Sales("MINISUB-36", rnd.nextInt(100000), () {}));
      _sal.add(Sales("MINISUB-36", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("MINISUB-36", rnd.nextInt(100000), () {}));
      _das.add(Sales("MINISUB-36", rnd.nextInt(100000), () {}));
    }
    {
      _sa.add(Sales("OCC-SC300", rnd.nextInt(100000), () {}));
      _da.add(Sales("OCC-SC300", rnd.nextInt(100000), () {}));
      _sal.add(Sales("OCC-SC300", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("OCC-SC300", rnd.nextInt(100000), () {}));
      _das.add(Sales("OCC-SC300", rnd.nextInt(100000), () {}));
    }
    {
      _sa.add(Sales("OCC-SC500", rnd.nextInt(100000), () {}));
      _da.add(Sales("OCC-SC500", rnd.nextInt(100000), () {}));
      _sal.add(Sales("OCC-SC500", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("OCC-SC500", rnd.nextInt(100000), () {}));
      _das.add(Sales("OCC-SC500", rnd.nextInt(100000), () {}));
    }
    {
      _sa.add(Sales("OCC-SC500/SC-520", rnd.nextInt(100000), () {}));
      _da.add(Sales("OCC-SC500/SC-520", rnd.nextInt(100000), () {}));
      _sal.add(Sales("OCC-SC500/SC-520", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("OCC-SC500/SC-520", rnd.nextInt(100000), () {}));
      _das.add(Sales("OCC-SC500/SC-520", rnd.nextInt(100000), () {}));
    }
    {
      _sa.add(Sales("OCC-SC530", rnd.nextInt(100000), () {}));
      _da.add(Sales("OCC-SC530", rnd.nextInt(100000), () {}));
      _sal.add(Sales("OCC-SC530", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("OCC-SC530", rnd.nextInt(100000), () {}));
      _das.add(Sales("OCC-SC530", rnd.nextInt(100000), () {}));
    }
    {
      _sa.add(Sales("OS-SS", rnd.nextInt(100000), () {}));
      _da.add(Sales("OS-SS", rnd.nextInt(100000), () {}));
      _sal.add(Sales("OS-SS", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("OS-SS", rnd.nextInt(100000), () {}));
      _das.add(Sales("OS-SS", rnd.nextInt(100000), () {}));
    }
    {
      _sa.add(Sales("URC-1", rnd.nextInt(100000), () {}));
      _da.add(Sales("URC-1", rnd.nextInt(100000), () {}));
      _sal.add(Sales("URC-1", rnd.nextInt(100000), () {}));
      _lwp.add(Sales("URC-1", rnd.nextInt(100000), () {}));
      _das.add(Sales("URC-1", rnd.nextInt(100000), () {}));
    }
    _chartdata.add(
      charts.Series(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          data: _sa,
          domainFn: (Sales sales, __) => sales.year,
          measureFn: (Sales sales, __) => sales.sales,
          displayName: 'Sales'),
    );
    _chartdata.add(
      charts.Series(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.lime.shadeDefault,
          data: _da,
          domainFn: (Sales sales, __) => sales.year,
          measureFn: (Sales sales, __) => sales.sales,
          displayName: 'Sales'),
    );
    _chartdata.add(
      charts.Series(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          data: _sal,
          domainFn: (Sales sales, __) => sales.year,
          measureFn: (Sales sales, __) => sales.sales,
          displayName: 'Sales'),
    );
    _chartdata.add(
      charts.Series(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          data: _lwp,
          domainFn: (Sales sales, __) => sales.year,
          measureFn: (Sales sales, __) => sales.sales,
          displayName: 'Sales'),
    );
    _chartdata.add(
      charts.Series(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
          data: _das,
          domainFn: (Sales sales, __) => sales.year,
          measureFn: (Sales sales, __) => sales.sales,
          displayName: 'Sales'),
    );
  }

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  List<DropdownMenuItem<String>> get dropdownItemsGrafik {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("Cable By Jumlah"), value: "Cable By Jumlah"),
      DropdownMenuItem(
          child: Text("Cable By Length"), value: "Cable By Lenghth"),
    ];
    return menuItems;
  }

  @override
  void initState() {
    // TODO: implement initState
    makeData();
  }

  @override
  Widget build(BuildContext context) {
    String selectedValueGrafik = "Cable By Jumlah";
    return Container(
      height: 327.6,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 90),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff3078F0)),
                          child: Center(
                            child: Text("SA",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff886C08)),
                          child: Center(
                            child: Text("DA",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xffCF0C18)),
                          child: Center(
                            child: Text("SAL",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff13D33D)),
                          child: Center(
                            child: Text("LWP",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xffE94410)),
                          child: Center(
                            child: Text("DAS",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff2E2E2E)),
                          child: Center(
                            child: Text("LWS",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff9B1FC7)),
                          child: Center(
                            child: Text("LWA",
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 13.3,
                        ),
                        Container(
                          width: 25.3,
                          height: 12.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xffFFBDBD)),
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
                        color: Color(0xffF0F0F0),
                        border: Border.all(color: Color(0xffDADADA)),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 1),
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
                            dropdownColor: Color(0xffF0F0F0),
                            value: selectedValueGrafik,
                            items: dropdownItemsGrafik),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: charts.BarChart(
            _chartdata,
          )),
        ],
      ),
    );
  }
}
