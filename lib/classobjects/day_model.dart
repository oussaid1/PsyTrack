import 'package:PsyTrack/database/sqlitemodel.dart';

class Day {
  int id;
  int count59;
  int morningMood;
  int afternoonMood;
  int eveningMood;
  int nightMood;
  int stressLevel;
  int anxietyLevel;
  int obsessionLevel;
  int sleepLevel;
  int overAllRate;
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
      this.overAllRate,
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
      DatabaseProvider.COLUMN_overAllRate: overAllRate,
      DatabaseProvider.COLUMN_date: date,
    };

    return map;
  }

  Day.fromMap(Map<String, dynamic> map) {
     id = map[DatabaseProvider.COLUMN_ID];
    count59 = map[DatabaseProvider.COLUMN_count59];
    morningMood = map[DatabaseProvider.COLUMN_morningMood];
    afternoonMood = map[DatabaseProvider.COLUMN_afternoonMood];
    eveningMood = map[DatabaseProvider.COLUMN_eveningMood];
    nightMood = map[DatabaseProvider.COLUMN_nightMood];
    stressLevel = map[DatabaseProvider.COLUMN_stressLevel];
    anxietyLevel = map[DatabaseProvider.COLUMN_anxietyLevel];
    obsessionLevel = map[DatabaseProvider.COLUMN_obsessionLevel];
    sleepLevel = map[DatabaseProvider.COLUMN_sleepLevel];
    overAllRate = map[DatabaseProvider.COLUMN_overAllRate];
    date = map[DatabaseProvider.COLUMN_date];
  }
}
