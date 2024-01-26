import 'package:flutter/material.dart';

import 'theme/text_style.dart';

class EventAddAndEditScreen extends StatelessWidget {
  const EventAddAndEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('목표 설정하기', style: addAndEditTitle),
        centerTitle: true,
      ),
      body: const Center(child: Text('Event add and edit Screen')),
    );
  }
}
