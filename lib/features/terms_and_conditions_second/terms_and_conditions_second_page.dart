import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/bloc/terms_and_conditions_second_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class TermsAndConditionsSecondPage extends StatelessWidget {
  const TermsAndConditionsSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: BlocConsumer<TermsAndConditionsSecondBloc, TermsAndConditionsSecondState>(
              listener: (context, state) {
                if (state is TermsAndConditionsSecondStateInitial && state.navigationPath != null) {
                  _handleNavigation(context, state.navigationPath!);
                }
              },
              builder: (context, state) {
                switch (state) {
                  case TermsAndConditionsSecondStateLoading _:
                    return const Center(child: CircularProgressIndicator());
                  case TermsAndConditionsSecondStateLoaded _:
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
          const LocalizableText(tr: "Sözleşme", en: "Terms and Conditions").localize(),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ).padding(right: 48),
      ),
    );
  }

  void _handleNavigation(BuildContext context, String navigationPath) {
    NavigationHelper().navigate(
      context: context,
      navigationType: NavigationType.pushReplacement,
      path: navigationPath,
    );
  }
}
