import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_calendar/presentation/provider/home_provider.dart';
import 'package:todo_calendar/presentation/screen/event_add_and_edit_screen.dart';
import 'package:todo_calendar/presentation/screen/theme/colors.dart';
import 'package:todo_calendar/presentation/screen/theme/text_style.dart';
import 'package:todo_calendar/presentation/screen/widget/dialog.dart';

import '../../domain/model/event_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void updateScreen() => setState(() {});
  late final ValueNotifier<List<Event>> _selectedEvents;
  late final EventSuccessDialog eventSuccessDialog;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  bool isSuccess1 = false;
  bool isSuccess2 = false;
  bool isSuccess3 = false;
  bool isSuccess4 = false;
  bool isSuccess5 = false;

  @override
  void initState() {
    super.initState();
    eventSuccessDialog = EventSuccessDialog();
    _selectedEvents = ValueNotifier(getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> getEventsForDay(DateTime day) {
    // print(day);
    // print(events[day]);

    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: appBar(),
      drawer: drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: tableCalendar()),
          renderEvent(),
        ],
      ),
    );
  }

  AppBar appBar() => AppBar(
        backgroundColor: background,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Text('${_focusedDay.year}', style: lightStyle),
          ),
        ],
      );

  Drawer drawer() => const Drawer(
        width: 200,
        child: Center(child: Text('준비중입니다.')),
      );

  TableCalendar tableCalendar() => TableCalendar(
        firstDay: firstDay,
        lastDay: lastDay,
        focusedDay: _focusedDay,
        eventLoader: getEventsForDay,
        headerStyle: headerStyle(),
        calendarStyle: calendarStyle(),
        daysOfWeekStyle: daysOfWeekStyle(),
        daysOfWeekHeight: 40,
        selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(selectedDay, _selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            _selectedEvents.value = getEventsForDay(_selectedDay!);
          }
        },
      );

  HeaderStyle headerStyle() => const HeaderStyle(
        headerPadding: EdgeInsets.symmetric(horizontal: 40),
        titleTextStyle: calendarTitle,
        titleTextFormatter: HomeProvider.titleTextFormatter,
        rightChevronVisible: false,
        leftChevronVisible: false,
        formatButtonVisible: false,
      );

  CalendarStyle calendarStyle() {
    BoxDecoration decoration({required Color color}) => BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        );

    return CalendarStyle(
      tablePadding: const EdgeInsets.symmetric(horizontal: 20),
      defaultTextStyle: lightStyle,
      weekendTextStyle: lightStyle,
      todayTextStyle: mediumStyle,
      outsideDaysVisible: false,
      markersMaxCount: 1,
      markerDecoration: decoration(color: secondary),
      selectedDecoration: decoration(color: primary),
      todayDecoration: decoration(color: background),
    );
  }

  DaysOfWeekStyle daysOfWeekStyle() => const DaysOfWeekStyle(
        dowTextFormatter: HomeProvider.dowTextFormatter,
        weekdayStyle: mediumStyle,
        weekendStyle: mediumStyle,
      );

  Widget renderEvent() => Column(
        children: [
          eventIndicator(),
          const SizedBox(height: 3),
          const Divider(color: primary, height: 1),
          const SizedBox(height: 10),
          eventBox(),
        ],
      );

  Widget eventIndicator() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_selectedDay!.year}년 ${_selectedDay!.month}월 ${_selectedDay!.day}일',
              style: lightStyle,
            ),
            Text(
              _selectedEvents.value.isEmpty
                  ? '0개'
                  : '${_selectedEvents.value.length}개',
              style: lightStyle,
            ),
          ],
        ),
      );

  Widget eventBox() => SizedBox(
      height: 320,
      child: _selectedEvents.value.isEmpty ? eventIsEmpty() : eventWidget());

  Widget eventIsEmpty() => const Center(
          child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text('아직 오늘 할 일이 없습니다.', style: lightStyle),
      ));

  Widget eventWidget() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (value.isNotEmpty) event1(value: value),
                        const SizedBox(width: 8),
                        if (value.length >= 2) event2(value: value),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (value.length >= 3) event3(value: value),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            if (value.length >= 4) event4(value: value),
                            const SizedBox(height: 10),
                            if (value.length >= 5) event5(value: value),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      );

  BoxDecoration eventDecoration(Color color, bool isSuccess) => BoxDecoration(
        border: Border.all(
          width: 1,
          color: isSuccess ? Colors.transparent : primary,
        ),
        borderRadius: BorderRadius.circular(15),
        color: isSuccess ? color : background,
      );

  Widget eventText(int idx, bool isSuccess) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _selectedEvents.value[idx].title,
            style: boldStyle.copyWith(color: isSuccess ? background : primary),
          ),
          Text(
            _selectedEvents.value[idx].title,
            style: lightStyle.copyWith(color: isSuccess ? background : primary),
          ),
        ],
      );

  Future<Future> eventAddAndEditPage() async => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EventAddAndEditScreen()),
      );

  Widget event1({required List<Event> value}) {
    Color color = value[0].color;

    return GestureDetector(
      onTap: () async {
        eventSuccessDialog.eventSuccessDialog(
          context,
          onResult: (bool isSuccess) {
            setState(() {
              isSuccess1 = isSuccess;
            });
          },
        );
      },
      onLongPress: eventAddAndEditPage,
      child: Container(
        width: 215,
        height: 150,
        decoration: eventDecoration(color, isSuccess1),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: eventText(0, isSuccess1),
        ),
      ),
    );
  }

  Widget event2({required List<Event> value}) {
    Color color = value[1].color;

    return GestureDetector(
      onTap: () {
        eventSuccessDialog.eventSuccessDialog(
          context,
          onResult: (bool isSuccess) {
            setState(() {
              isSuccess2 = isSuccess;
            });
          },
        );
      },
      onLongPress: eventAddAndEditPage,
      child: Container(
        width: 150,
        height: 150,
        decoration: eventDecoration(color, isSuccess2),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: eventText(1, isSuccess2),
        ),
      ),
    );
  }

  Widget event3({required List<Event> value}) {
    Color color = value[2].color;

    return GestureDetector(
      onTap: () {
        eventSuccessDialog.eventSuccessDialog(
          context,
          onResult: (bool isSuccess) {
            setState(() {
              isSuccess3 = isSuccess;
            });
          },
        );
      },
      onLongPress: eventAddAndEditPage,
      child: Container(
        width: 133,
        height: 150,
        decoration: eventDecoration(color, isSuccess3).copyWith(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: eventText(2, isSuccess3),
        ),
      ),
    );
  }

  Widget event4({required List<Event> value}) {
    Color color = value[3].color;

    return GestureDetector(
      onTap: () {
        eventSuccessDialog.eventSuccessDialog(
          context,
          onResult: (bool isSuccess) {
            setState(() {
              isSuccess4 = isSuccess;
            });
          },
        );
      },
      onLongPress: eventAddAndEditPage,
      child: Container(
        width: 230,
        height: 70,
        decoration: eventDecoration(color, isSuccess4),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: eventText(3, isSuccess4),
        ),
      ),
    );
  }

  Widget event5({required List<Event> value}) {
    Color color = value[4].color;

    return GestureDetector(
      onTap: () {
        eventSuccessDialog.eventSuccessDialog(
          context,
          onResult: (bool isSuccess) {
            setState(() {
              isSuccess5 = isSuccess;
            });
          },
        );
      },
      onLongPress: eventAddAndEditPage,
      child: Container(
        width: 230,
        height: 70,
        decoration: eventDecoration(color, isSuccess5).copyWith(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: eventText(4, isSuccess5),
        ),
      ),
    );
  }
}
