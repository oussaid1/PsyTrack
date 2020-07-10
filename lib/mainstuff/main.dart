import 'package:PsyTrack/providernotif/provider.dart';
import 'package:PsyTrack/screens/homescreen.dart';
import 'package:PsyTrack/screens/statsscreen.dart';
import 'package:PsyTrack/screens/welcomescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DayProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DayProvider(),
      child:
      MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
          
          '/welcome':(context)=>WelcomeScreen(),
          '/homescreen':(context)=>HomeScreen(),
          '/statsscreen':(context)=>StatsScreen(),
      }
     
    ));
  }
}
