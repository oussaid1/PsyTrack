import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class PopulationData {
  int year;
  int population;
  charts.Color barColor;
  PopulationData({
    @required this.year, 
    @required this.population,
    @required this.barColor
  });
}
class SalesData {
  final int year;
  final int sales;

  SalesData(this.year, this.sales);
}
class BarChart extends StatelessWidget {

  // Defining the data
  final List<PopulationData> data = [
   
    PopulationData(
      year: 1920,
      population: 21537,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
    ),
    PopulationData(
      year: 1930,
      population: 2624,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
    ),
    PopulationData(
      year: 1940,
      population: 4569,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
    ),
  
  ];

  _getSeriesData() {
    List<charts.Series<PopulationData, String>> series = [
      charts.Series(
        id: "Population",
        data: data,
        domainFn: (PopulationData series, _) => series.year.toString(),
        measureFn: (PopulationData series, _) => series.population,
        colorFn: (PopulationData series, _) => series.barColor
      )
    ];
    return series;
  }
final data2 = [
    new SalesData(0, 150),
    new SalesData(1, 1735),
    new SalesData(2, 1670),
    new SalesData(3, 189),
    new SalesData(4, 190),
    new SalesData(5, 230),
    new SalesData(6, 236),
    new SalesData(7, 198),
    new SalesData(8, 265),
    
  ];
final data3 = [
    new SalesData(0, 35),
    new SalesData(1, 54),
    new SalesData(2, 477),
    new SalesData(3, 476),
    new SalesData(4, 44),
    new SalesData(5, 45),
    new SalesData(6, 456),
    new SalesData(7, 455),
    new SalesData(8, 467),
    
  ];

  _getSeriesData2() {
    List<charts.Series<SalesData, int>> series = [
      charts.Series(
        id: "Sales",
        data: data2,
        domainFn: (SalesData series, _) => series.year,
        measureFn: (SalesData series, _) => series.sales,
        colorFn: (SalesData series, _) => charts.MaterialPalette.blue.shadeDefault
      ),
      charts.Series(
        id: "errg",
        data: data3,
       
        domainFn: (SalesData series, _) => series.year,
        measureFn: (SalesData series, _) => series.sales,
        colorFn: (SalesData series, _) => charts.MaterialPalette.green.shadeDefault,
      )
    ];
    return series;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: <Widget>[
          Center(
          child: Container(
              height: 200,
              padding: EdgeInsets.all(20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Days Score",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20,),
                      Expanded(
                        child: charts.BarChart(
                          _getSeriesData(), 
                          animate: true,
                          domainAxis: charts.OrdinalAxisSpec(
                            renderSpec: charts.SmallTickRendererSpec(labelRotation: 60)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
           Center(
        child: Container(
          height:350,
          padding: EdgeInsets.all(10),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Sales of a company over the years",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: new charts.LineChart(_getSeriesData2() , animate: true,
                    domainAxis: charts.OrdinalAxisSpec(
                    
                      ),

                   ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
        ],
      ),
    );
  }
}