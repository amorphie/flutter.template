import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgankuwait/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/core/util/assets.dart';
import 'package:burgankuwait/core/util/brg_validator.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/core/widgets/brg_transition_listener/brg_transition_listener_widget.dart';
import 'package:burgankuwait/features/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    this.transitionId = "start-password-flow-web",
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

  final String transitionId;
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController textControllerTckn;
  late TextEditingController textControllerPassword;
  final passwordLength = 6;

  @override
  void initState() {
    super.initState();
    textControllerTckn = TextEditingController(text: null); // Pass locally saved TCKN from storage if exist
    textControllerPassword = TextEditingController(text: null);
  }

  @override
  void dispose() {
    textControllerTckn.dispose();
    textControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                  BrgTextFormField.password(
                    context: context,
                    labelText: const LocalizableText(tr: "Şifre", en: "Password").localize(),
                    controller: textControllerPassword,
                    validator: BrgValidator().minLength(
                      minLength: passwordLength,
                      errorMessage: LocalizableText(
                        tr: "Şifreniz $passwordLength karakterden kısadır.",
                        en: "Password is less than $passwordLength character.",
                      ).localize(),
                    ),
                    maxLength: passwordLength,
                    onlyDigits: true,
                  ).padding(left: 32, right: 32, top: 8, bottom: 16),
                  _buildLoginButton(context),
                  const Spacer(),
                  const SecurityIconWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginButton(
    BuildContext context,
  ) {
    return BrgTransitionListenerWidget(
      transitionId: widget.transitionId,
      onPageNavigation: (String navigationPath) => _handleNavigation(context, navigationPath),
      child: BrgButton(
        text: const LocalizableText(tr: "GİRİŞ YAP", en: "LOGIN").localize(),
        onPressed: () {
          context.read<LoginBloc>().add(
                LoginEventLoginWithCredentials(
                  username: textControllerTckn.text,
                  password: textControllerPassword.text, // TODO: Pass password
                  transitionId: widget.transitionId,
                ),
              );
        },
      ).padding(left: 32, right: 32, bottom: 16),
    );
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
