import 'package:PsyTrack/block/day_bloc.dart';
import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/day_events/set_day.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:PsyTrack/mainstuff/settings.dart';

class SimpleLineChart extends StatefulWidget {
  @override
  _SimpleLineChartState createState() => _SimpleLineChartState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, DateTime>> _createSampleData(
      List<Day> list) {
    final List<OrdinalSales> data = [];
    final List<OrdinalSales> data2 = [];
    final List<OrdinalSales> data3 = [];
    final List<OrdinalSales> data4 = [];
    final List<OrdinalSales> data5 = [];
    final List<OrdinalSales> data6 = [];
    final List<OrdinalSales> data7 = [];
    Day day;
    if (list.isNotEmpty) {
      for (var i = 0; i < list.length; i++) {
        day = list[i];
        data.add(
          new OrdinalSales(DateTime.parse(day.date), day.count59),
        );
        data2.add(
          new OrdinalSales(DateTime.parse(day.date), day.allDayMood.toInt()),
        );
        data3.add(
          new OrdinalSales(DateTime.parse(day.date), day.sleepLevel.toInt()),
        );
        data4.add(
          new OrdinalSales(DateTime.parse(day.date), day.anxietyLevel.toInt()),
        );
        data5.add(
          new OrdinalSales(
              DateTime.parse(day.date), day.obsessionLevel.toInt()),
        );
        data6.add(
          new OrdinalSales(DateTime.parse(day.date), day.sleepLevel.toInt()),
        );
        data7.add(
          new OrdinalSales(DateTime.parse(day.date), day.dayOVScore.toInt()),
        );
      }
    }
    return [
      new charts.Series<OrdinalSales, DateTime>(
        id: 'count59',
        colorFn: (_, __) => moodColors[0]['count59Color'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'allDayMood',
        colorFn: (_, __) => moodColors[0]['dayMoodColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data2,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'Stress',
        colorFn: (_, __) => moodColors[0]['stressLevelColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data3,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'Anxity',
        colorFn: (_, __) => moodColors[0]['anxietyLevelColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data4,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'Obsession',
        colorFn: (_, __) => moodColors[0]['obsessionLevelColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data5,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'Sleep',
        colorFn: (_, __) => moodColors[0]['sleepLevelColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data6,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'DayScore',
        colorFn: (_, __) => moodColors[0]['dayOVScoreColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data7,
      ),
    ];
  }
}

class _SimpleLineChartState extends State<SimpleLineChart> {
  /// Creates a [BarChart] with sample data and no transition.
  final List<Day> daysList = [];
  @override
  void initState() {
    DatabaseProvider.db.getDays().then(
      (dayList) {
        BlocProvider.of<DayBloc>(context).add(SetDays(dayList));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            color: Colors.yellow[50],
            child: row,
          ),
          Expanded(child: Hero(tag: 'line', child: LineChartWidget())),
        ],
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: BlocConsumer<DayBloc, List<Day>>(
            builder: (BuildContext context, List<Day> lista) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: new charts.TimeSeriesChart(
                  SimpleLineChart._createSampleData(lista),
                  animate: true,
                  dateTimeFactory: const charts.LocalDateTimeFactory(),
                ),
              );
            },
            listener: (BuildContext context, List<Day> state) {},
          ),
        ),
      ],
    );
  }
}

var row = Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Expanded(
              child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
                        child: Icon(
                Icons.sentiment_satisfied,
                color: moodColors[0]['count59NColor'],
              ),
            ),
            Expanded(
                        child: Text(':59',style: subtext2,),
            ),
            Expanded(
                        child: Icon(
                Icons.sentiment_satisfied,
                color: moodColors[0]['dayMoodNColor'],
              ),
            ),
            Expanded(
                        child: Text('DayMood',style: subtext2,),
            ),
            Expanded(
                        child: Icon(
                Icons.sentiment_satisfied,
                color: moodColors[0]['stressLevelNColor'],
              ),
            ),
            Expanded(
                        child: Text('Stress',style: subtext2,),
            ),
            Expanded(
                        child: Icon(
                Icons.sentiment_satisfied,
                color: moodColors[0]['anxietyLevelNColor'],
              ),
            ),
            Expanded(
                        child: Text('Anxty',style: subtext2,),
            ),
          ],
        ),
      ),
      Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
         
          Expanded(
                      child: Icon(
              Icons.sentiment_satisfied,
              color: moodColors[0]['obsessionLevelNColor'],
            ),
          ),
          Expanded(
                      child: Text('Obsess',style: subtext2,),
          ),
          Expanded(
                      child: Icon(
              Icons.sentiment_satisfied,
              color: moodColors[0]['sleepLevelNColor'],
            ),
          ),
          Expanded(
                      child: Text('Sleep',style: subtext2,),
          ),
          Expanded(
                      child: Icon(
              Icons.sentiment_satisfied,
              color: moodColors[0]['dayOVScoreNColor'],
            ),
          ),
          Expanded(
                      child: Text('DayScor',style: subtext2,),
          ),
          Expanded(
                      child: Icon(
              Icons.sentiment_satisfied,
              color: moodColors[0]['morningMoodNColor'],
            ),
          ),
          Expanded(
                      child: Text('data',style: subtext2,),
          ),
        ]),
      )
    ]);

/// Sample ordinal data type.
class OrdinalSales {
  final DateTime year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
