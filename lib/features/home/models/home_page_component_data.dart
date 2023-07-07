import 'package:json_annotation/json_annotation.dart';
part 'home_page_component_data.g.dart';

@JsonSerializable(createToJson: false)
class HomePageComponentData {
  @JsonKey(name: "name")
  final String? name;

  HomePageComponentData({this.name});

  factory HomePageComponentData.fromJson(Map<String, dynamic> json) => _$HomePageComponentDataFromJson(json);
}
