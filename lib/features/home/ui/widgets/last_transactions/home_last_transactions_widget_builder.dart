import 'package:burgankuwait/features/home/ui/widgets/last_transactions/home_last_transactions_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class HomeLastTransactionsWidgetBuilder extends JsonWidgetBuilder {
  const HomeLastTransactionsWidgetBuilder({
    required this.title,
    required this.userList,
    required this.newTransactionText,
  }) : super(numSupportedChildren: 0);

  static const type = 'home_last_transactions_widget';

  final String title;
  final List<dynamic> userList;
  final String newTransactionText;

  static HomeLastTransactionsWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return HomeLastTransactionsWidgetBuilder(
      title: map["title"] ?? "",
      userList: map["user_list"] ?? [],
      newTransactionText: map["new_transaction_text"] ?? "",
    );
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
      '[HomeLastTransactionsWidgetBuilder] does not support children.',
    );

    return HomeLastTransactionWidget(
      title: title,
      userList: userList,
      newTransactionText: newTransactionText,
    );
  }
}
