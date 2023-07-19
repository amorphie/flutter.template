import 'package:burgan_poc/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgan_poc/core/util/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController textControllerTckn;

  @override
  void initState() {
    super.initState();
    textControllerTckn = TextEditingController(text: null); // Pass locally saved TCKN from storage if exist
  }

  @override
  void dispose() {
    textControllerTckn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Image.asset('assets/images/login_lock.png')),
          BrgTextFormField.tckn(
            context: context,
            controller: textControllerTckn,
          ).padding(left: 16, right: 16, top: 32, bottom: 8),
        ],
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
