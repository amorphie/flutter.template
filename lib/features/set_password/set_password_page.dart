import 'package:burgan_core/burgan_core.dart';
import 'package:burgan_ui/components/burgan_components.dart';
import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/features/set_password/bloc/set_password_bloc.dart';
import 'package:burgankuwait/features/set_password/set_password_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({Key? key}) : super(key: key);

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final int passwordLength = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: BlocBuilder<SetPasswordBloc, SetPasswordState>(
              builder: (context, state) {
                return BrgComponentTreeBuilder(
                  componentsNetworkManager: context.read<SetPasswordBloc>().componentsNetworkManager,
                  pageId: SetPasswordPageRoute.path,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  BrgAppBar _buildAppBar(BuildContext context) {
    return BrgAppBar(
      title: Center(
        child: Text(
          const LocalizableText(tr: "Şifre", en: "Password").localize(),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ).padding(right: 48),
      ),
    );
  }
}
