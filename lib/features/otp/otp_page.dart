import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgan_poc/core/reusable_widgets/count_down_timer/circular_count_down_timer.dart';
import 'package:burgan_poc/core/reusable_widgets/count_down_timer/count_down_timer_text_format.dart';
import 'package:burgan_poc/core/util/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late TextEditingController controllerOtp;

  @override
  void initState() {
    super.initState();
    controllerOtp = TextEditingController();
  }

  @override
  void dispose() {
    controllerOtp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrgAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitleText(),
            _buildMessageText(),
            _buildCircularCountDownTimer(),
            _buildOtpInputView(context),
            _buildContinueButton(context),
          ],
        ).paddingAll(32),
      ),
    );
  }

  Widget _buildTitleText() => const Text(
        "Şifre Doğrulama",
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      );

  Widget _buildMessageText() {
    return const Text(
      "Lütfen 5** ** 45 ile biten cep telefonunuza gelen doğrulama kodunu giriniz.",
      style: TextStyle(color: Colors.black),
    ).paddingVertical(8);
  }

  Widget _buildCircularCountDownTimer() {
    return CircularCountDownTimer(
      // TODO: Set from API
      duration: 120,
      controller: CountDownController(),
      width: 232,
      height: 232,
      ringColor: const Color(0xFFF7F7F7),
      fillColor: const Color(0xFF0069AA),
      strokeWidth: 8.0,
      textStyle: const TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold),
      textFormat: CountdownTimerTextFormat.MM_SS,
      isTimerTextShown: true,
      isReverse: true,
      autoStart: true,
      onComplete: () {
        // TODO: Implement timeout logics
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        return Function.apply(defaultFormatterFunction, [duration]);
      },
    ).paddingVertical(16);
  }

  Widget _buildOtpInputView(BuildContext context) {
    return BrgTextFormField.password(
      context: context,
      controller: controllerOtp,
      labelText: const LocalizableText(
        tr: "SMS Doğrulama Kodu",
        en: "SMS OTP",
      ).localize(context),
      validationErrorMessage: const LocalizableText(
        tr: "Şifreniz 6 karakterden kısadır.",
        en: "Password is less than 6 character.",
      ).localize(context),
      passwordLength: 6,
      onlyDigits: true,
    ).paddingVertical(16);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: const LocalizableText(tr: "Devam", en: "Continue").localize(context),
      onPressed: () {
        // TODO: Navigate to personal info page
      },
    );
  }
}
