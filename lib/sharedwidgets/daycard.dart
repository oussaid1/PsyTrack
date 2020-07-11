import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:PsyTrack/screens/homescreen.dart';
import 'package:PsyTrack/sharedwidgets/card3.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';



class DayCard extends StatefulWidget {
  @override
  _DayCardState createState() => _DayCardState();
  
}

class _DayCardState extends State<DayCard> {
  @override
  void initState() {
    // TODO: implement initState
     
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dpv4 = Provider.of<DayProvider>(context,listen: false);
    return Card(
        elevation: 8,
        color: primaryColor,
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
                    dpv4.dayScore = rating;
                  });
                 
                  
                },
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 4, 8, 2),
                  child: Consumer<DayProvider>(
                    builder: (context, dpv, child) {
                    return Text('Score : ${dpv.dayScore}', style: subtext);},),
                )),
          ],
        ),
      ),
    ],
        ),
      );
  }
}
