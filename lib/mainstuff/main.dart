import 'package:PsyTrack/block/day_block.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/screens/homescreen.dart';
import 'package:PsyTrack/screens/statsscreen.dart';
import 'package:PsyTrack/screens/welcomescreen.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
        theme: ThemeData(
            accentColor: secondaryTextColor,
            accentColorBrightness: Brightness.dark,
            appBarTheme: AppBarTheme(
              color: Colors.teal,
              elevation: 0,
              textTheme: TextTheme(
                bodyText1: blacktext,
              ),
            ),
            fontFamily: 'Roboto'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/welcome',
        routes: {
          '/welcome': (context) => WelcomeScreen(),
          '/homescreen': (context) => HomeScreen(),
          '/statsscreen': (context) => StatsScreen(),
        },
      ),
    );
  }
}
