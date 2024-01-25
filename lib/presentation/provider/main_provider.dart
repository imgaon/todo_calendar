import 'dart:collection';

import 'package:todo_calendar/presentation/screen/theme/colors.dart';

import '../../domain/model/event_model.dart';

DateTime toDay = DateTime(
  DateTime.now().year,
  DateTime.now().month,
  DateTime.now().day,
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
};

class MainProvider {
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
