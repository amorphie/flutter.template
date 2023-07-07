// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_components_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageComponentsResponse _$HomePageComponentsResponseFromJson(
        Map<String, dynamic> json) =>
    HomePageComponentsResponse(
      componentList: (json['components'] as List<dynamic>?)
              ?.map((e) => ComponentData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
