import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayProvider extends ChangeNotifier {
  Future<List<Day>> _dayList;
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
    notifyListeners();
  }

  deleteAllDays() {
    DatabaseProvider.db.deleteAll();
    notifyListeners();
  }

  void increment59() {
    count59++;
    notifyListeners();
  }

  void decerement59() {
    if (count59 > 0) count59--;
    notifyListeners();
  }

  void incrementmMood() {
    if (moM <= 4) {
      moM++;
    }
    notifyListeners();
  }

  void decrementmMood() {
    if (moM > 0) {
      moM--;
    }
    notifyListeners();
  }

  void incrementafMood() {
    if (afM <= 4) {
      afM++;
    }
    notifyListeners();
  }

  void decrementafMood() {
    if (afM > 0) {
      afM--;
    }
    notifyListeners();
  }

  void incrementevMood() {
    if (evM <= 4) {
      evM++;
    }
    notifyListeners();
  }

  void decrementevMood() {
    if (evM > 0) {
      evM--;
    }
    notifyListeners();
  }

  void incrementnightMood() {
    if (nightM <= 4) {
      nightM++;
    }
    notifyListeners();
  }

  void decrementnightMood() {
    if (nightM > 0) {
      nightM--;
    }
    notifyListeners();
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

  void savTodb() {
    var now = new DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
       final String date = formatter.format(now);
      print(date);
      Day day = new Day(
          count59,
          moM,
         afM,
         evM,
          nightM,
         stressLevel,
         anxietyLevel,
          obsessionLevel,
         sleepLevel,
          dayOVScore,
          date);
    DatabaseProvider.db.insert(day);
    notifyListeners();
    }
}
