import 'package:burgankuwait/core/reusable_widgets/account_summary/account_summary_widget_builder.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class CustomWidgetRegisterer {
  static final registry = JsonWidgetRegistry.instance;

  init() {
    registry.registerCustomBuilder(
      AccountSummaryWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: AccountSummaryWidgetBuilder.fromDynamic),
    );
  }
}
