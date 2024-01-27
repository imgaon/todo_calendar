import 'package:flutter/material.dart';
import 'package:todo_calendar/presentation/provider/home_provider.dart';

import 'presentation/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'NotoSans'),
    home: HomeScreen(
      homeProvider: HomeProvider(),
    ),
  ));
}
