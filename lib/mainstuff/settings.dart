import 'package:flutter/material.dart';
class AppColors {
  static Color primaryColor = Color(0xFF62A3C2);
  static Color secondaryColor = Color(0xAA62A3C2);
  static Color mainTextColor = Color(0xAAF2C95D);
  static Color secondaryTextColor = Color(0xAAE0E0E0);

  static List pieColors = [
    Colors.indigo[400],
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.deepOrange,
    Colors.brown,
  ];
  
  List<Map> moods = [
  {'name': 'allDown','allDownValue': 0, 'iconPath': 'assets/images/alldown.png'},
  {'name': 'weak', 'weakValue': 2 ,'iconPath': 'assets/images/low.png'},
  {'name': 'normal', 'normalValue': 3 ,'iconPath': 'assets/images/normal.png'},
  {'name': 'good', 'goodValue': 4 ,'iconPath': 'assets/images/good.png'},
  {'name': 'excillent','excillentValue': 5 , 'iconPath': 'assets/images/excellent.png'}
];

}