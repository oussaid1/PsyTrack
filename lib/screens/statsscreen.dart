import 'package:PsyTrack/sharedwidgets/card1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  StatsScreen({Key key}) : super(key: key);

  @override
  _statsScreen createState() => _statsScreen();
}

class _statsScreen extends State<StatsScreen> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
    
    );
  }
}