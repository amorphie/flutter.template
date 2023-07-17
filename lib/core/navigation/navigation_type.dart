import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NavigationType {
  @JsonValue('go')
  go('go'),

  @JsonValue('push')
  push('push'),

  @JsonValue('push-replacement')
  pushReplacement('push-replacement'),

  @JsonValue('replace')
  replace('replace'),

  @JsonValue('popup')
  popup('popup'),

  @JsonValue('bottom-sheet')
  bottomSheet('bottom-sheet');

  final String value;

  const NavigationType(this.value);
}
