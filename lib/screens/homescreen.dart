import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:PsyTrack/sharedwidgets/card1.dart';
import 'package:PsyTrack/sharedwidgets/card2.dart';
import 'package:PsyTrack/sharedwidgets/card3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

   Day day;
   
   

  final DatabaseProvider databaseProvider = new DatabaseProvider();
   DayProvider dayProvider = new DayProvider();
  
  addDayToDb() {
    
     day = new Day(6,6,6,6,6,6,6,6,6,6,'fff');
     day.toMap();
     List<Day> list= new List<Day>();
    
     DatabaseProvider.db.insert(day);
    print(evM.toString());
    //dayProvider.addDay(day);
  }

  @override
  Widget build(BuildContext context) {
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
                addDayToDb();
                
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Cardone(),
            SecondCard(),
            ThirdCard(),
          ],
        ));
  }
}
