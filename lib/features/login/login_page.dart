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
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/login/bloc/login_bloc.dart';
import 'package:burgankuwait/features/login/login_page_route.dart';
import 'package:burgankuwait/features/otp/otp_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginStateInitial && state.navigateToOtp) {
            NavigationHelper().navigate(
              context: context,
              navigationType: NavigationType.push,
              path: "/${LoginPageRoute.path}/${OtpPageRoute.path}",
            );
          }
        },
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
                  BrgTextFormField.phoneNumber(
                    context: context,
                    controller: textControllerPhoneNumber,
                  ).padding(left: 32, right: 32, top: 8, bottom: 16),
                  BrgButton(
                    text: const LocalizableText(tr: "GİRİŞ YAP", en: "LOGIN").localize(),
                    onPressed: () {
                      final prefix = textControllerPhoneNumber.text.substring(0, 3);
                      final number = textControllerPhoneNumber.text.substring(3, textControllerPhoneNumber.text.length);
                      context.read<LoginBloc>().add(
                            LoginEventLoginWithCredentials(
                              tckn: textControllerTckn.text,
                              phoneNumber: BrgPhoneNumber(
                                countryCode: "90", // TODO: Get country code from user input
                                prefix: prefix,
                                number: number,
                              ),
                            ),
                          );
                    },
                  ).padding(left: 32, right: 32, bottom: 16),
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

  AppBar _buildAppBar() {
    return BrgAppBar(
      leading: const Text("EN", style: TextStyle(fontWeight: FontWeight.bold)).padding(top: 24.0, left: 24),
      actions: [const Icon(Icons.notifications).padding(top: 24.0, right: 24)],
    );
  }
}
