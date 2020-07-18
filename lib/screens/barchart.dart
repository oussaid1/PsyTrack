import 'package:PsyTrack/block/day_bloc.dart';
import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/day_events/add_day.dart';
import 'package:PsyTrack/day_events/delete_day.dart';
import 'package:PsyTrack/day_events/set_day.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class ChartScreen extends StatefulWidget {
  static List<charts.Series<OrdinalSales, String>> _createSampleData(Day day) {
    final List<OrdinalSales> dayData = [
      new OrdinalSales(moodColors[0]['count59Color'], ':59', day.count59),
      new OrdinalSales(
          moodColors[0]['morningMoodColor'], 'mor-Mood', day.morningMood),
      new OrdinalSales(
          moodColors[0]['afternoonMoodColor'], 'aft-Mood', day.afternoonMood),
      new OrdinalSales(
          moodColors[0]['eveningMoodColor'], 'eve-Mood', day.eveningMood),
      new OrdinalSales(
          moodColors[0]['nightMoodColor'], 'night-Mood', day.nightMood),
      new OrdinalSales(moodColors[0]['stressLevelColor'], 'stress-Lv',
          day.stressLevel.toInt()),
      new OrdinalSales(moodColors[0]['anxietyLevelColor'], 'anxiety-Lv',
          day.anxietyLevel.toInt()),
      new OrdinalSales(moodColors[0]['obsessionLevelColor'], 'obss-Lv',
          day.obsessionLevel.toInt()),
      new OrdinalSales(
          moodColors[0]['sleepLevelColor'], 'sleep-Lv', day.sleepLevel.toInt()),
      new OrdinalSales(moodColors[0]['dayOVScoreColor'], 'day-scre',
          day.sleepLevel.toInt()),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: "DayStats",
        data: dayData,
        domainFn: (OrdinalSales dd, _) => dd.year,
        measureFn: (OrdinalSales dd, _) => dd.sales,
        colorFn: (OrdinalSales dd, _) => dd.barColor,
      )
    ];
  }

  @override
  _ChartScreenStateState createState() => _ChartScreenStateState();
}

class _ChartScreenStateState extends State<ChartScreen> {
  Day day;

  void savTodb() {}

  void deleteDay(BuildContext context, Day day, int index) {
    DatabaseProvider.db.delete(day.id).then((_) {
      BlocProvider.of<DayBloc>(context).add(
        DeleteDay(index),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    DatabaseProvider.db.getDays().then(
      (dayList) {
        BlocProvider.of<DayBloc>(context).add(SetDays(dayList));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final DayBloc dayBloc = BlocProvider.of<DayBloc>(context);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: BlocConsumer<DayBloc, List<Day>>(
        builder: (context, dayList) {
          return Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: dayList == null ? 0 : dayList.length,
                itemBuilder: (BuildContext context, int index) {
                  day = dayList[index];
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: <Widget>[
                        Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: primaryColor,
            height: 240,
            width: 300,
            padding: EdgeInsets.all(0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Day : ${day.date} ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                                              child: charts.BarChart(
                        ChartScreen._createSampleData(day),
                        animate: false,
                        domainAxis: charts.OrdinalAxisSpec(
                            renderSpec:
                                charts.SmallTickRendererSpec(
                                    labelRotation: 60)),
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
                },
              ),
            );
        },
        listener: (BuildContext context, dayList) {},
      ),
      
    );
  }
}

double dayMood(Day day) {
  return (day.morningMood +
          day.afternoonMood +
          day.eveningMood +
          day.nightMood) /
      4;
}

class OrdinalSales {
  final String year;
  final int sales;
  charts.Color barColor;

  OrdinalSales(this.barColor, this.year, this.sales);
}
