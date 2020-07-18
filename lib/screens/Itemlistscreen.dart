import 'package:PsyTrack/block/day_bloc.dart';
import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/day_events/add_day.dart';
import 'package:PsyTrack/day_events/delete_day.dart';
import 'package:PsyTrack/day_events/set_day.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ItemListScreen extends StatefulWidget {
  ItemListScreen({Key key}) : super(key: key);

  @override
  _itemListScreen createState() => _itemListScreen();
}

// ignore: camel_case_types
class _itemListScreen extends State<ItemListScreen> {
  void savTodb() {}

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
    //final DayBloc dayBloc = BlocProvider.of<DayBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.show_chart), onPressed: () => Navigator.pushNamed(context, '/chartscreen2'),),
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
                        icon: Icons.delete,
                        onTap: () {
                          deleteDay(context, day, index);
                        },
                      ),
                      IconSlideAction(
                        caption: 'Edit',
                        icon: Icons.edit,
                        onTap: () {},
                      ),
                    ],
                    actionPane: SlidableDrawerActionPane(),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          
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
                                        dayMood(day).toString(),
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

double dayMood(Day day) {
  return (day.morningMood +
          day.afternoonMood +
          day.eveningMood +
          day.nightMood) /
      4;
}
