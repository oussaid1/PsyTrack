import 'package:PsyTrack/mainstuff/settings.dart';
import 'package:PsyTrack/providernotif/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';





class ThirdCard extends StatefulWidget {
  @override
  _ThirdCardState createState() => _ThirdCardState();
}

class _ThirdCardState extends State<ThirdCard> {

  buildScore(){
    
    // psyStateScore=(((toScore(anxL) + toScore(stressL)+toScore(obssL )+(sleepL) ) ))  ;
    //print(toScore(psyStateScore).toString());
    //print(anxL.toString());
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    final dpv3 = Provider.of<DayProvider>(context,listen: false);
 dpv3.stressLevel=1;
   dpv3.anxietyLevel=1;
   dpv3.obsessionLevel=1;
  dpv3.sleepLevel=1;
    return Expanded(
      flex: 1,
          child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 0, 4, 2),
        child: Card(
            elevation: 2,
            color: primaryColor,
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
                          initialRating: 3,
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
                           
                            dpv3.stressLevel = dpv3.toScore(rating);
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
                        initialRating: 3,
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
                       
                           dpv3.anxietyLevel =dpv3.toScore(rating);
                        
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
                        initialRating: 3,
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

                 dpv3.obsessionLevel = dpv3.toScore(rating);
             
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
                        initialRating: 3,
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
                          
                 dpv3.sleepLevel = rating;
              
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
}
