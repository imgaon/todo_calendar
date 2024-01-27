import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_calendar/presentation/screen/theme/colors.dart';

import '../../domain/model/event_model.dart';

DateTime toDay = DateTime.utc(
  DateTime.now().year,
  DateTime.now().month,
  DateTime.now().day,
);

DateTime testDay = DateTime.utc(
  DateTime.now().year,
  DateTime.now().month,
  25,
);

DateTime firstDay = DateTime(
  toDay.year - 10,
  toDay.month,
  toDay.day,
);

DateTime lastDay = DateTime(
  toDay.year + 10,
  toDay.month,
  toDay.day,
);

Map<DateTime, List<Event>> events = eventSource;

final eventSource = {
  toDay: [
    Event(
      title: '타이틀 1',
      color: redColor,
      priority: 1,
      subText: '서브 텍스트1',
    ),
    Event(
      title: '타이틀 2',
      color: yellowColor,
      priority: 2,
      subText: '서브 텍스트2',
    ),
    Event(
      title: '타이틀 3',
      color: greenColor,
      priority: 3,
      subText: '서브 텍스트3',
    ),
    Event(
      title: '타이틀 4',
      color: blueColor,
      priority: 4,
      subText: '서브 텍스트4',
    ),
    Event(
      title: '타이틀 5',
      color: indigoColor,
      priority: 5,
      subText: '서브 텍스트5',
    ),
  ],
  testDay: [
    Event(
      title: 'T타이틀 1',
      color: redColor,
      priority: 1,
      subText: 'T서브 텍스트1',
    ),
    Event(
      title: 'T타이틀 2',
      color: yellowColor,
      priority: 2,
      subText: 'T서브 텍스트2',
    ),
    Event(
      title: 'T타이틀 3',
      color: greenColor,
      priority: 3,
      subText: 'T서브 텍스트3',
    ),
  ],
};

// ViewModel
class HomeProvider extends ChangeNotifier {
  // 데이터
  bool _isSuccess1 = false;
  bool _isSuccess2 = false;
  bool _isSuccess3 = false;
  bool _isSuccess4 = false;
  bool _isSuccess5 = false;

  bool get isSuccess1 => _isSuccess1;

  bool get isSuccess2 => _isSuccess2;

  bool get isSuccess3 => _isSuccess3;

  bool get isSuccess4 => _isSuccess4;

  bool get isSuccess5 => _isSuccess5;

  set isSuccess2(bool value) {
    _isSuccess2 = value;
    notifyListeners();
  }

  set isSuccess3(bool value) {
    _isSuccess3 = value;
    notifyListeners();
  }

  set isSuccess4(bool value) {
    _isSuccess4 = value;
    notifyListeners();
  }

  set isSuccess5(bool value) {
    _isSuccess5 = value;
    notifyListeners();
  }

  set isSuccess1(bool value) {
    _isSuccess1 = value;
    notifyListeners();
  } // 기능

  static const List<String> months = [
    'Jan.',
    'Feb.',
    'Mar.',
    'Apr.',
    'May.',
    'Jun.',
    'Jul.',
    'Aug.',
    'Sep.',
    'Ocp.',
    'Nov.',
    'Dec.',
  ];

  static const List<String> dayOfWeeks = [
    'S',
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
  ];

  static String titleTextFormatter(DateTime date, dynamic locale) {
    final nowMonth = date.month.toInt() - 1;
    final month = date.month;
    final String monthAbbreviation = months[nowMonth];

    return '$monthAbbreviation  $month';
  }

  static String dowTextFormatter(DateTime date, dynamic locale) {
    final weekday = date.weekday == 7 ? 0 : date.weekday.toInt();
    final String weekAbbreviation = dayOfWeeks[weekday];

    return weekAbbreviation;
  }
}
