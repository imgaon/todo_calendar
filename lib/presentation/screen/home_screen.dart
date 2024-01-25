import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_calendar/presentation/provider/main_provider.dart';
import 'package:todo_calendar/presentation/screen/theme/colors.dart';
import 'package:todo_calendar/presentation/screen/theme/text_style.dart';

import '../../domain/model/event_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  void initState() {
    super.initState();
    _selectedEvents = ValueNotifier(getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> getEventsForDay(DateTime day) {
    print(day);
    print(events[day]);

    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Text('${_focusedDay.year}', style: lightStyle),
          ),
        ],
      ),
      drawer: Drawer(
        child: Center(child: Text('준비중입니다.')),
        width: 200,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TableCalendar(
              firstDay: firstDay,
              lastDay: lastDay,
              focusedDay: _focusedDay,
              eventLoader: getEventsForDay,
              headerStyle: const HeaderStyle(
                  headerPadding: EdgeInsets.symmetric(horizontal: 40),
                  titleTextStyle: calendarTitle,
                  titleTextFormatter: MainProvider.titleTextFormatter,
                  rightChevronVisible: false,
                  leftChevronVisible: false,
                  formatButtonVisible: false),
              daysOfWeekHeight: 40,
              daysOfWeekStyle: const DaysOfWeekStyle(
                dowTextFormatter: MainProvider.dowTextFormatter,
                weekdayStyle: mediumStyle,
                weekendStyle: mediumStyle,
              ),
              calendarStyle: const CalendarStyle(
                tablePadding: EdgeInsets.symmetric(horizontal: 20),
                defaultTextStyle: lightStyle,
                outsideDaysVisible: false,
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primary,
                ),
                todayDecoration: BoxDecoration(shape: BoxShape.circle),
                todayTextStyle: mediumStyle,
                weekendTextStyle: lightStyle,
              ),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(selectedDay, _selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_selectedDay!.year}년 ${_selectedDay!.month}월 ${_selectedDay!.day}일',
                      style: lightStyle,
                    ),
                    Text('0개', style: lightStyle),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              const Divider(color: primary, height: 1),
              const SizedBox(height: 10),
              SizedBox(
                height: 320,
                child: Column(
                  children: [

                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget eventWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border:
                    Border.all(width: 1, color: primary),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text('$_selectedDay'),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: primary),
                  borderRadius: BorderRadius.circular(15),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border:
                    Border.all(width: 1, color: primary),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Container(
                    width: 230,
                    height: 70,
                    decoration: BoxDecoration(
                      border:
                      Border.all(width: 1, color: primary),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 230,
                    height: 70,
                    decoration: BoxDecoration(
                      border:
                      Border.all(width: 1, color: primary),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
