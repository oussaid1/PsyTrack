import 'dart:developer';

import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PsyTrack/mainstuff/settings.dart';



enum CounterEvent { increment, decrement }

class Cardone extends StatefulWidget {
  @override
  _CardoneState createState() => _CardoneState();
}

class _CardoneState extends State<Cardone> {
  
  @override
  Widget build(BuildContext context) {
    DayProvider dpv = DayProvider();
    return Padding(
        padding: const EdgeInsets.fromLTRB(4, 0, 4, 2),
        child: Card(
      elevation: 2,
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: <Widget>[
          Text(
            'Clock-Signs',
            style: maintext,
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '00:59',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22,
                fontWeight: FontWeight.w200,
                color: Colors.yellow[100],
              ),
            ),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () =>
                       dpv.decerement59(),
                  ),
                   Text(dpv.count59.toString(),
                    textAlign: TextAlign.center,
                    style: subtext,),
                    
                  
                  
                  IconButton(
                      icon: Icon(
                        Icons.arrow_drop_up,
                      ),
                      iconSize: 40,
                      onPressed: () {
                        dpv.increment59();
                      }),
                ]),
          ),
        ],
      ),
    )
        ]),
    ),
      );
  }
}
