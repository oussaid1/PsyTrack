import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
        body: Stack(
          
      children: <Widget>[
        Container(
          
          margin: EdgeInsets.fromLTRB(2, 40, 2, 2),
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
            width: 300,
            height: 300,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              width: 90,
              height: 90,
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                color: Colors.grey[100],
                iconSize: 70,
                onPressed: () {
                  Navigator.pushNamed(context, '/homescreen');
                },
              ),
            ),
            
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child:
        Text('Dev-Bourheem \n Copyright\n 2020', textAlign :TextAlign.center)
        )
      ],
    ));
  }
}
