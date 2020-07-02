import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var count59 = 0;

class RadioGrp extends StatefulWidget {
  @override
  _RadioGrpState createState() => _RadioGrpState();
}

class _RadioGrpState extends State<RadioGrp> {

   int selectedRadio;
 setSelectedRadio(val){
   
   setState(() {
     selectedRadio=val;
   });
 }
  @override
  void initState() {
    selectedRadio = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
                      
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {setSelectedRadio(value);},
                            activeColor: Colors.pink,
                            groupValue: selectedRadio,
                            value: 1,
                          ),
                          Radio(
                            onChanged: (value) {setSelectedRadio(value);},
                            activeColor: Colors.pink,
                            groupValue: selectedRadio,
                            value: 2,
                          ),
                         Radio(
                            onChanged: (value) {setSelectedRadio(value);},
                            activeColor: Colors.pink,
                            groupValue: selectedRadio,
                            value: 3,
                          ),
                          Radio(
                            onChanged: (value) {setSelectedRadio(value);},
                            activeColor: Colors.pink,
                            groupValue: selectedRadio,
                            value: 4,
                          ),
                          Radio(
                            
                            onChanged: (value) {setSelectedRadio(value);},
                            activeColor: Colors.pink,
                            groupValue: selectedRadio,
                            value: 5,
                          ),
                        ],
                      ),
                    );
  }
}