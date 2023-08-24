import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgankuwait/core/reusable_widgets/terms_and_conditions/terms_and_conditions_widget.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/terms_and_conditions/bloc/terms_and_conditions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocConsumer<TermsAndConditionsBloc, TermsAndConditionsState>(
        listener: (context, state) {
          if (state is TermsAndConditionsStateInitial && state.navigationPath != null) {
            _handleNavigation(context, state.navigationPath!);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * AppConstants.safeAreaPercentage,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTermsAndConditionsWidget(context: context, isFirst: true),
                  _buildTermsAndConditionsWidget(context: context, isFirst: false),
                  _buildContinueButton(context),
                  const Spacer(),
                  const SecurityIconWidget(),
                ],
              ).paddingHorizontal(32),
            ),
          );
        },
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

  Widget _buildTermsAndConditionsWidget({required BuildContext context, required bool isFirst}) {
    return TermsAndConditionsWidget(
      titleText: "Sözleşme Başlık",
      contentText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap typesetting industry.",
      toggleText: "Okudum, kabul ediyorum.",
      contentMaxHeight: MediaQuery.of(context).size.height * 0.3,
      onSwitchToggled: (bool isAccepted) {
        if (isFirst) {
          context
              .read<TermsAndConditionsBloc>()
              .add(TermsAndConditionsEventUpdateContractStatus(contract1Accepted: isAccepted));
        } else {
          context
              .read<TermsAndConditionsBloc>()
              .add(TermsAndConditionsEventUpdateContractStatus(contract2Accepted: isAccepted));
        }
      },
    ).padding(top: 16);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: const LocalizableText(tr: "Devam", en: "Continue").localize(),
      onPressed: () {
        context.read<TermsAndConditionsBloc>().add(TermsAndConditionsEventPressContinueButton());
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
