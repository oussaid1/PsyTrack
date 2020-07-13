
import 'package:PsyTrack/classobjects/day_model.dart';

import 'day_event.dart';

class UpdateDay extends DayEvent {
  Day newDay;
  int dayIndex;

  UpdateDay(int index, Day day) {
    newDay = day;
    dayIndex = index;
  }
}
