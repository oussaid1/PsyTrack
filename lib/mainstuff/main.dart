import 'package:PsyTrack/screens/homescreen.dart';
import 'package:PsyTrack/screens/statsscreen.dart';
import 'package:PsyTrack/screens/welcomescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

final wordPair = WordPair.random();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homescreen',
      routes: {
          
          '/welcome':(context)=>WelcomeScreen(),
          '/homescreen':(context)=>HomeScreen(),
          '/statsscreen':(context)=>StatsScreen(),
      }
     
    );
  }
}
