import '../model/event_model.dart';

abstract interface class EventRepository {
  Map<DateTime, List<Event>> getEvents();
}