import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:PsyTrack/sharedwidgets/card1.dart';
import 'package:PsyTrack/sharedwidgets/card2.dart';
import 'package:PsyTrack/sharedwidgets/card3.dart';
import 'package:PsyTrack/sharedwidgets/daycard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
double psyStateScore=2;
double score=0;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

   final dayprovider = DayProvider();
 // final count59 = dayprovider.count;
  Day day;

  final DatabaseProvider databaseProvider = new DatabaseProvider();
  DayProvider dayProvider = new DayProvider();

  

  @override
  Widget build(BuildContext context) {
    
    void savTodb(){
      final dpv2= Provider.of<DayProvider>(context);
      dpv2.moM;
      DayProvider() n = new DayProvider();
    }
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
               
              },
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DayCard(),
            Cardone(),
            SecondCard(),
            ThirdCard(),
          ],
        ));
  }
}
