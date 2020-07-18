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
  static List<charts.Series<OrdinalSales, int>> _createSampleData(
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
        colorFn: (_, __) => moodColors[0]['count59Color'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 'allDayMood',
        colorFn: (_, __) => moodColors[0]['dayMoodColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data2,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 'Stress',
        colorFn: (_, __) => moodColors[0]['stressLevelColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data3,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 'Anxity',
        colorFn: (_, __) => moodColors[0]['anxietyLevelColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data4,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 'Obsession',
        colorFn: (_, __) => moodColors[0]['obsessionLevelColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data5,
      ),
      new charts.Series<OrdinalSales, int>(
        id: 'Sleep',
        colorFn: (_, __) => moodColors[0]['sleepLevelColor'],
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data6,
      ),
      new charts.Series<OrdinalSales, int>(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                                              child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.sentiment_satisfied,
                              color: moodColors[0]['count59NColor'],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text(':59'),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                                              child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.sentiment_satisfied,
                              color: moodColors[0]['dayMoodNColor'],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text('DayMood'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                                              child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.sentiment_satisfied,
                              color: moodColors[0]['stressLevelNColor'],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text('Stress'),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                                              child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.sentiment_satisfied,
                              color: moodColors[0]['anxietyLevelNColor'],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text('Anxiety'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                                              child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.sentiment_satisfied,
                              color: moodColors[0]['obsessionLevelNColor'],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text('Obsess'),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                                              child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.sentiment_satisfied,
                              color: moodColors[0]['sleepLevelNColor'],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text('Sleep'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.sentiment_satisfied,
                            color: moodColors[0]['dayOVScoreNColor'],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text('DayScore'),
                          )
                        ],
                      ),
                      Expanded(
                                              child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.sentiment_satisfied,
                              color: moodColors[0]['morningMoodNColor'],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text('data'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: BlocConsumer<DayBloc, List<Day>>(
              builder: (BuildContext context, List<Day> lista) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new charts.LineChart(
                    SimpleLineChart._createSampleData(lista),
                    animate: true,
                  ),
                );
              },
              listener: (BuildContext context, List<Day> state) {},
            ),
          ),
        ],
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
