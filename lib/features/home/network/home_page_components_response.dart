import 'package:burgan_poc/features/home/models/home_page_component_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_page_components_response.g.dart';

@JsonSerializable(createToJson: false)
class HomePageComponentsResponse {
  @JsonKey(name: "components", defaultValue: [])
  final List<HomePageComponentData> componentList;

  HomePageComponentsResponse({required this.componentList});

  factory HomePageComponentsResponse.fromJson(Map<String, dynamic> json) => _$HomePageComponentsResponseFromJson(json);
}
