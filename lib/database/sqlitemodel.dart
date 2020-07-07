import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String TABLE_Day = "Day";
  static const String COLUMN_ID = "id";
  static const String COLUMN_count59 = "count59";
  static const String COLUMN_morningMood = "morningMood";
  static const String COLUMN_afternoonMood = "afternoonMood";
  static const String COLUMN_eveningMood = "eveningMood";
  static const String COLUMN_nightMood = "nightMood";
  static const String COLUMN_stressLevel = "stressLevel";
  static const String COLUMN_anxietyLevel = "anxietyLevel";
  static const String COLUMN_obsessionLevel = "obsessionLevel";
  static const String COLUMN_sleepLevel = "sleepLevel";
  static const String COLUMN_overAllRate = "overAllRate";
  static const String COLUMN_date = "date";
  DatabaseProvider();
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("database getter called");

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'dayDB.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("Creating day table");

        await database.execute(
          "CREATE TABLE $TABLE_Day("
          "$COLUMN_ID INTEGER PRIMARY KEY autoincrement,"
          "$COLUMN_count59  INTEGER,"
          "$COLUMN_morningMood INTEGER,"
          "$COLUMN_afternoonMood INTEGER,"
          "$COLUMN_eveningMood INTEGER,"
          "$COLUMN_nightMood INTEGER,"
          "$COLUMN_stressLevel INTEGER,"
          "$COLUMN_anxietyLevel INTEGER,"
          "$COLUMN_obsessionLevel INTEGER,"
          "$COLUMN_sleepLevel INTEGER,"
          "$COLUMN_overAllRate INTEGER,"
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
      COLUMN_stressLevel,
      COLUMN_anxietyLevel,
      COLUMN_obsessionLevel,
      COLUMN_sleepLevel,
      COLUMN_overAllRate,
      COLUMN_date
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
    day.id = await db.insert(TABLE_Day, day.toMap());
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
