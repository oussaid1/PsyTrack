import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StatsScreen extends StatefulWidget {
  StatsScreen({Key key}) : super(key: key);

  @override
  _statsScreen createState() => _statsScreen();
}

// ignore: camel_case_types
class _statsScreen extends State<StatsScreen> {
  final DatabaseProvider dbmanager = new DatabaseProvider();

  Day day;
  List<Day> dList;
  int updateIndex;

  @override
  Widget build(BuildContext context) {
    final dpv2 = Provider.of<DayProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
              child: Text(
                "delete",
              ),
              onPressed: () {
                setState(() {
                  dpv2.deleteAllDays();
                });
                
              }),
        ],
      ),
      body: Consumer<DayProvider>(
        builder: (BuildContext context, value, Widget child) {
          return FutureBuilder(
            future: value.dayLists ,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                dList = snapshot.data;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: dList == null ? 0 : dList.length,
                  itemBuilder: (BuildContext context, int index) {
                    day = dList[index];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Slidable(
                        actions: <Widget>[
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.teal[300],
                            icon: Icons.delete,
                            onTap: () {
                              setState(() {
                                dbmanager.deleteAll();
                                dList.removeAt(index);
                              });
                            },
                          ),
                          IconSlideAction(
                            caption: 'Edit',
                            color: Colors.teal[500],
                            icon: Icons.edit,
                            onTap: () {},
                          ),
                        ],
                        actionPane: SlidableDrawerActionPane(),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: secondaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            'Day ',
                                            style: maintext2,
                                          ),
                                          Text(
                                            day.date.toString(),
                                            style: blacktext,
                                          ),
                                        ],
                                      ),
                                    ),
                                    new Divider(
                                      color: Colors.teal[900],
                                      thickness: 1,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Day-Mood',
                                            style: blacktext,
                                          ),
                                          Text(
                                            dpv2.getMood(day).toString(),
                                            style: blacktextBold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Stress-Level',
                                            style: blacktext,
                                          ),
                                          Text(
                                            day.stressLevel.toString(),
                                            style: blacktextBold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Anxiety-Level',
                                            style: blacktext,
                                          ),
                                          Text(
                                            day.anxietyLevel.toString(),
                                            style: blacktextBold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Obsession-Th',
                                            style: blacktext,
                                          ),
                                          Text(
                                            day.obsessionLevel.toString(),
                                            style: blacktextBold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Sleep-Level',
                                            style: blacktext,
                                          ),
                                          Text(
                                            day.sleepLevel.toString(),
                                            style: blacktextBold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Score: ',
                                              style: blacktext,
                                            ),
                                            Text(
                                              day.dayOVScore.toString(),
                                              style: blacktextBold,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    );
                  },
                );
              }
              return ListView(
                children: <Widget>[
                  Image.asset('assets/images/logo.png'),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
