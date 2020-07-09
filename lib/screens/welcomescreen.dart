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
                width: 300,
                height: 160,
                margin: EdgeInsets.fromLTRB(20, 0, 0, 200),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/images/graph.png',
                        fit: BoxFit.fitWidth,
                        width: 170,
                        height: 140,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 20, 60, 2),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/images/moodemoji.png',
                          fit: BoxFit.fitWidth,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 2, 4, 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('PsyTrack',
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 34,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 80, 0, 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(180),
                      bottomLeft: Radius.circular(180)),
                  child: Container(
                    child: IconButton(
                      icon: Icon(Icons.arrow_right),
                      color: primaryColor,
                      iconSize: 40,
                      onPressed: () {
                        Navigator.pushNamed(context, '/homescreen');
                      },
                    ),
                    color: secondaryColor,
                    width: 80,
                    height: 140,
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
                        color: secondaryTextColor,
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
