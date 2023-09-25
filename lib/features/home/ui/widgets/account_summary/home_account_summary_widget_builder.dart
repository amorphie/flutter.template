import 'package:burgankuwait/features/home/ui/widgets/account_summary/home_account_summary_widget.dart';
import 'package:burgankuwait/features/home/ui/widgets/account_summary/bloc/home_account_summary_widget_bloc.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class HomeAccountSummaryWidgetBuilder extends JsonWidgetBuilder {
  const HomeAccountSummaryWidgetBuilder({
    required this.iban,
  }) : super(numSupportedChildren: 0);

  static const type = 'home_account_summary_widget';

  final String iban;

  static HomeAccountSummaryWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    if (map == null) {
      return null;
    }
    return HomeAccountSummaryWidgetBuilder(iban: (map['iban'] as String?) ?? "");
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[HomeAccountSummaryWidgetBuilder] does not support children.',
    );

    return BlocProvider(
      create: (context) => HomeAccountSummaryWidgetBloc()..add(HomeAccountSummaryWidgetEventFetchComponentDetails(iban)),
      child: const HomeAccountSummaryWidget(),
    );
  }
}
