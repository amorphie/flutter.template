import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_navigation_component_details.g.dart';

@JsonSerializable(createToJson: false)
class SubNavigationComponentDetails {
  @JsonKey(name: "display-name")
  final LocalizableText? displayName;

  @JsonKey(name: "icon", defaultValue: "")
  final String icon;

  @JsonKey(name: "page", defaultValue: "")
  final String navigateTo;

  @JsonKey(name: "navigation-type", defaultValue: NavigationType.go)
  final NavigationType navigationType;

  @JsonKey(name: "new", defaultValue: false)
  final bool displayNewBadge;

  @JsonKey(name: "active", defaultValue: false)
  final bool active;

  factory SubNavigationComponentDetails.fromJson(Map<String, dynamic> json) =>
      _$SubNavigationComponentDetailsFromJson(json);

  SubNavigationComponentDetails({
    required this.displayName,
    required this.icon,
    required this.navigateTo,
    required this.navigationType,
    required this.displayNewBadge,
    required this.active,
  });
}
