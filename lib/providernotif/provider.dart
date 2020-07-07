import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:flutter/material.dart';


class DayProvider extends ChangeNotifier{
 Future <List<Day>> _dayList;
int daym=1;
DatabaseProvider databaseProvider=  DatabaseProvider();
  

  getDayz(){
 // _dayList.add(new Day(1,1,1,1,1,1,1,1,2,2,'dd'));
 _dayList=databaseProvider.getDays();
  return _dayList;
  }
  
  addDay(Day day){
    DatabaseProvider.db.insert( day);
    notifyListeners();
  }



}