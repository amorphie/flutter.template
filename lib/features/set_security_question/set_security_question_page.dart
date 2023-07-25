import 'package:burgankuwait/core/dependency_injection/dependency_injection.dart';
import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_dropdown_button/brg_dropdown_form_field.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgankuwait/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/core/util/brg_validator.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/login/login_page_route.dart';
import 'package:burgankuwait/features/set_security_picture/set_security_picture_page_route.dart';
import 'package:flutter/material.dart';

class SetSecurityQuestionPage extends StatefulWidget {
  const SetSecurityQuestionPage({Key? key}) : super(key: key);

  @override
  State<SetSecurityQuestionPage> createState() => _SetSecurityQuestionPageState();
}

class _SetSecurityQuestionPageState extends State<SetSecurityQuestionPage> {
  late TextEditingController textControllerSelectedQuestion;
  late TextEditingController textControllerAnswer;

  final formKey = GlobalKey<FormState>();

  // TODO: Get question from API response
  final questionList = const [
    "Question 1",
    "Question 2",
    "Question 3",
    "Question 4",
  ];

  @override
  void initState() {
    super.initState();
    textControllerSelectedQuestion = TextEditingController();
    textControllerAnswer = TextEditingController();
  }

  @override
  void dispose() {
    textControllerSelectedQuestion.dispose();
    textControllerAnswer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
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
                _buildTitleText(),
                _buildDescriptionText(),
                _buildSecurityQuestionDropdownWidget(),
                _buildAnswerInputWidget(context),
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
          const LocalizableText(tr: "Güvenlik", en: "Security").localize(),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ).padding(right: 48),
      ),
    );
  }

  Widget _buildTitleText() => Text(
        const LocalizableText(tr: "Güvenlik Sorusu Tanımla", en: "Define Security Question").localize(),
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      );

  Widget _buildDescriptionText() => const Row(
        children: [
          Flexible(
            child: Text(
              "Şifrenizi unutmanız durumunda kullanacağınız güvenlik sorusunu belirleyin.",
            ),
          ),
        ],
      ).paddingVertical(8);

  Widget _buildSecurityQuestionDropdownWidget() {
    return BrgDropdownFormField(
      itemList: questionList,
      controller: textControllerSelectedQuestion,
      labelText: const LocalizableText(tr: "Soru Seçiniz", en: "Select a Question").localize(),
    ).padding(top: 40, bottom: 8);
  }

  Widget _buildAnswerInputWidget(BuildContext context) {
    return BrgTextFormField(
      labelText: const LocalizableText(tr: "Cevabınız", en: "Your answer").localize(),
      controller: textControllerAnswer,
      validator: BrgValidator().minLength(
        minLength: 1,
        errorMessage: const LocalizableText(
          tr: "Cevap alanı boş bırakılamaz.",
          en: "Answer field can not be empty.",
        ).localize(),
      ),
    ).paddingVertical(16);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: const LocalizableText(tr: "Değiştir", en: "Change").localize(),
      onPressed: () {
        formKey.currentState?.save();
        if (formKey.currentState?.validate() ?? false) {
          // TODO: Navigate to set question picture page with signalR event
          getIt.get<NavigationHelper>().navigate(
                context: context,
                navigationType: NavigationType.go,
                path: "/${LoginPageRoute.path}/${SetSecurityPicturePageRoute.path}",
              );
        }
      },
    ).padding(top: 16);
  }
}
