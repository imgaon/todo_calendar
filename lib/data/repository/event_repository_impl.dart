import 'package:todo_calendar/domain/model/event_model.dart';
import 'package:todo_calendar/domain/repository/event_repository.dart';

import '../../presentation/screen/theme/colors.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Map<DateTime, List<Event>> getEvents() {
    final DateTime toDay = DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    DateTime testDay = DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      25,
    );

    return {
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
  }
}
