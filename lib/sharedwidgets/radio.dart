import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PsyTrack/mainstuff/settings.dart';

var count59 = 0;

class RadioGrp extends StatefulWidget {
  @override
  _RadioGrpState createState() => _RadioGrpState();
}

class _RadioGrpState extends State<RadioGrp> {
  int selectedemoji=0;
  incrementMood() {
    setState(() {
      if(selectedemoji<4){
        selectedemoji++;
      }
      
    });
  }

  decrement() {
    setState(() {
      if(selectedemoji>0)
      selectedemoji--;
    });
  }

  @override
  void initState() {
    selectedemoji = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Image(
              image: new AssetImage(moods[selectedemoji]['iconPath']),
              width: 30,
              height: 30,
              color: null,
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
            ),
            IconButton(icon: Icon(Icons.thumb_down,), onPressed:(){ decrement();},),
          Padding(
            padding: const EdgeInsets.fromLTRB(8,4,2,4),
            child: Text('$selectedemoji',
            textAlign: TextAlign.center,
            style:MainTextStyle ,
                
              ),
          ),
          IconButton(icon: Icon(Icons.thumb_up,), onPressed:(){ incrementMood();}),
        ],
      ),
    );
  }
}
