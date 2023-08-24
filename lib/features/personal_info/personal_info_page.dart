import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgankuwait/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/core/util/brg_validator.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/personal_info/bloc/personal_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
        listener: (context, state) {
          if (state is PersonalInfoStateInitial && state.navigationPath != null) {
            _handleNavigation(context, state.navigationPath!);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * AppConstants.safeAreaPercentage,
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
          );
        },
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
          context.read<PersonalInfoBloc>().add(
                PersonalInfoEventPressContinueButton(
                  name: textControllerName.text,
                  surname: textControllerSurname.text,
                  email: textControllerEmail.text,
                ),
              );
        }
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
