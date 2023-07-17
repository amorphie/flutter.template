// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_navigation_component_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubNavigationComponentDetails _$SubNavigationComponentDetailsFromJson(
        Map<String, dynamic> json) =>
    SubNavigationComponentDetails(
      displayName: json['display-name'] == null
          ? null
          : LocalizableText.fromJson(
              json['display-name'] as Map<String, dynamic>),
      icon: json['icon'] as String? ?? '',
      navigateTo: json['page'] as String? ?? '',
      navigationType: $enumDecodeNullable(
              _$NavigationTypeEnumMap, json['navigation-type']) ??
          NavigationType.go,
      displayNewBadge: json['new'] as bool? ?? false,
      active: json['active'] as bool? ?? false,
    );

const _$NavigationTypeEnumMap = {
  NavigationType.go: 'go',
  NavigationType.push: 'push',
  NavigationType.pushReplacement: 'push-replacement',
  NavigationType.replace: 'replace',
  NavigationType.popup: 'popup',
  NavigationType.bottomSheet: 'bottom-sheet',
};
