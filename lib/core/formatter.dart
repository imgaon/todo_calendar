String titleTextFormatter(DateTime date, dynamic locale) {
  final List<String> months = [
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

  final nowMonth = date.month.toInt() - 1;
  final month = date.month;
  final String monthAbbreviation = months[nowMonth];

  return '$monthAbbreviation  $month';
}

String dowTextFormatter(DateTime date, dynamic locale) {
  final List<String> dayOfWeeks = [
    'S',
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
  ];

  final weekday = date.weekday == 7 ? 0 : date.weekday.toInt();
  final String weekAbbreviation = dayOfWeeks[weekday];

  return weekAbbreviation;
}
