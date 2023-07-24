import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgankuwait/core/reusable_widgets/terms_and_conditions/terms_and_conditions_widget.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - AppConstants.appBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTermsAndConditionsWidget(context),
              _buildTermsAndConditionsWidget(context),
              _buildContinueButton(context),
              const Spacer(),
              const SecurityIconWidget(),
            ],
          ).paddingHorizontal(32),
        ),
      ),
    );
  }

  BrgAppBar _buildAppBar(BuildContext context) {
    return BrgAppBar(
      title: Center(
        child: Text(
          const LocalizableText(tr: "Sözleşme", en: "Terms and Conditions").localize(),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ).padding(right: 48),
      ),
    );
  }

  Widget _buildTermsAndConditionsWidget(BuildContext context) {
    return TermsAndConditionsWidget(
      titleText: "Sözleşme Başlık",
      contentText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap typesetting industry.",
      toggleText: "Okudum, kabul ediyorum.",
      contentMaxHeight: MediaQuery.of(context).size.height * 0.3,
      onSwitchToggled: (bool isAccepted) {
        // TODO: Update switch status
      },
    ).padding(top: 16);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: const LocalizableText(tr: "Devam", en: "Continue").localize(),
      onPressed: () {
        // TODO: Validate terms and conditions' switch status
        // TODO: Navigate to next page
      },
    ).padding(top: 16);
  }
}
