import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brg_signalr_transition.g.dart';

@JsonSerializable(createToJson: false)
class BrgSignalRTransition extends Equatable {
  @JsonKey(name: "transition")
  final String transitionId;

  @JsonKey(name: "page", defaultValue: {})
  final Map<String, dynamic> pageDetails;

  @JsonKey(name: "message", defaultValue: "")
  final String errorMessage;

  const BrgSignalRTransition({
    required this.transitionId,
    required this.pageDetails,
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [transitionId, pageDetails, errorMessage];

  factory BrgSignalRTransition.fromJson(Map<String, dynamic> json) => _$BrgSignalRTransitionFromJson(json);
}
