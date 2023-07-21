import 'package:burgan_poc/core/dependency_injection/dependency_injection.dart';
import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/navigation/navigation_helper.dart';
import 'package:burgan_poc/core/navigation/navigation_type.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgan_poc/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgan_poc/core/util/app_constants.dart';
import 'package:burgan_poc/core/util/brg_validator.dart';
import 'package:burgan_poc/core/util/extensions/widget_extensions.dart';
import 'package:burgan_poc/features/login/login_page_route.dart';
import 'package:burgan_poc/features/set_password/set_password_page_route.dart';
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  late TextEditingController textControllerName;
  late TextEditingController textControllerSurname;
  late TextEditingController textControllerEmail;

  final formKey = GlobalKey<FormState>();
  final nameSurnameMinLength = 2;

  @override
  void initState() {
    super.initState();
    textControllerName = TextEditingController();
    textControllerSurname = TextEditingController();
    textControllerEmail = TextEditingController();
  }

  @override
  void dispose() {
    textControllerName.dispose();
    textControllerSurname.dispose();
    textControllerEmail.dispose();
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
                _buildNameInputWidget(context),
                _buildSurnameInputWidget(context),
                _buildEmailInputWidget(context),
                _buildContinueButton(context),
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
          const LocalizableText(tr: "Kişisel Bilgiler", en: "Personal Informations").localize(),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ).padding(right: 48),
      ),
    );
  }

  Widget _buildNameInputWidget(BuildContext context) {
    return BrgTextFormField(
      labelText: const LocalizableText(tr: "Ad", en: "Name").localize(),
      controller: textControllerName,
      validator: BrgValidator().minLength(
        minLength: nameSurnameMinLength,
        errorMessage: LocalizableText(
          tr: "Ad alanı en az $nameSurnameMinLength karakterden oluşmalıdır.",
          en: "Name field should contain at least $nameSurnameMinLength characters",
        ).localize(),
      ),
    ).paddingVertical(16);
  }

  Widget _buildSurnameInputWidget(BuildContext context) {
    return BrgTextFormField(
      labelText: const LocalizableText(tr: "Soyad", en: "Surname").localize(),
      controller: textControllerSurname,
      validator: BrgValidator().minLength(
        minLength: nameSurnameMinLength,
        errorMessage: LocalizableText(
          tr: "Soyad alanı en az $nameSurnameMinLength karakterden oluşmalıdır.",
          en: "Surname field should contain at least $nameSurnameMinLength characters",
        ).localize(),
      ),
    ).paddingVertical(16);
  }

  Widget _buildEmailInputWidget(BuildContext context) {
    return BrgTextFormField(
      labelText: const LocalizableText(tr: "E-posta", en: "E-mail").localize(),
      controller: textControllerEmail,
      validator: BrgValidator().email,
    ).paddingVertical(16);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: const LocalizableText(tr: "Devam", en: "Continue").localize(),
      onPressed: () {
        formKey.currentState?.save();
        if (formKey.currentState?.validate() ?? false) {
          // TODO: Navigate to set password page with signalR event
          getIt.get<NavigationHelper>().navigate(
                context: context,
                navigationType: NavigationType.go,
                path: "/${LoginPageRoute.path}/${SetPasswordPageRoute.path}",
              );
        }
      },
    ).padding(top: 16);
  }
}
