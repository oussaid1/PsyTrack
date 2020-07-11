import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:PsyTrack/sharedwidgets/card1.dart';
import 'package:PsyTrack/sharedwidgets/card2.dart';
import 'package:PsyTrack/sharedwidgets/card3.dart';
import 'package:PsyTrack/sharedwidgets/daycard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    final dpv2 = Provider.of<DayProvider>(context, listen: false);
     
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
              onPressed: () {
                dpv2.savTodb();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white70,
              ),
              onPressed: () => Navigator.pushNamed(context, '/statsscreen'),
            ),
          ],
        ),
        body: ListView(
            children: <Widget>[
              DayCard(),
              Cardone(),
              SecondCard(),
              ThirdCard(),
            ],
          ));
  }
}
