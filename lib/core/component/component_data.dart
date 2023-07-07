import 'package:json_annotation/json_annotation.dart';
part 'component_data.g.dart';

@JsonSerializable(createToJson: false)
class ComponentData {
  @JsonKey(name: "name")
  final String? id;

  ComponentData({this.id});

  factory ComponentData.fromJson(Map<String, dynamic> json) => _$ComponentDataFromJson(json);
}
