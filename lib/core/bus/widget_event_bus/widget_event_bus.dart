import 'package:burgankuwait/core/bus/widget_event_bus/widget_event.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class WidgetEventBus {
  final _eventBus = BehaviorSubject<WidgetEvent>();

  listen({
    required String eventId,
    required Function(WidgetEvent) onEventReceived,
  }) {
    _eventBus.stream.listen((event) {
      if (event.eventId == eventId) {
        onEventReceived(event);
      }
    });
  }

  addEvent(WidgetEvent event) {
    _eventBus.add(event);
  }
}
