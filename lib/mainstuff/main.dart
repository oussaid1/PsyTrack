import 'package:PsyTrack/block/day_bloc.dart';
import 'package:PsyTrack/screens/linechartscreen.dart';
import 'package:PsyTrack/screens/homescreen.dart';
import 'package:PsyTrack/screens/Itemlistscreen.dart';
import 'package:PsyTrack/screens/welcomescreen.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/screens/barchart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MultiBlocProvider(
  providers: [
    BlocProvider<DayBloc>(
      create: (BuildContext context) => DayBloc(),
    ),
   
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DayBloc>(
      create: (context) => DayBloc(),
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        initialRoute: '/welcome',
        routes: {
          '/welcome': (context) => WelcomeScreen(),
          '/homescreen': (context) => HomeScreen(),
          '/statsscreen': (context) => ItemListScreen(),
          '/chartscreen': (context) => AllChartScreen(),
          '/chartscreen2': (context) => SimpleLineChart(),
          

        },
      ),
    );
  }
}
