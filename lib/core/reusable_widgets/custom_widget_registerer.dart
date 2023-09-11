import 'package:burgankuwait/core/reusable_widgets/account_summary/account_summary_widget_builder.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_account_slider/brg_account_slider_widget_builder.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_bullet_list_view/brg_bullet_list_view_builder.dart';
import 'package:burgankuwait/core/reusable_widgets/security_icon_widget/security_icon_widget_builder.dart';
import 'package:burgankuwait/core/reusable_widgets/spacer/spacer_builder.dart';
import 'package:burgankuwait/core/reusable_widgets/sub_navigation/sub_navigation_widget_builder.dart';
import 'package:burgankuwait/features/home/ui/widgets/last_transactions/home_last_transactions_widget_builder.dart';
import 'package:burgankuwait/features/home/ui/widgets/overdraft_info/home_overdraft_info_widget_builder.dart';
import 'package:burgankuwait/features/otp/widgets/count_down_timer/otp_count_down_timer_widget_builder.dart';
import 'package:burgankuwait/features/otp/widgets/message/otp_message_widget_builder.dart';
import 'package:burgankuwait/features/otp/widgets/otp_input_with_submit_button/otp_input_with_submit_button_widget_builder.dart';
import 'package:burgankuwait/features/otp/widgets/title/otp_title_widget_builder.dart';
import 'package:burgankuwait/features/personal_info/widgets/personal_info_form_widget_builder.dart';
import 'package:burgankuwait/features/set_password/widgets/set_password_form_widget_builder.dart';
import 'package:burgankuwait/features/set_security_question/widgets/set_security_question_form_widget_builder.dart';
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

    registry.registerCustomBuilder(
      HomeLastTransactionsWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: HomeLastTransactionsWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      SubNavigationWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: SubNavigationWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      OtpTitleWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: OtpTitleWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      OtpMessageWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: OtpMessageWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      OtpCountDownTimerWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: OtpMessageWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      OtpCountDownTimerWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: OtpCountDownTimerWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      OtpInputWithSubmitButtonWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: OtpInputWithSubmitButtonWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      SecurityIconWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: SecurityIconWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      SpacerBuilder.type,
      const JsonWidgetBuilderContainer(builder: SpacerBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      PersonalInfoFormWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: PersonalInfoFormWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      BrgBulletListViewBuilder.type,
      const JsonWidgetBuilderContainer(builder: BrgBulletListViewBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      SetPasswordFormWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: SetPasswordFormWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      SetSecurityQuestionFormWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: SetSecurityQuestionFormWidgetBuilder.fromDynamic),
    );
  }
}
