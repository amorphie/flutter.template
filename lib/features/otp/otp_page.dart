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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Şifre Doğrulama", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          const Text(
            "Lütfen 5** ** 45 ile biten cep telefonunuza gelen doğrulama kodunu giriniz.",
            style: TextStyle(color: Colors.black),
          ).paddingVertical(8),
          CircularCountDownTimer(
            duration: 120,
            initialDuration: 0,
            controller: CountDownController(),
            width: 232,
            height: 232,
            ringColor: Color(0xFFF7F7F7),
            fillColor: Color(0xFF0069AA),
            fillGradient: null,
            backgroundGradient: null,
            strokeWidth: 8.0,
            strokeCap: StrokeCap.round,
            textStyle: TextStyle(fontSize: 33.0, color: Colors.black, fontWeight: FontWeight.bold),
            textFormat: CountdownTimerTextFormat.MM_SS,
            isTimerTextShown: true,
            isReverse: true,
            autoStart: true,
            onStart: () {},
            onComplete: () {},
            timeFormatterFunction: (defaultFormatterFunction, duration) {
              if (duration.inSeconds == 0) {
                return "Start";
              } else {
                return Function.apply(defaultFormatterFunction, [duration]);
              }
            },
          ).paddingVertical(16),
          BrgTextFormField.password(
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
          ).paddingVertical(16),
          BrgButton(
            text: const LocalizableText(tr: "Devam", en: "Continue").localize(context),
            onPressed: () {
              // TODO: Navigate to personal info page
            },
          )
        ],
      ).paddingAll(32),
    );
  }
}
