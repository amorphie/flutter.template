import 'package:burgan_poc/core/reusable_widgets/sub_navigation/models/sub_navigation_component_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_navigation_component_details_response.g.dart';

@JsonSerializable(createToJson: false)
class SubNavigationComponentDetailsResponse {
  @JsonKey(name: "component-list", defaultValue: [])
  final List<SubNavigationComponentDetails> componentDetailsList;

  factory SubNavigationComponentDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubNavigationComponentDetailsResponseFromJson(json);

  SubNavigationComponentDetailsResponse({required this.componentDetailsList});
}
