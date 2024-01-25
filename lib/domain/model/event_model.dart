import 'package:flutter/material.dart';
import 'package:todo_calendar/presentation/screen/theme/colors.dart';

class Event {
  String title;
  Color color;
  int priority;
  String subText;

  Event({
    required this.title,
    required this.color,
    required this.priority,
    required this.subText,
  });

}