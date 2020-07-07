import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

var moM = 0;
var afM = 0;
var evM = 0;
var nightM = 0;

class SecondCard extends StatefulWidget {
  @override
  _SecondCardState createState() => _SecondCardState();
}

class _SecondCardState extends State<SecondCard> {
 void incrementMood() => setState(() {  if (moM < 4) {  moM++;  }  });
  decrement() => setState(() {    if (moM > 0) moM--;   });
incrementMood1() => setState(() {  if (afM < 4) {  afM++;  }  });
  decrement1() => setState(() {    if (afM > 0) afM--;   });

incrementMood2() => setState(() {  if (evM < 4) {  evM++;  }  });
  decrement2() => setState(() {    if (evM > 0) evM--;   });

incrementMood3() => setState(() {  if (nightM < 4) {  nightM++;  }  });
  decrement3() => setState(() {    if (nightM > 0) nightM--;   });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
      child: Card(
        elevation: 0,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                Text('Mood-State', style: MainTextStyle),
              ]),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Morning-Mood',
                          style: SubTextStyle,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Image(
                              image: new AssetImage(
                                  moods[moM]['iconPath']),
                              width: 30,
                              height: 30,
                              color: null,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                              ),
                              onPressed: () {
                                decrement();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 2, 4),
                              child: Text(
                                '$moM',
                                textAlign: TextAlign.center,
                                style: MainTextStyle,
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                ),
                                onPressed: () {
                                  incrementMood();
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Afternoon-Mood',
                            style: SubTextStyle,
                          ),
                        ),
                        Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Image(
                              image: new AssetImage(
                                  moods[afM]['iconPath']),
                              width: 30,
                              height: 30,
                              color: null,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                              ),
                              onPressed: () {
                                decrement1();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 2, 4),
                              child: Text(
                                '$afM',
                                textAlign: TextAlign.center,
                                style: MainTextStyle,
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                ),
                                onPressed: () {
                                  incrementMood1();
                                }),
                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Evening-Mood',
                            style: SubTextStyle,
                          ),
                        ),
                        Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Image(
                              image: new AssetImage(
                                  moods[evM]['iconPath']),
                              width: 30,
                              height: 30,
                              color: null,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                              ),
                              onPressed: () {
                                decrement2();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 2, 4),
                              child: Text(
                                '$evM',
                                textAlign: TextAlign.center,
                                style: MainTextStyle,
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                ),
                                onPressed: () {
                                  incrementMood2();
                                }),
                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Night-Mood',
                            style: SubTextStyle,
                          ),
                        ),
                        Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Image(
                              image: new AssetImage(
                                  moods[nightM]['iconPath']),
                              width: 30,
                              height: 30,
                              color: null,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                              ),
                              onPressed: () {
                                decrement3();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 2, 4),
                              child: Text(
                                '$nightM',
                                textAlign: TextAlign.center,
                                style: MainTextStyle,
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                ),
                                onPressed: () {
                                  incrementMood3();
                                }),
                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}



