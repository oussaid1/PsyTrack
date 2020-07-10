import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:provider/provider.dart';

class StatsScreen extends StatefulWidget {
  StatsScreen({Key key}) : super(key: key);

  @override
  _statsScreen createState() => _statsScreen();
}

// ignore: camel_case_types
class _statsScreen extends State<StatsScreen> {
  final DatabaseProvider dbmanager = new DatabaseProvider();

  Day day;
  List<Day> studlist;
  List<Day> list;
  int updateIndex;

  @override
  Widget build(BuildContext context) {
    final dpv2 = Provider.of<DayProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
              child: Text(
                "next",
              ),
              onPressed: () {
                dpv2.deleteAllDays();
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: dbmanager.getDays(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                studlist = snapshot.data;
                return Container(
                  height: 400,
                  color: Colors.blue[100],
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: studlist == null ? 0 : studlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      day = studlist[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.sentiment_satisfied,
                              color: Colors.blue),
                        ),
                        title: Text(
                          'Name: ${snapshot.data[index].morningMood}',
                        ),
                        subtitle: Text(
                          'Nam ${snapshot.data[index].count59}',
                        ),
                        trailing: Text(
                          'Name: ${snapshot.data[index].date}',
                        ),
                      );
                    },
                  ),
                );
              }
              return new CircularProgressIndicator();
            },
          ),
           Text(
                      'Name: ',
                    ),
                
        ],
      ),
    );
  }
}
