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
            Align(
              alignment: Alignment.center,
                          child: Container(
                width: 320,
                height: 200,
                margin: EdgeInsets.fromLTRB(20, 0, 0, 200),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/graph.png',
                        fit: BoxFit.fitWidth,
                        width: 220,
                        height: 180,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 14, 0, 2),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/images/moodemoji.png',
                          fit: BoxFit.fitWidth,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 70, 4, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('PsyTrack',
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Roboto',
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 140, 0, 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(180),
                      bottomLeft: Radius.circular(180)),
                  child: Container(
                    child: IconButton(
                      icon: Icon(Icons.arrow_right),

                      iconSize: 40,
                      onPressed: () {
                        Navigator.pushNamed(context, '/homescreen');
                      },
                    ),
                    color: secondaryColor,
                    width: 80,
                    height: 200,
                    alignment: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Dev-Bourheem \n Copyright\n 2020',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                      ),
                    )),
              ),
            )
          ],
        ));
  }
}
