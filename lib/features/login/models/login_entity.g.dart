// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => LoginEntity(
      tckn: json['reference'] as String,
      phoneNumber:
          BrgPhoneNumber.fromJson(json['phone'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginEntityToJson(LoginEntity instance) =>
    <String, dynamic>{
      'reference': instance.tckn,
      'phone': instance.phoneNumber,
    };
