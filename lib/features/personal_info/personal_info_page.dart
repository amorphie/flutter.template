import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgan_poc/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgan_poc/core/util/app_constants.dart';
import 'package:burgan_poc/core/util/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  late TextEditingController textControllerName;
  late TextEditingController textControllerSurname;

  @override
  void initState() {
    super.initState();
    textControllerName = TextEditingController();
    textControllerSurname = TextEditingController();
  }

  @override
  void dispose() {
    textControllerName.dispose();
    textControllerSurname.dispose();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _buildNameInputWidget(context),
              _buildSurnameInputWidget(context),
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
          const LocalizableText(tr: "Kişisel Bilgiler", en: "Personal Informations").localize(context),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildNameInputWidget(BuildContext context) {
    return BrgTextFormField(
      labelText: const LocalizableText(tr: "Ad", en: "Name").localize(context),
      controller: textControllerName,
    ).paddingVertical(16);
  }

  Widget _buildSurnameInputWidget(BuildContext context) {
    return BrgTextFormField(
      labelText: const LocalizableText(tr: "Soyad", en: "Surname").localize(context),
      controller: textControllerSurname,
    ).paddingVertical(16);
  }
}
