
import 'package:PsyTrack/classobjects/day_model.dart';

import 'day_event.dart';

class AddDay extends DayEvent {
  Day newDay;

  AddDay(Day day) {
    newDay = day;
  }
}
 