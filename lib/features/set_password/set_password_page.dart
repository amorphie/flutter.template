import 'package:burgan_poc/core/dependency_injection/dependency_injection.dart';
import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/navigation/navigation_helper.dart';
import 'package:burgan_poc/core/navigation/navigation_type.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgan_poc/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgan_poc/core/util/app_constants.dart';
import 'package:burgan_poc/core/util/assets.dart';
import 'package:burgan_poc/core/util/brg_validator.dart';
import 'package:burgan_poc/core/util/extensions/form_field_validator_extensions.dart';
import 'package:burgan_poc/core/util/extensions/widget_extensions.dart';
import 'package:burgan_poc/features/login/login_page_route.dart';
import 'package:burgan_poc/features/set_security_question/set_security_question_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({Key? key}) : super(key: key);

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  late TextEditingController textControllerPassword;
  late TextEditingController textControllerRepeatedPassword;

  final formKey = GlobalKey<FormState>();
  final int passwordLength = 6;

  String get passwordValidationErrorMessage => LocalizableText(
        tr: "Şifre $passwordLength karakterden oluşmalıdır.",
        en: "Password field should contain $passwordLength characters",
      ).localize();

  FormFieldValidator<String> get passwordsMatchValidator => (input) {
        if (input != textControllerPassword.value.text) {
          return const LocalizableText(
            tr: "Şifreler birbiriyle eşleşmiyor.",
            en: "Passwords are not matched.",
          ).localize();
        } else {
          return null;
        }
      };

  @override
  void initState() {
    super.initState();
    textControllerPassword = TextEditingController();
    textControllerRepeatedPassword = TextEditingController();
  }

  @override
  void dispose() {
    textControllerPassword.dispose();
    textControllerRepeatedPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - AppConstants.appBarHeight,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                _buildTitleText(),
                _buildBulletItemWidget("Şifreniz 6 karakter olmalıdır.").padding(top: 8),
                _buildBulletItemWidget("Şifreniz numaralardan oluşmalıdır."),
                _buildBulletItemWidget("Şifreniz ardışık ve tekrar rakamlardan oluşmamalıdır."),
                _buildPasswordInputWidget(context),
                _buildPasswordConfirmationInputWidget(context),
                _buildChangeButton(context),
                const Spacer(),
                const SecurityIconWidget(),
              ],
            ).paddingHorizontal(32),
          ),
        ),
      ),
    );
  }

  BrgAppBar _buildAppBar(BuildContext context) {
    return BrgAppBar(
      title: Center(
        child: Text(
          const LocalizableText(tr: "Şifre", en: "Password").localize(),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ).padding(right: 48),
      ),
    );
  }

  Widget _buildTitleText() => const Text(
        "Şifre Belirle",
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      );

  Widget _buildBulletItemWidget(String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.circle, size: 6).padding(top: 4, right: 4),
        Flexible(child: Text(description, maxLines: 3)),
      ],
    ).paddingVertical(4);
  }

  Widget _buildPasswordInputWidget(BuildContext context) {
    return BrgTextFormField.password(
      context: context,
      labelText: const LocalizableText(tr: "Şifre", en: "Password").localize(),
      controller: textControllerPassword,
      validator: BrgValidator().minLength(
        minLength: passwordLength,
        errorMessage: passwordValidationErrorMessage,
      ),
      maxLength: passwordLength,
      prefixIcon: SvgPicture.asset(Assets.icKeyboardNumeric.path, width: 8, height: 8, fit: BoxFit.scaleDown),
      obscureText: true,
      onlyDigits: true,
    ).padding(top: 32, bottom: 16);
  }

  Widget _buildPasswordConfirmationInputWidget(BuildContext context) {
    return BrgTextFormField.password(
      context: context,
      labelText: const LocalizableText(tr: "Şifre Tekrar", en: "Confirm Password").localize(),
      controller: textControllerRepeatedPassword,
      validator: BrgValidator()
          .minLength(minLength: passwordLength, errorMessage: passwordValidationErrorMessage)
          .mergeWith(passwordsMatchValidator),
      maxLength: passwordLength,
      prefixIcon: SvgPicture.asset(Assets.icKeyboardNumeric.path, width: 8, height: 8, fit: BoxFit.scaleDown),
      obscureText: true,
      onlyDigits: true,
    ).paddingVertical(8);
  }

  Widget _buildChangeButton(BuildContext context) {
    return BrgButton(
      text: const LocalizableText(tr: "Devam", en: "Continue").localize(),
      onPressed: () {
        formKey.currentState?.save();
        if (formKey.currentState?.validate() ?? false) {
          // TODO: Navigate to set security question page with signalR event
          getIt.get<NavigationHelper>().navigate(
                context: context,
                navigationType: NavigationType.go,
                path: "/${LoginPageRoute.path}/${SetSecurityQuestionPageRoute.path}",
              );
        }
      },
    ).padding(top: 16);
  }
}
