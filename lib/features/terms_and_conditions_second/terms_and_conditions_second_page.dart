import 'package:burgan_core/burgan_core.dart';
import 'package:burgan_ui/burgan_ui.dart';
import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/bloc/terms_and_conditions_second_bloc.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/terms_and_conditions_second_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: BlocBuilder<TermsAndConditionsSecondBloc, TermsAndConditionsSecondState>(
              builder: (context, state) {
                return BrgComponentTreeBuilder(
                  componentsNetworkManager: context.read<TermsAndConditionsSecondBloc>().componentsNetworkManager,
                  pageId: TermsAndConditionsSecondRoute.path,
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
          const LocalizableText(tr: "Sözleşme", en: "Terms and Conditions").localize(),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ).padding(right: 48),
      ),
    );
  }
}
