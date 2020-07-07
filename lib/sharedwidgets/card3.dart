import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

   int stressL=0;
   int anxL=0;
   int obssL=0;
   int sleeoL=0;
   int drsteOV=0;
class ThirdCard extends StatefulWidget {
  @override
  _ThirdCardState createState() => _ThirdCardState();
}

class _ThirdCardState extends State<ThirdCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
      child: Card(
        elevation: 0,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Psy-State',
                    style: MainTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Stress',
                        style: SubTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.star, size: 30, color: Colors.green[500]),
                          Icon(Icons.star, size: 30, color: Colors.green[500]),
                          Icon(Icons.star, size: 30, color: Colors.green[500]),
                          Icon(Icons.star, size: 30, color: Colors.black),
                          Icon(Icons.star, size: 30, color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Anxiety',
                      style: SubTextStyle,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.star, size: 30, color: Colors.green[500]),
                        Icon(Icons.star, size: 30, color: Colors.green[500]),
                        Icon(Icons.star, size: 30, color: Colors.green[500]),
                        Icon(Icons.star, size: 30, color: Colors.black),
                        Icon(Icons.star, size: 30, color: Colors.black),
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
                      'Obsession-Thts',
                      style: SubTextStyle,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.star, size: 30, color: Colors.green[500]),
                        Icon(Icons.star, size: 30, color: Colors.green[500]),
                        Icon(Icons.star, size: 30, color: Colors.green[500]),
                        Icon(Icons.star, size: 30, color: Colors.black),
                        Icon(Icons.star, size: 30, color: Colors.black),
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
                      'Sleep',
                      style: SubTextStyle,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.star, size: 30, color: Colors.green[500]),
                        Icon(Icons.star, size: 30, color: Colors.green[500]),
                        Icon(Icons.star, size: 30, color: Colors.green[500]),
                        Icon(Icons.star, size: 30, color: Colors.black),
                        Icon(Icons.star, size: 30, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
