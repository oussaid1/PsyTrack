import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:PsyTrack/sharedwidgets/card1.dart';
import 'package:PsyTrack/sharedwidgets/card2.dart';
import 'package:PsyTrack/sharedwidgets/card3.dart';
import 'package:PsyTrack/sharedwidgets/daycard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
double psyStateScore = 2;
double score = 0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    final dpv2 = Provider.of<DayProvider>(context, listen: false);
      var now = new DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
     
    void savTodb() {
       final String date = formatter.format(now);
      print(date);
      Day day = new Day(
          dpv2.count59,
          dpv2.moM,
          dpv2.afM,
          dpv2.evM,
          dpv2.nightM,
          dpv2.stressLevel,
          dpv2.anxietyLevel,
          dpv2.obsessionLevel,
          dpv2.sleepLevel,
          dpv2.dayOVScore,
          date);
      print(dpv2.count59.toString() +
          ',' +
          dpv2.moM.toString() +
          ',' +
          dpv2.afM.toString() +
          ',' +
          dpv2.evM.toString() +
          ',' +
          dpv2.nightM.toString() +
          ',' +
          dpv2.stressLevel.toString() +
          ',' +
          dpv2.anxietyLevel.toString() +
          ',' +
          dpv2.obsessionLevel.toString() +
          ',' +
          dpv2.sleepLevel.toString() +
          ',' +
          dpv2.dayOVScore.toString() +
          ',' +
          date.toString());
      dpv2.addDay(day);
    }

    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white70,
              ),
              onPressed: () => Navigator.pushNamed(context, '/statsscreen'),
            ),
            IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.white70,
              ),
              onPressed: () {
                savTodb();
              },
            )
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DayCard(),
              Cardone(),
              SecondCard(),
              ThirdCard(),
            ],
          ));
  }
}
