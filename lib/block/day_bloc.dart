

import 'package:PsyTrack/classobjects/day_model.dart';
import 'package:PsyTrack/day_events/add_day.dart';
import 'package:PsyTrack/day_events/day_event.dart';
import 'package:PsyTrack/day_events/delete_day.dart';
import 'package:PsyTrack/day_events/set_day.dart';
import 'package:PsyTrack/day_events/update_day.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayBloc extends Bloc<DayEvent, List<Day>> {
  @override
  List<Day> get initialState => List<Day>();

  @override
  Stream<List<Day>> mapEventToState(DayEvent event) async* {
    if (event is SetDays) {
      yield event.dayList;
    } else if (event is AddDay) {
      List<Day> newState = List.from(state);
      if (event.newDay != null) {
        newState.add(event.newDay);
      }
      yield newState;
    } else if (event is DeleteDay) {
      List<Day> newState = List.from(state);
      newState.removeAt(event.dayIndex);
      yield newState;
    } else if (event is UpdateDay) {
      List<Day> newState = List.from(state);
      newState[event.dayIndex] = event.newDay;
      yield newState;
    }
  }
}
