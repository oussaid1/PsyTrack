import 'package:PsyTrack/mainstuff/settings.dart';
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
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save), onPressed: null)
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
