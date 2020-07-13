
import 'package:PsyTrack/classobjects/day_model.dart';

import 'day_event.dart';


class SetDays extends DayEvent {
  List<Day> dayList;

  SetDays(List<Day> days) {
    dayList = days;
  }
}
