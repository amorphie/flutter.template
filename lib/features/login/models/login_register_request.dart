import 'package:burgankuwait/features/login/models/login_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_register_request.g.dart';

@JsonSerializable(createFactory: false)
class LoginRegisterRequest {
  @JsonKey(name: "entityData")
  final LoginEntity entityData;

  @JsonKey(name: "formData")
  final String formData = "";

  @JsonKey(name: "additionalData")
  final String additionalData = "";

  @JsonKey(name: "getSignalRHub")
  final bool getSignalRHub = true;

  @JsonKey(name: "routeData")
  final String routeData = "";

  @JsonKey(name: "queryData")
  final String queryData = "";

  LoginRegisterRequest(this.entityData);

  Map<String, dynamic> toJson() => _$LoginRegisterRequestToJson(this);
}
