// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_navigation_component_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubNavigationComponentDetailsResponse
    _$SubNavigationComponentDetailsResponseFromJson(
            Map<String, dynamic> json) =>
        SubNavigationComponentDetailsResponse(
          componentDetailsList: (json['component-list'] as List<dynamic>?)
                  ?.map((e) => SubNavigationComponentDetails.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );
