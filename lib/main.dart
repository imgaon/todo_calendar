import 'package:flutter/material.dart';

import 'presentation/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans'
      ),
      home: HomeScreen(),
    )
  );
}
