import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:async';

class DatabaseProvider {
  static const String TABLE_Day = "DayTable";
  static const String COLUMN_ID = "id";
  static const String COLUMN_count59 = "count59";
  static const String COLUMN_morningMood = "morningMood";
  static const String COLUMN_afternoonMood = "afternoonMood";
  static const String COLUMN_eveningMood = "eveningMood";
  static const String COLUMN_nightMood = "nightMood";
  static const String COLUMN_allDayMood = "allDayMood";
  static const String COLUMN_stressLevel = "stressLevel";
  static const String COLUMN_anxietyLevel = "anxietyLevel";
  static const String COLUMN_obsessionLevel = "obsessionLevel";
  static const String COLUMN_sleepLevel = "sleepLevel";
  static const String COLUMN_overAllRate = "overAllRate";
  static const String COLUMN_date = "date";
 
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
   

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'DayDatabase.db'),
      version: 1,
      onCreate: (Database database, int version) async {
      

        await database.execute(
          "CREATE TABLE $TABLE_Day("
          "$COLUMN_ID INTEGER PRIMARY KEY autoincrement,"
          "$COLUMN_count59  INTEGER," 
          "$COLUMN_morningMood INTEGER,"
          "$COLUMN_afternoonMood INTEGER,"
          "$COLUMN_eveningMood INTEGER,"
          "$COLUMN_nightMood INTEGER,"
          "$COLUMN_allDayMood DOUBLE,"
          "$COLUMN_stressLevel DOUBLE,"
          "$COLUMN_anxietyLevel DOUBLE,"
          "$COLUMN_obsessionLevel DOUBLE,"
          "$COLUMN_sleepLevel DOUBLE,"
          "$COLUMN_overAllRate DOUBLE,"
          "$COLUMN_date TEXT)",
        );
      },
    );
  }
 
  Future<List<Day>> getDays() async {
    final db = await database;

    var days = await db.query(TABLE_Day, columns: [
      COLUMN_ID,
      COLUMN_count59,
      COLUMN_morningMood,
      COLUMN_afternoonMood,
      COLUMN_eveningMood,
      COLUMN_nightMood,
      COLUMN_allDayMood,
      COLUMN_stressLevel,
      COLUMN_anxietyLevel,
      COLUMN_obsessionLevel,
      COLUMN_sleepLevel,
      COLUMN_overAllRate,
      COLUMN_date,
    ]);

  List<Day> dayList = List<Day>();

    days.forEach((currentday) {
    Day day = Day.fromMap(currentday);
     
      dayList.add(day);
    });

    return dayList;
  }

  Future<Day> insert(Day day) async {
    final db = await database;
   //Day day = new Day(1,1,1,1,1,2,2,2,2,2,'499999');
    await db.insert(TABLE_Day, day.toMap());
    return day;
  }

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      TABLE_Day,
      where: "id = ?",
      whereArgs: [id],
    );
  }
  Future<int> deleteAll() async {
    final db = await database;
    return await db.rawDelete(
      TABLE_Day,
    );
  }

  Future<int> update(Day day) async {
    final db = await database;

    return await db.update(
      TABLE_Day,
      day.toMap(),
      where: "id = ?",
      whereArgs: [day.id],
    );
  }

  
}
