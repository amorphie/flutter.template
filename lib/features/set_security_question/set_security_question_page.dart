import 'package:burgan_core/burgan_core.dart';
import 'package:burgan_ui/components/burgan_components.dart';
import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/features/set_security_question/bloc/set_security_question_bloc.dart';
import 'package:burgankuwait/features/set_security_question/set_security_question_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetSecurityQuestionPage extends StatefulWidget {
  const SetSecurityQuestionPage({Key? key}) : super(key: key);

  @override
  State<SetSecurityQuestionPage> createState() => _SetSecurityQuestionPageState();
}

class _SetSecurityQuestionPageState extends State<SetSecurityQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: BlocBuilder<SetSecurityQuestionBloc, SetSecurityQuestionState>(
              builder: (context, state) {
                return BrgComponentTreeBuilder(
                  componentsNetworkManager: context.read<SetSecurityQuestionBloc>().componentsNetworkManager,
                  pageId: SetSecurityQuestionPageRoute.path,
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
          const LocalizableText(tr: "Güvenlik", en: "Security").localize(),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ).padding(right: 48),
      ),
    );
  }
}
