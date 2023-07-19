import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgan_poc/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgan_poc/core/util/assets.dart';
import 'package:burgan_poc/core/util/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController textControllerTckn;
  late TextEditingController textControllerPhoneNumber;

  final appBarHeight = 100;

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - appBarHeight,
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
                text: const LocalizableText(tr: "GİRİŞ YAP", en: "LOGIN").localize(context),
                onPressed: () {
                  // TODO: Validate and start login/register flow
                },
              ).padding(left: 32, right: 32, bottom: 16),
              const Spacer(),
              const SecurityIconWidget(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: const Text("EN", style: TextStyle(fontWeight: FontWeight.bold)).padding(top: 24.0, left: 24),
      actions: [
        const Icon(Icons.notifications).padding(top: 24.0, right: 24),
      ],
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }
}
