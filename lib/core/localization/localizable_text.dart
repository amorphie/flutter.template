import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'localizable_text.g.dart';

@JsonSerializable(createToJson: false)
class LocalizableText {
  @JsonKey(name: "tr-TR", defaultValue: "")
  final String tr;

  @JsonKey(name: "en-EN", defaultValue: "")
  final String en;

  const LocalizableText({required this.tr, required this.en});

  factory LocalizableText.fromJson(Map<String, dynamic> json) => _$LocalizableTextFromJson(json);

  String localize(BuildContext context) {
    // TODO: Read localization bloc's current state and localize it
    return tr;
  }
}
