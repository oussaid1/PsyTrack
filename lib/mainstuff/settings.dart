import 'package:flutter/material.dart';

Color primaryColor = Colors.teal[900];
Color secondaryColor = Color(0xAA62A3C2);
Color mainTextColor = Colors.white;
Color secondaryTextColor = Color(0xAAE0E0E0);
const MainTextStyle = TextStyle(
  fontSize: 24,
  color: Colors.yellow,
  fontWeight: FontWeight.w300,
);
const SubTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.w200,
);

List pieColors = [
  Colors.indigo[400],
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
];

List<Map> moods = [
  {
    'name': 'allDown',
    'allDownValue': 0,
    'iconPath': 'assets/images/alldown.png'
  },
  {'name': 'weak', 'weakValue': 2, 'iconPath': 'assets/images/low.png'},
  {'name': 'normal', 'normalValue': 3, 'iconPath': 'assets/images/normal.png'},
  {'name': 'good', 'goodValue': 4, 'iconPath': 'assets/images/good.png'},
  {
    'name': 'excillent',
    'excillentValue': 5,
    'iconPath': 'assets/images/excellent.png'
  }
];
