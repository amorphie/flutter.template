import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgankuwait/core/reusable_widgets/count_down_timer/circular_count_down_timer.dart';
import 'package:burgankuwait/core/reusable_widgets/count_down_timer/count_down_timer_text_format.dart';
import 'package:burgankuwait/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/core/util/brg_validator.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/login/login_page_route.dart';
import 'package:burgankuwait/features/otp/bloc/otp_bloc.dart';
import 'package:burgankuwait/features/personal_info/personal_info_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late TextEditingController controllerOtp;
  final int otpLength = 4;

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
        child: BlocConsumer<OtpBloc, OtpState>(
          listener: (context, state) {
            if (state is OtpStateInitial && state.navigateToPersonalInfo) {
              _navigateToPersonalInfoPage(context);
            }
          },
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * AppConstants.safeAreaPercentage,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTitleText(),
                  _buildMessageText(),
                  _buildCircularCountDownTimer(),
                  _buildOtpInputView(context),
                  _buildContinueButton(context),
                  const Spacer(),
                  const SecurityIconWidget(),
                ],
              ).paddingHorizontal(32),
            );
          },
        ),
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
      ).localize(),
      validator: BrgValidator().minLength(
        minLength: otpLength,
        errorMessage: LocalizableText(
          tr: "Şifreniz $otpLength karakterden kısadır.",
          en: "Password is less than $otpLength character.",
        ).localize(),
      ),
      maxLength: otpLength,
      onlyDigits: true,
      obscureText: false,
    ).paddingVertical(16);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: const LocalizableText(tr: "Devam", en: "Continue").localize(),
      onPressed: () {
        context.read<OtpBloc>().add(OtpEventPressContinueButton(otp: controllerOtp.text));
      },
    );
  }

  void _navigateToPersonalInfoPage(BuildContext context) {
    NavigationHelper().navigate(
      context: context,
      navigationType: NavigationType.pushReplacement,
      path: "/${LoginPageRoute.path}/${PersonalInfoPageRoute.path}",
    );
  }
}
