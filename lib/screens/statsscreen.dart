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
  int updateIndex;
  

  @override
  Widget build(BuildContext context) {
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
                print(day.nightMood.toString());
              }),
        ],
      ),
      body: FutureBuilder(
                    future: dbmanager.getDays(),
                    builder: (context,snapshot){
                      if(snapshot.hasData) {
                        studlist = snapshot.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: studlist == null ?0 : studlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            day = studlist[index];
                           return Text('Name: ${day.morningMood.toString()}',);
                              
                          },

                        );
                      }
                      return new CircularProgressIndicator();
                    },                   
                  )
    );}
      
  }