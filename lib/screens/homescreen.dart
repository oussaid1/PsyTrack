import 'package:PsyTrack/block/day_bloc.dart';
import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/day_events/add_day.dart';
import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

int count59 = 1;
int moM = 1;
int afM = 1;
int evM = 1;
int nightM = 1;
double allDayMood = 0;
double stressLevel = 0;
double anxietyLevel = 0;
double obsessionLevel = 0;
double sleepLevel = 0;
double dayOVScore = 0;
String date;
double dayScore = 0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void savTodb() {
      dayOVScore = (((moM + afM + evM + nightM)) +
          (stressLevel + anxietyLevel + obsessionLevel + sleepLevel) +
          dayScore);
      allDayMood = ((moM + afM + evM + nightM) / 4);

      var now = new DateTime.now();

      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String date = formatter.format(now);

      Day day = new Day(
          count59: count59,
          morningMood: moM,
          afternoonMood: afM,
          eveningMood: evM,
          nightMood: nightM,
          allDayMood: allDayMood,
          stressLevel: stressLevel,
          anxietyLevel: anxietyLevel,
          obsessionLevel: obsessionLevel,
          sleepLevel: sleepLevel,
          dayOVScore: dayOVScore,
          date: date);
      DatabaseProvider.db.insert(day).then(
            (storedDAy) => BlocProvider.of<DayBloc>(context).add(
              AddDay(storedDAy),
            ),
          );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white70,
              ),
              onPressed: () {
                savTodb();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white70,
              ),
              onPressed: () => Navigator.pushNamed(context, '/statsscreen'),
            ),
            IconButton(
              icon: Icon(
                Icons.show_chart,
                color: Colors.white70,
              ),
              onPressed: () => Navigator.pushNamed(context, '/chartscreen'),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            buildDayCard(),
            buildCardone(),
            buildSecondCard(),
            buildThirdCard(),
          ],
        ));
  }

  buildDayCard() {
    return Card(
      elevation: 0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                  child: Text('Day-Score', style: subtext),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: RatingBar(
                    initialRating: 0,
                    itemCount: 5,
                    itemSize: 26,
                    // ignore: missing_return
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: Colors.red,
                          );
                        case 1:
                          return Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.redAccent,
                          );
                        case 2:
                          return Icon(
                            Icons.sentiment_neutral,
                            color: Colors.amber,
                          );
                        case 3:
                          return Icon(
                            Icons.sentiment_satisfied,
                            color: Colors.lightGreen,
                          );
                        case 4:
                          return Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.green,
                          );
                      }
                    },
                    onRatingUpdate: (rating) {
                      setState(() {
                        dayScore = rating;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 4, 8, 2),
                    child: Text(
                      'Score : $dayScore',
                      style: subtext,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildCardone() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 2),
      child: Card(
        elevation: 0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Clock-Signs',
                      style: maintext,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '00:59',
                          style: subtext,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                                iconSize: 40,
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: () {
                                  setState(() {
                                    if (count59 > 0) {
                                      count59--;
                                    }
                                  });
                                }),
                            Text(
                              count59.toString(),
                              textAlign: TextAlign.center,
                              style: subtext,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_drop_up,
                                ),
                                iconSize: 40,
                                onPressed: () {
                                  setState(() {
                                    count59++;
                                  });
                                }),
                          ]),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }

  buildSecondCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
      child: Card(
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(children: <Widget>[
                Text('Mood-State', style: maintext),
              ]),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Morning-Mood',
                          style: subtext,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Image(
                              image: new AssetImage(moods[moM]['iconPath']),
                              width: 26,
                              height: 26,
                              color: null,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (moM > 0) {
                                    moM--;
                                  }
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 4, 2, 2),
                              child: Text(
                                moM.toString(),
                                textAlign: TextAlign.center,
                                style: subtext,
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (moM <= 4) {
                                      moM++;
                                    }
                                  });
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Afternoon-Mood',
                            style: subtext,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Image(
                                image: new AssetImage(moods[afM]['iconPath']),
                                width: 26,
                                height: 26,
                                color: null,
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.center,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_down,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (afM > 0) {
                                      afM--;
                                    }
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                                child: Text(
                                  afM.toString(),
                                  textAlign: TextAlign.center,
                                  style: subtext,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.thumb_up,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (afM <= 4) {
                                        afM++;
                                      }
                                    });
                                  }),
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
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Evening-Mood',
                            style: subtext,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Image(
                                image: new AssetImage(moods[evM]['iconPath']),
                                width: 26,
                                height: 26,
                                color: null,
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.center,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_down,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (evM > 0) {
                                      evM--;
                                    }
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                                child: Text(
                                  evM.toString(),
                                  textAlign: TextAlign.center,
                                  style: subtext,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.thumb_up,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (evM <= 4) {
                                        evM++;
                                      }
                                    });
                                  }),
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
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Night-Mood',
                            style: subtext,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Image(
                                image:
                                    new AssetImage(moods[nightM]['iconPath']),
                                width: 26,
                                height: 26,
                                color: null,
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.center,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_down,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (nightM > 0) {
                                      nightM--;
                                    }
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                                child: Text(
                                  nightM.toString(),
                                  textAlign: TextAlign.center,
                                  style: subtext,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.thumb_up,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (nightM <= 4) {
                                        nightM++;
                                      }
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }

  buildThirdCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 0, 4, 2),
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Psy-State',
                        style: maintext,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Stress',
                            style: subtext,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              RatingBar(
                                initialRating: 0,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 30,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: secondaryColor,
                                ),
                                onRatingUpdate: (rating) {
                                  stressLevel = toScore(rating);
                                  // psyStateScore=(((toScore(anxL) + toScore(stressL)+toScore(obssL )+(sleepL) ) ))  ;
                                },
                              ),
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
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Anxiety',
                          style: subtext,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RatingBar(
                              initialRating: 0,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 30,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: secondaryColor,
                              ),
                              onRatingUpdate: (rating) {
                                anxietyLevel = toScore(rating);
                              },
                            ),
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
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Obsession-Thts',
                          style: subtext,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RatingBar(
                              initialRating: 0,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 30,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: secondaryColor,
                              ),
                              onRatingUpdate: (rating) {
                                obsessionLevel = toScore(rating);
                              },
                            ),
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
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Sleep',
                          style: subtext,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RatingBar(
                              initialRating: 0,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 30,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: secondaryColor,
                              ),
                              onRatingUpdate: (rating) {
                                sleepLevel = rating;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double toScore(double d) {
    if (d < 1) {
      return 5;
    } else if (d < 2 && d >= 1) {
      return 4;
    }
    if (d < 3 && d >= 2) {
      return 3;
    }
    if (d < 4 && d >= 3) {
      return 2;
    }
    if (d < 5 && d >= 4) {
      return 1;
    }
    if (d >= 5) {
      return 0;
    } else {
      return 1;
    }
  }
}
