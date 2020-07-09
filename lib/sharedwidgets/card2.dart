import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';



class SecondCard extends StatefulWidget {
  @override
  _SecondCardState createState() => _SecondCardState();
}

class _SecondCardState extends State<SecondCard> {
  

  @override
  Widget build(BuildContext context) {
    final dpv1 = Provider.of<DayProvider>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
      child: Card(
        elevation: 2,
        color: primaryColor,
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
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                           Consumer<DayProvider>(
                              builder: (context, dpv1, child) {
                                return  new Image(
                              image: new AssetImage(moods[dpv1.moM ]['iconPath']),
                              width: 26,
                              height: 26,
                              color: null,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ); } ),
                            IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                              ),
                              onPressed: () {
                                dpv1.decrementmMood();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 4, 2, 2),
                              child: Consumer<DayProvider>(
                              builder: (context, dpv, child) {
                                return Text(
                                dpv1.moM.toString(),
                                textAlign: TextAlign.center,
                                style: subtext,
                              );}),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                ),
                                onPressed: () {
                                  dpv1.incrementmMood();
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
                          flex: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Consumer<DayProvider>(
                              builder: (context, dpv1, child) {
                                return  new Image(
                              image: new AssetImage(moods[dpv1.afM ]['iconPath']),
                              width: 26,
                              height: 26,
                              color: null,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ); } ),
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_down,
                                ),
                                onPressed: () {
                                  dpv1.decrementafMood();
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                                child: Consumer<DayProvider>(
                              builder: (context, dpv, child) {
                                return Text(
                                dpv1.afM.toString(),
                                textAlign: TextAlign.center,
                                style: subtext,
                              );}),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.thumb_up,
                                  ),
                                  onPressed: () {
                                    dpv1.incrementafMood();
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
                          flex: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Consumer<DayProvider>(
                              builder: (context, dpv1, child) {
                                return  new Image(
                              image: new AssetImage(moods[dpv1.evM ]['iconPath']),
                              width: 26,
                              height: 26,
                              color: null,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ); } ),
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_down,
                                ),
                                onPressed: () {
                                  dpv1.decrementevMood();
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                                child: Consumer<DayProvider>(
                              builder: (context, dpv, child) {
                                return Text(
                                dpv1.evM.toString(),
                                textAlign: TextAlign.center,
                                style: subtext,
                              );}),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.thumb_up,
                                  ),
                                  onPressed: () {
                                    dpv1.incrementevMood();
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
                          flex: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Consumer<DayProvider>(
                              builder: (context, dpv1, child) {
                                return  new Image(
                              image: new AssetImage(moods[dpv1.nightM ]['iconPath']),
                              width: 26,
                              height: 26,
                              color: null,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ); } ),
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_down,
                                ),
                                onPressed: () {
                                  dpv1.decrementnightMood();
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                                child: Consumer<DayProvider>(
                              builder: (context, dpv, child) {
                                return Text(
                                dpv1.nightM.toString(),
                                textAlign: TextAlign.center,
                                style: subtext,
                              );}),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.thumb_up,
                                  ),
                                  onPressed: () {
                                    dpv1.incrementnightMood();
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
}
