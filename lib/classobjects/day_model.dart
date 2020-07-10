import 'package:PsyTrack/database/sqlitemodel.dart';
import 'package:PsyTrack/providernotif/provider.dart';

class Day {
  int id;
  int count59;
  int morningMood;
  int afternoonMood;
  int eveningMood;
  int nightMood;
  double stressLevel;
  double anxietyLevel;
  double obsessionLevel;
  double sleepLevel;
  double dayOVScore;
  String date;

  Day(
      this.count59,
      this.morningMood,
      this.afternoonMood,
      this.eveningMood,
      this.nightMood,
      this.stressLevel,
      this.anxietyLevel,
      this.obsessionLevel,
      this.sleepLevel,
      this.dayOVScore,
      this.date);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      // DatabaseProvider.COLUMN_ID: id,
      DatabaseProvider.COLUMN_count59: count59,
      DatabaseProvider.COLUMN_morningMood: morningMood,
      DatabaseProvider.COLUMN_afternoonMood: afternoonMood,
      DatabaseProvider.COLUMN_eveningMood: eveningMood,
      DatabaseProvider.COLUMN_nightMood: nightMood,
      DatabaseProvider.COLUMN_stressLevel: stressLevel,
      DatabaseProvider.COLUMN_anxietyLevel: anxietyLevel,
      DatabaseProvider.COLUMN_obsessionLevel: obsessionLevel,
      DatabaseProvider.COLUMN_sleepLevel: sleepLevel,
      DatabaseProvider.COLUMN_overAllRate: dayOVScore,
      DatabaseProvider.COLUMN_date: date,
    };

    return map;
  }

  Day.fromMap(Map<String, dynamic> map) {
    // id = map[DatabaseProvider.COLUMN_ID];
    count59 = map[DatabaseProvider.COLUMN_count59];
    morningMood = map[DatabaseProvider.COLUMN_morningMood];
    afternoonMood = map[DatabaseProvider.COLUMN_afternoonMood];
    eveningMood = map[DatabaseProvider.COLUMN_eveningMood];
    nightMood = map[DatabaseProvider.COLUMN_nightMood];
    stressLevel = map[DatabaseProvider.COLUMN_stressLevel];
    anxietyLevel = map[DatabaseProvider.COLUMN_anxietyLevel];
    obsessionLevel = map[DatabaseProvider.COLUMN_obsessionLevel];
    sleepLevel = map[DatabaseProvider.COLUMN_sleepLevel];
    dayOVScore = map[DatabaseProvider.COLUMN_overAllRate];
    date = map[DatabaseProvider.COLUMN_date];
  }

  Day.fromProvider(DayProvider dayProvider) {
    count59 = dayProvider.count59;
    morningMood = dayProvider.moM;
    afternoonMood = dayProvider.afM;
    eveningMood = dayProvider.evM;
    nightMood = dayProvider.nightM;
    stressLevel = dayProvider.stressLevel;
    anxietyLevel = dayProvider.anxietyLevel;
    obsessionLevel = dayProvider.obsessionLevel;
    sleepLevel = dayProvider.sleepLevel;
    dayOVScore = dayProvider.dayOVScore;
    date = dayProvider.date;
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
    }
    return d;
  }

  int toScorex(int d) {
    switch (d) {
      case 0:
        return 5;
      case 1:
        return 4;
      case 2:
        return 3;
      case 3:
        return 2;
      case 4:
        return 1;
    }
    return d;
  }
}
