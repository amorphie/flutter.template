import 'package:burgankuwait/features/set_security_picture/widgets/set_security_picture_form_widget/set_security_picture_form_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class SetSecurityPictureFormWidgetBuilder extends JsonWidgetBuilder {
  const SetSecurityPictureFormWidgetBuilder._({
    required this.transitionId,
    required this.buttonText,
    required this.imageUrlList,
  }) : super(numSupportedChildren: 0);

  static const type = 'set_security_picture_form_widget';

  final String transitionId;
  final String buttonText;
  final List<String> imageUrlList;

  static SetSecurityPictureFormWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return SetSecurityPictureFormWidgetBuilder._(
      transitionId: map["transition_id"] ?? "",
      buttonText: map["button_text"] ?? "",
      imageUrlList: List.castFrom(map["image_url_list"]),
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
      '[SetSecurityPictureFormWidgetBuilder] does not support children.',
    );

    return SetSecurityPictureFormWidget(
      transitionId: transitionId,
      buttonText: buttonText,
      imageUrlList: imageUrlList,
    );
  }
}
