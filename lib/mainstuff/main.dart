import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:PsyTrack/screens/homescreen.dart';
import 'package:PsyTrack/screens/statsscreen.dart';
import 'package:PsyTrack/screens/welcomescreen.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<DayProvider>(create: (_) => DayProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DayProvider(),
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
            }));
  }
}
