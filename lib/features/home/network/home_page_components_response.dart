import 'package:burgan_poc/core/component/component_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_page_components_response.g.dart';

@JsonSerializable(createToJson: false)
class HomePageComponentsResponse {
  @JsonKey(name: "components", defaultValue: [])
  final List<ComponentData> componentList;

  HomePageComponentsResponse({required this.componentList});

  factory HomePageComponentsResponse.fromJson(Map<String, dynamic> json) => _$HomePageComponentsResponseFromJson(json);
}
