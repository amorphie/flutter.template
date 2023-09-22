import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/models/brg_phone_number.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgankuwait/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/core/util/assets.dart';
import 'package:burgankuwait/features/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  final String transitionId;

  const RegisterPage({
    Key? key,
    this.transitionId = "openbanking-register-send-sms",
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController textControllerTckn;
  late TextEditingController textControllerPhoneNumber;

  @override
  void initState() {
    super.initState();
    textControllerTckn = TextEditingController(text: null); // Pass locally saved TCKN from storage if exist
    textControllerPhoneNumber = TextEditingController(text: null);
  }

  @override
  void dispose() {
    textControllerTckn.dispose();
    textControllerPhoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return BrgTransitionListenerWidget(
            transitionId: widget.transitionId,
            signalRServerUrl: AppConstants.workflowHubUrl,
            signalRMethodName: AppConstants.workflowMethodName,
            onPageNavigation: (String navigationPath) => _handleNavigation(context, navigationPath),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * AppConstants.safeAreaPercentage,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Image.asset(Assets.loginLock.path)),
                    BrgTextFormField.tckn(
                      context: context,
                      controller: textControllerTckn,
                    ).padding(left: 32, right: 32, top: 32, bottom: 8),
                    BrgTextFormField.phoneNumber(
                      context: context,
                      controller: textControllerPhoneNumber,
                    ).padding(left: 32, right: 32, top: 8, bottom: 16),
                    _buildLoginButton(context),
                    const Spacer(),
                    const SecurityIconWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return BrgButton(
      text: const LocalizableText(tr: "KAYIT OL", en: "SIGNUP").localize(),
      onPressed: () {
        final prefix = textControllerPhoneNumber.text.substring(0, 3);
        final number = textControllerPhoneNumber.text.substring(3, textControllerPhoneNumber.text.length);
        context.read<RegisterBloc>().add(
              RegisterEventRegisterWithPhoneNumber(
                tckn: textControllerTckn.text,
                phoneNumber: BrgPhoneNumber(
                  countryCode: "90", // TODO: Get country code from user input
                  prefix: prefix,
                  number: number,
                ),
                transitionId: widget.transitionId,
              ),
            );
      },
    ).padding(left: 32, right: 32, bottom: 16);
  }

  void _handleNavigation(BuildContext context, String navigationPath) {
    NavigationHelper().navigate(
      context: context,
      navigationType: NavigationType.pushReplacement,
      path: navigationPath,
    );
  }

  AppBar _buildAppBar() {
    return BrgAppBar(
      leading: const Text("EN", style: TextStyle(fontWeight: FontWeight.bold)).padding(top: 24.0, left: 24),
      actions: [const Icon(Icons.notifications).padding(top: 24.0, right: 24)],
    );
  }
}
