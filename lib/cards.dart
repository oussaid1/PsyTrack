import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoodCard extends StatefulWidget {
  @override
  _MoodCardState createState() => _MoodCardState();
}

class _MoodCardState extends State<MoodCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return firstCard();
  }
}

Widget firstCard() {
  return Container(
    alignment: Alignment.topCenter,
    child: Column(children: <Widget>[
      SizedBox(
        height: 100,
        child: Text('PsyTrack'),
      ),
      SizedBox(
          child: Row(
        children: <Widget>[
          Text('data'),
          Text('data'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.arrow_drop_up),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.arrow_drop_up),
            ),
          ),
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
          ),
        ],
      ))
    ]),
  );
}
