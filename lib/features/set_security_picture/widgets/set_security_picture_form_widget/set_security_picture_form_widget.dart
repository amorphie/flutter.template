import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_image_selector/brg_image_selector_widget.dart';
import 'package:burgankuwait/core/widgets/brg_transition_listener/brg_transition_listener_widget.dart';
import 'package:burgankuwait/features/set_security_picture/bloc/set_security_picture_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetSecurityPictureFormWidget extends StatefulWidget {
  final String transitionId;
  final String buttonText;
  final List<String> imageUrlList;

  const SetSecurityPictureFormWidget({
    Key? key,
    required this.transitionId,
    required this.buttonText,
    required this.imageUrlList,
  }) : super(key: key);

  @override
  State<SetSecurityPictureFormWidget> createState() => _SetSecurityPictureFormWidgetState();
}

class _SetSecurityPictureFormWidgetState extends State<SetSecurityPictureFormWidget> {
  @override
  Widget build(BuildContext context) {
    return BrgTransitionListenerWidget(
      transitionId: widget.transitionId,
      onPageNavigation: (String navigationPath) => _handleNavigation(context, navigationPath),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildImageSelectorWidget(),
          _buildContinueButton(context),
        ],
      ),
    );
  }

  Widget _buildImageSelectorWidget() {
    return BrgImageSelectorWidget.network(
      urlList: widget.imageUrlList,
      onSelected: (index) {
        // TODO: Set selected security image ID
      },
    ).padding(top: 32);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: const LocalizableText(tr: "Devam", en: "Continue").localize(),
      onPressed: () {
        // TODO: Validate security picture selection
        context.read<SetSecurityPictureBloc>().add(
              SetSecurityPictureEventPressContinueButton(
                // TODO: Pass security image ID from API
                selectedPictureId: "43cdf94e-cb4a-41fc-8f27-f76e2a70aa20",
                transitionId: widget.transitionId,
              ),
            );
      },
    ).padding(top: 16);
  }

  void _handleNavigation(BuildContext context, String navigationPath) {
    NavigationHelper().navigate(
      context: context,
      navigationType: NavigationType.pushReplacement,
      path: navigationPath,
    );
  }
}
