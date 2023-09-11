import 'package:burgankuwait/features/personal_info/widgets/personal_info_form_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

const int _defaultMinLength = 2;

class PersonalInfoFormWidgetBuilder extends JsonWidgetBuilder {
  const PersonalInfoFormWidgetBuilder._({
    required this.labelName,
    required this.labelSurname,
    required this.labelEmail,
    required this.buttonText,
    this.nameMinLength,
    this.surnameMinLength,
  }) : super(numSupportedChildren: 0);

  static const type = 'personal_info_form_widget';

  final String labelName;
  final String labelSurname;
  final String labelEmail;
  final String buttonText;
  final int? nameMinLength;
  final int? surnameMinLength;

  static PersonalInfoFormWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return PersonalInfoFormWidgetBuilder._(
      labelName: map["label_name"] ?? "",
      labelSurname: map["label_surname"] ?? "",
      labelEmail: map["label_email"] ?? "",
      buttonText: map["button_text"] ?? "",
      nameMinLength: map["name_min_length"],
      surnameMinLength: map["name_min_length"],
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[PersonalInfoFormWidgetBuilder] does not support children.',
    );

    return PersonalInfoFormWidget(
      labelName: labelName,
      labelSurname: labelSurname,
      labelEmail: labelEmail,
      buttonText: buttonText,
      nameMinLength: nameMinLength ?? _defaultMinLength,
      surnameMinLength: surnameMinLength ?? _defaultMinLength,
    );
  }
}
