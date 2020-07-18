import 'package:PsyTrack/block/day_bloc.dart';
import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/day_events/set_day.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBarChart extends StatefulWidget {
  @override
  _SimpleBarChartState createState() => _SimpleBarChartState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, int>> _createSampleData(
      List<Day> list) {
    final  List<OrdinalSales> data = [];
    final List<OrdinalSales> data2 = [];
    final List<OrdinalSales> data3 = [];
    final List<OrdinalSales> data4 = [];
    final List<OrdinalSales> data5 = [];
    final List<OrdinalSales> data6 = [];
    final List<OrdinalSales> data7 = [];
   Day day;
   if(list.isNotEmpty){
    for (var i = 0; i < list.length; i++) {
      day=list[i];
      data.add(
        new OrdinalSales(i, day.count59),
      );
      data2.add(
        new OrdinalSales(i, day.allDayMood.toInt()),
      );
      data3.add(
        new OrdinalSales(i, day.sleepLevel.toInt()),
      );
      data4.add(
        new OrdinalSales(i, day.anxietyLevel.toInt()),
      );
      data5.add(
        new OrdinalSales(i, day.obsessionLevel.toInt()),
      );
      data6.add(
        new OrdinalSales(i, day.sleepLevel.toInt()),
      );
      data7.add(
        new OrdinalSales(i, day.dayOVScore.toInt()),
      );
    }
   }
    return [
      new charts.Series<OrdinalSales, int>(
        id: 'count59',
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Colors.redAccent[400]),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 'fd',
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Colors.blueGrey[400]),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data2,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 's',
        
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data3,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 'r',
        
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data4,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 'g',
        
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data5,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 'j',
        
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data6,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 'js',
        
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data7,
      ),
    ];
  }
}

class _SimpleBarChartState extends State<SimpleBarChart> {
  /// Creates a [BarChart] with sample data and no transition.
  final List<Day> daysList = [];
@override
  void initState() {
 DatabaseProvider.db.getDays().then(
      (dayList) {
        BlocProvider.of<DayBloc>(context).add(SetDays(dayList));
      },
    );    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<DayBloc, List<Day>>(
                              builder: (BuildContext context, List<Day> lista) {  
                              
                               return new charts.LineChart(
                  SimpleBarChart._createSampleData(lista),
                  animate: true,
                );
                              }, listener: (BuildContext context, List<Day> state) {  },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final int year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
