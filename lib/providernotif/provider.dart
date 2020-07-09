import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:flutter/material.dart';

class DayProvider extends ChangeNotifier {
  Future<List<Day>> _dayList;
  int _count59 = 0;
  int _moM = 0;
  int _afM = 0;
  int _evM = 0;
  int _nightM = 0;
  double _stressLevel;
  double _anxietyLevel;
  double _obsessionLevel;
  double _sleepLevel;
  double _dayOVScore;
  String _date;

	 DayProvider(
      this._count59,
      this._moM,
      this._afM,
      this._evM,
      this.nightMood,
      this.stressLevel,
      this.anxietyLevel,
      this.obsessionLevel,
      this.sleepLevel,
      this.dayOVScore,
      this.date);


  int get count => _count59;
  int get moM => _moM;
  int get afM => _afM;
  int get evM => _evM;
  int get nightM => _nightM;

  double get stressLevel=> _stressLevel;
  double get anxietyLevel=> _anxietyLevel;
  double get obsessionLevel=> _obsessionLevel;
  double get sleepLevel=> _sleepLevel;
  double get dayOVScore=> _dayOVScore;
  String get date=> _date;

  double get moodScore => (_moM + _afM + _evM + _nightM) / 4;

  getDayz() {
    _dayList = DatabaseProvider.db.getDays();
    return _dayList;
  }

  addDay(Day day) {
    DatabaseProvider.db.insert(day);
    notifyListeners();
  }

  void increment() {
    _count59++;
    notifyListeners();
  }

  void decerement() {
    if (_count59 > 0) _count59--;
    notifyListeners();
  }

  void incrementmMood() {
    if (_moM < 4) {
      _moM++;
    }
    notifyListeners();
  }

  void decrementmMood() {
    if (_moM < 4) {
      _moM--;
    }
    notifyListeners();
  }

  void incrementafMood() {
    if (_afM < 4) {
      _afM++;
    }
    notifyListeners();
  }

  void decrementafMood() {
    if (_afM < 4) {
      _afM--;
    }
    notifyListeners();
  }

  void incrementevMood() {
    if (_evM < 4) {
      _evM++;
    }
    notifyListeners();
  }

  void decrementevMood() {
    if (_evM < 4) {
      _evM--;
    }
    notifyListeners();
  }

  void incrementnightMood() {
    if (_nightM < 4) {
      _nightM++;
    }
    notifyListeners();
  }

  void decrementnightMood() {
    if (_nightM < 4) {
      _nightM--;
    }
    notifyListeners();
  }

  toScore(double d) {
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
    }
    return d;
  }
}
