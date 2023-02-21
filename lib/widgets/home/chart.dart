import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;


class ChartDataCuy extends StatefulWidget {
  const ChartDataCuy({super.key});

  @override
  State<ChartDataCuy> createState() => _ChartDataCuyState();
}

class Sales{
  String year;
  int sales;
  Sales(this.year,this.sales);
}


class _ChartDataCuyState extends State<ChartDataCuy> {
  late List<Sales>_sa;
  late List<Sales> _da;
  late List<Sales> _sal;
  late List<Sales> _lwp;
  late List<Sales> _das;
  late List<Sales> _lws;
  late List<Sales> _lwa;
  late List<Sales> _lw;
  late List _isi;
  late List<charts.Series<Sales,String>>_chartdata;
  void makeData(){
     _sa=<Sales>[];
   _da=<Sales>[];
   _sal=<Sales>[];
   _lwp=<Sales>[];
   _das=<Sales>[];
   _lws=<Sales>[];
   _lwa=<Sales>[];
   _lw=<Sales>[];

   _isi=[
    'MINISUB-36',
    'MINISUB-R',
    'OCC-4',
    'OCC-SC22S',
    'OCC-SC300',
    'OCC-SC500',
    'OCC-SC500/SC-520',
    'OCC-SC530',
    'OS-SS',
    'PIRELLI',
    'URC-1'
   ];

    _chartdata=<charts.Series<Sales,String>>[];
    final rnd=new Random();
    for(int i=2015;i<2026;i++){
      _sa.add(new Sales(i.toString(), rnd.nextInt(100000)));
      _da.add(new Sales(i.toString(), rnd.nextInt(100000)));
      _sal.add(new Sales(i.toString(), rnd.nextInt(100000)));
      _lwp.add(new Sales(i.toString(), rnd.nextInt(100000)));
      _das.add(new Sales(i.toString(), rnd.nextInt(100000)));
    }
    _chartdata.add(new charts.Series(id: 'Sales',
    
        colorFn: (_,__)=>charts.MaterialPalette.blue.shadeDefault,
        data: _sa,
        domainFn:  (Sales sales,__)=>sales.year,
        measureFn:  (Sales sales,__)=>sales.sales,
        displayName: 'Sales'),

    );
   _chartdata.add(new charts.Series(id: 'Sales',
       colorFn: (_,__)=>charts.MaterialPalette.lime.shadeDefault,
       data: _da,
       domainFn:  (Sales sales,__)=>sales.year,
       measureFn:  (Sales sales,__)=>sales.sales,
       displayName: 'Sales'),
       

   );
   _chartdata.add(new charts.Series(id: 'Sales',
       colorFn: (_,__)=>charts.MaterialPalette.red.shadeDefault,
       data: _sal,
       domainFn:  (Sales sales,__)=>sales.year,
       measureFn:  (Sales sales,__)=>sales.sales,
       displayName: 'Sales'),
       

   );
   _chartdata.add(new charts.Series(id: 'Sales',
       colorFn: (_,__)=>charts.MaterialPalette.green.shadeDefault,
       data: _lwp,
       domainFn:  (Sales sales,__)=>sales.year,
       measureFn:  (Sales sales,__)=>sales.sales,
       displayName: 'Sales'),
       

   );
   _chartdata.add(new charts.Series(id: 'Sales',
       colorFn: (_,__)=>charts.MaterialPalette.deepOrange.shadeDefault,
       data: _das,
       domainFn:  (Sales sales,__)=>sales.year,
       measureFn:  (Sales sales,__)=>sales.sales,
       displayName: 'Sales'),
       

   );
  }
  @override
  void initState() {
    // TODO: implement initState
    makeData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: new EdgeInsets.all(32.0),
        height: 327.6,
        child: new Column(
          children: <Widget>[
            new Text("My App"),
            new Expanded(child: new charts.BarChart(_chartdata)),
          ],
        ),
      );
  }
}

