import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var count59 = 0;

class Cardone extends StatefulWidget {
  @override
  _CardoneState createState() => _CardoneState();
}

class _CardoneState extends State<Cardone> {

  void increment() {
    setState(() {
      count59++;
    });
  }

  void decerement() {
    setState(() {
      if(count59>0)
      count59--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
      child: Card(
        color: primaryColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                child: Text(
                  'Clock-Signs',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.yellow,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '00:59',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '$count59',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Expanded(
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_drop_up,
                                ),
                                iconSize: 40,
                                onPressed: () {
                                  increment();
                                }),
                          ),
                          Expanded(
                            child: IconButton(
                              iconSize: 40,
                              icon: Icon(Icons.arrow_drop_down),
                              onPressed: () => decerement(),
                            ),
                          ),
                        ]))
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
