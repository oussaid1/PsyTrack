import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';

 ThemeData myTheme = ThemeData(
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
    primarySwatch: Colors.teal[900],
    fontFamily: 'Roboto');

Color primaryColor = Colors.teal[900];
Color secondaryColor = Color(0xFFF2C94C);
Color secondaryTextColor = Colors.yellow[100];
final TextStyle maintext = TextStyle(
  color: (Color(0xFFF2C94C)),
  fontWeight: FontWeight.w200,
  fontSize: 22,
  fontFamily: 'Roboto',
);

final TextStyle subtext = TextStyle(
  color: (Colors.yellow[100]),
  fontWeight: FontWeight.w100,
  fontSize: 16,
);
final TextStyle maintext2 = TextStyle(
  color: Colors.teal[900],
  fontWeight: FontWeight.w600,
  fontSize: 20,
);

final TextStyle blacktext = TextStyle(
    color: (Colors.black),
    fontWeight: FontWeight.w100,
    fontFamily: 'Roboto',
    fontSize: 16);
final TextStyle blacktextBold = TextStyle(
    color: (Colors.black),
    fontWeight: FontWeight.w600,
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
