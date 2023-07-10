import 'dart:async';

import 'package:burgan_poc/core/bus/widget_event_bus/base_widget_event.dart';
import 'package:injectable/injectable.dart';

@singleton
class WidgetEventBus {
  final _eventBus = StreamController<BaseWidgetEvent>();

  listen({
    required String widgetId,
    required Function(BaseWidgetEvent) onEventReceived,
  }) {
    _eventBus.stream.listen((event) {
      if (event.widgetId == widgetId) {
        onEventReceived(event);
      }
    });
  }

  addEvent(BaseWidgetEvent event) {
    _eventBus.add(event);
  }
}
