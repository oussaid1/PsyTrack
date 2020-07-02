import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/sharedwidgets/radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class SecondCard extends StatefulWidget {
  @override
  _SecondCardState createState() => _SecondCardState();
}

class _SecondCardState extends State<SecondCard> {
  int selectedRadio;
  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  void initState() {
    selectedRadio = 1;
    super.initState();
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Day-Moods',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(left: 4),
                    child: emojis(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Morning-Mood',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow[50],
                      ),
                    ),
                    RadioGrp(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Morning-Mood',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow[50],
                      ),
                    ),
                    RadioGrp(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Afternoon-Mood',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow[50],
                      ),
                    ),
                    RadioGrp(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Evening-Mood',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow[50],
                      ),
                    ),
                    RadioGrp(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget emojis() {
  return Padding(
    padding: const EdgeInsets.only(left:4.0,right: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new Image(
        image: new AssetImage(moods[2]['iconPath']),
        width: 30,
        height: 30,
        color: null,
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
          ),
          new Image(
        image: new AssetImage(moods[2]['iconPath']),
        width: 30,
        height: 30,
        color: null,
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
          ),
          new Image(
        image: new AssetImage(moods[2]['iconPath']),
        width: 30,
        height: 30,
        color: null,
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
          ),
          new Image(
        image: new AssetImage(moods[2]['iconPath']),
        width: 30,
        height: 30,
        color: null,
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
          ),
          new Image(
        image: new AssetImage(moods[2]['iconPath']),
        width: 30,
        height: 30,
        color: null,
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
          ),
      ],
    ),
  );
}
