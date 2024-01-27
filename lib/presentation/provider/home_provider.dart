import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_calendar/domain/repository/event_repository.dart';
import 'package:todo_calendar/domain/use_case/get_events_for_day_use_case.dart';
import 'package:todo_calendar/presentation/screen/home_state.dart';
import 'package:todo_calendar/presentation/screen/theme/colors.dart';

import '../../domain/model/event_model.dart';

final DateTime toDay = DateTime.utc(
  DateTime.now().year,
  DateTime.now().month,
  DateTime.now().day,
);

// ViewModel
class HomeProvider extends ChangeNotifier {
  final GetEventsForDayUseCase _getEventsForDayUseCase;

  HomeProvider({
    required GetEventsForDayUseCase getEventsForDayUseCase,
  }) : _getEventsForDayUseCase = getEventsForDayUseCase;


  // 데이터
  HomeState _state = HomeState(
    focusedDay: DateTime.now(),
    selectedDay: DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ),
    selectedEvents: [],
    firstDay: DateTime(
      toDay.year - 10,
      toDay.month,
      toDay.day,
    ),
    lastDay: DateTime(
      toDay.year + 10,
      toDay.month,
      toDay.day,
    ),
  );

  HomeState get state => _state;

  void setSuccessTitle1(bool isSuccess) {
    _state = state.copyWith(isSuccess1: isSuccess);
    notifyListeners();
  }

  void setSuccessTitle2(bool isSuccess) {
    _state = state.copyWith(isSuccess2: isSuccess);
    notifyListeners();
  }

  void setSuccessTitle3(bool isSuccess) {
    _state = state.copyWith(isSuccess3: isSuccess);
    notifyListeners();
  }

  void setSuccessTitle4(bool isSuccess) {
    _state = state.copyWith(isSuccess4: isSuccess);
    notifyListeners();
  }

  void setSuccessTitle5(bool isSuccess) {
    _state = state.copyWith(isSuccess5: isSuccess);
    notifyListeners();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _state = state.copyWith(
      selectedDay: selectedDay,
      focusedDay: focusedDay,
      selectedEvents: getEventsForDay(selectedDay),
    );
    notifyListeners();
  }

  void loadEvents(DateTime selectedDay) {
    _state = state.copyWith(
      selectedEvents: getEventsForDay(selectedDay),
    );
    notifyListeners();
  }

  List<Event> getEventsForDay(DateTime day) {
    // print(day);
    // print(events[day]);
    return _getEventsForDayUseCase.execute(day);
  }

}
