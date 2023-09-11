import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/set_security_question/bloc/set_security_question_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

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
            child: BlocConsumer<SetSecurityQuestionBloc, SetSecurityQuestionState>(
              listener: (context, state) {
                if (state is SetSecurityQuestionStateInitial && state.navigationPath != null) {
                  _handleNavigation(context, state.navigationPath!);
                }
              },
              builder: (context, state) {
                switch (state) {
                  case SetSecurityQuestionStateLoading _:
                    return const Center(child: CircularProgressIndicator());
                  case SetSecurityQuestionStateLoaded _:
                    return JsonWidgetData.fromDynamic(state.componentsMap)?.build(
                          context: context,
                        ) ??
                        const SizedBox.shrink();
                  default:
                    return const SizedBox.shrink();
                }
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

  void _handleNavigation(BuildContext context, String navigationPath) {
    NavigationHelper().navigate(
      context: context,
      navigationType: NavigationType.pushReplacement,
      path: navigationPath,
    );
  }
}
