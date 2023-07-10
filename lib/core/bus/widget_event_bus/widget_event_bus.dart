import 'dart:async';

import 'package:burgan_poc/core/bus/widget_event_bus/widget_event.dart';
import 'package:injectable/injectable.dart';

@singleton
class WidgetEventBus {
  final _eventBus = StreamController<WidgetEvent>();

  listen({
    required String widgetId,
    required Function(WidgetEvent) onEventReceived,
  }) {
    _eventBus.stream.listen((event) {
      if (event.widgetId == widgetId) {
        onEventReceived(event);
      }
    });
  }

  addEvent(WidgetEvent event) {
    _eventBus.add(event);
  }
}
