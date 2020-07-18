import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

 ThemeData myThemed = ThemeData(
    accentColor: secondaryTextColor,
    accentColorBrightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: Colors.teal[900],
      elevation: 0,
      textTheme: TextTheme(
        bodyText1: blacktext,
      ),
    ),
    buttonColor: Colors.yellow[900],
    primarySwatch: Colors.white,
    fontFamily: 'Roboto');

Color primaryColor = Colors.teal[900];
Color secondaryColor = Color(0xFFF2C94C);
Color secondaryTextColor = Colors.teal[300];
final TextStyle maintext = TextStyle(
  color: Colors.teal[900],
 
  fontSize: 22,
  fontFamily: 'Roboto',
);

final TextStyle subtext = TextStyle(
  color: (Colors.black),
  
  fontSize: 16,
);
final TextStyle maintext2 = TextStyle(
  color: Colors.teal[900],
  
  fontSize: 20,
);

final TextStyle blacktext = TextStyle(
    color: (Colors.black),
    
    fontFamily: 'Roboto',
    fontSize: 16);
final TextStyle blacktextBold = TextStyle(
    color: (Colors.black),
    
    fontFamily: 'Roboto',
    fontSize: 18);

List pieColors = [
  Colors.indigo[400],
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
];
var icon1 = Icons.sentiment_very_dissatisfied;
var icon2 = Icons.sentiment_dissatisfied;
var icon3 = Icons.sentiment_neutral;
var icon4 = Icons.sentiment_satisfied;
var icon5 = Icons.sentiment_very_satisfied;

List<Map> moods = [
  {
    'name': 'allDown',
    'allDownValue': 0,
    'iconPath': 'assets/images/alldown.png',
  },
  {
    'name': 'allDown',
    'allDownValue': 0,
    'iconPath': 'assets/images/alldown.png',
  },
  {
    'name': 'weak',
    'weakValue': 2,
    'iconPath': 'assets/images/low.png',
  },
  {
    'name': 'normal',
    'normalValue': 3,
    'iconPath': 'assets/images/normal.png',
  },
  {
    'name': 'good',
    'goodValue': 4,
    'iconPath': 'assets/images/good.png',
  },
  {
    'name': 'excillent',
    'excillentValue': 5,
    'iconPath': 'assets/images/excellent.png',
  }
];
List<Map> moodColors = [
  {'count59Color':  charts.ColorUtil.fromDartColor(Colors.indigo[400]) ,
  'morningMoodColor':  charts.ColorUtil.fromDartColor(Colors.blue[400]) ,
  'afternoonMoodColor':  charts.ColorUtil.fromDartColor(Colors.amber[400]) ,
  'eveningMoodColor':  charts.ColorUtil.fromDartColor(Colors.green[400]) ,
  'nightMoodColor':  charts.ColorUtil.fromDartColor(Colors.deepOrange[400]) ,
  'stressLevelColor':  charts.ColorUtil.fromDartColor(Colors.red[400]) ,
  'anxietyLevelColor':  charts.ColorUtil.fromDartColor(Colors.pink[400]) ,
  'obsessionLevelColor':  charts.ColorUtil.fromDartColor(Colors.lime[400]) ,
  'sleepLevelColor':  charts.ColorUtil.fromDartColor(Colors.brown[400]) ,
  'dayOVScoreColor':  charts.ColorUtil.fromDartColor(Colors.blueAccent[400]) ,
  'dateColor':  charts.ColorUtil.fromDartColor(Colors.redAccent[400]) ,
  'dayMoodColor':  charts.ColorUtil.fromDartColor(Colors.grey[400]) },
  
];
