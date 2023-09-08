import 'package:burgankuwait/core/reusable_widgets/account_summary/account_summary_widget_builder.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_account_slider/brg_account_slider_widget_builder.dart';
import 'package:burgankuwait/features/home/ui/widgets/overdraft_info/home_overdraft_info_widget_builder.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class CustomWidgetRegisterer {
  static final registry = JsonWidgetRegistry.instance;

  init() {
    registry.registerCustomBuilder(
      AccountSummaryWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: AccountSummaryWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      BrgAccountSliderWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: BrgAccountSliderWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      HomeOverdraftInfoWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: HomeOverdraftInfoWidgetBuilder.fromDynamic),
    );
  }
}
