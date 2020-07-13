import 'package:PsyTrack/block/day_block.dart';
import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/day_events/add_day.dart';
import 'package:PsyTrack/day_events/remove_day.dart';
import 'package:PsyTrack/day_events/set_days.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void savTodb() {
    Day day = new Day(7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 'hola');
    DatabaseProvider.db.insert(day).then(
          (storedFood) => BlocProvider.of<DayBloc>(context).add(
            AddDay(storedFood),
          ),
        );
  }

  void deleteDay(BuildContext context, Day day, int index) {
    DatabaseProvider.db.delete(day.id).then((_) {
      BlocProvider.of<DayBloc>(context).add(
        DeleteDay(index),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    DatabaseProvider.db.getDays().then(
      (dayList) {
        BlocProvider.of<DayBloc>(context).add(SetDays(dayList));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                savTodb();
              }),
        ],
      ),
      body: Container(
        child: BlocConsumer<DayBloc, List<Day>>(
          builder: (context, dayList) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              shrinkWrap: true,
              itemCount: dayList == null ? 0 : dayList.length,
              itemBuilder: (BuildContext context, int index) {
                Day day = dayList[index];
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
                            deleteDay(context, day, index);
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
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: secondaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                        ' 12',
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
          },
          listener: (BuildContext context, dayList) {},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
