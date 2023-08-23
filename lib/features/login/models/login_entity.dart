import 'package:burgankuwait/core/models/brg_phone_number.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_entity.g.dart';

@JsonSerializable()
class LoginEntity {
  @JsonKey(name: "reference")
  final String tckn;

  @JsonKey(name: "phone")
  final BrgPhoneNumber phoneNumber;

  LoginEntity({required this.tckn, required this.phoneNumber});

  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);

  factory LoginEntity.fromJson(Map<String, dynamic> json) => _$LoginEntityFromJson(json);

}
