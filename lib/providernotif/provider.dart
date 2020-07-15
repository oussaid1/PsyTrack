import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayProvider    {
  Future<List<Day>> _dayList ;
  int count59 = 0;
  int moM = 3;
  int afM = 3;
  int evM = 5;
  int nightM = 3;
  double stressLevel = 1;
  double anxietyLevel = 1;
  double obsessionLevel = 1;
  double sleepLevel = 1;
  double _dayOVScore = 1;
  String date;
DayProvider();
 double dayScore = 0;

  double get dayOVScore {
    _dayOVScore = (((moM + afM + evM + nightM)) +
        (stressLevel + anxietyLevel + obsessionLevel + sleepLevel) +
        dayScore);
    return _dayOVScore - count59;
  }

  double getMood(Day day) =>
      (day.morningMood + day.afternoonMood + day.eveningMood + day.nightMood) /
      4;

  addDay(Day day) {
    DatabaseProvider.db.insert(day);
   
  }

  get dayLists  {
     _dayList = DatabaseProvider.db.getDays() ;
     
     return _dayList;
  }

  deleteDay(int index) {
    DatabaseProvider.db.delete(index);
  
   
  }

  deleteAllDays() {
    DatabaseProvider.db.deleteAll();
   
  }

  void increment59() {
    count59++;
   
  }

  void decerement59() {
    if (count59 > 0) count59--;
    
  }

  void incrementmMood() {
    if (moM <= 4) {
      moM++;
    }
    
  }

  void decrementmMood() {
    if (moM > 0) {
      moM--;
    }
   
  }

  void incrementafMood() {
    if (afM <= 4) {
      afM++;
    }
    
  }

  void decrementafMood() {
    if (afM > 0) {
      afM--;
    }
   
  }

  void incrementevMood() {
    if (evM <= 4) {
      evM++;
    }
    
  }

  void decrementevMood() {
    if (evM > 0) {
      evM--;
    }
    
  }

  void incrementnightMood() {
    if (nightM <= 4) {
      nightM++;
    }
   
  }

  void decrementnightMood() {
    if (nightM > 0) {
      nightM--;
    }
    
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
