import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          child: SizedBox.expand(
            child: Image.asset(
              'assets/images/welcomescr.png',
              fit: BoxFit.fill,
            ),
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
      ],
    ));
  }
}