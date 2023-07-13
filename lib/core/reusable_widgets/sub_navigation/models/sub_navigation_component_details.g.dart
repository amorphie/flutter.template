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
      navigationType: json['navigation-type'] as String? ?? '',
      displayNewBadge: json['new'] as bool? ?? false,
      active: json['active'] as bool? ?? false,
    );
