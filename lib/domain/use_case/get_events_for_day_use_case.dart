import '../model/event_model.dart';
import '../repository/event_repository.dart';

class GetEventsForDayUseCase {
  final EventRepository _eventRepository;

  GetEventsForDayUseCase({
    required EventRepository eventRepository,
  }) : _eventRepository = eventRepository;

  List<Event> execute(DateTime day) {
    return _eventRepository.getEvents()[day] ?? [];
  }
}