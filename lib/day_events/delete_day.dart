import 'day_event.dart';

class DeleteDay extends DayEvent {
  int dayIndex;

  DeleteDay(int index) {
    dayIndex = index;
  }
}
