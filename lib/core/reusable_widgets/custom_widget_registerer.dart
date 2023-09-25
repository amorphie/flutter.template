import 'package:burgankuwait/core/reusable_widgets/brg_account_slider/brg_account_slider_widget_builder.dart';
import 'package:burgankuwait/core/reusable_widgets/sub_navigation/sub_navigation_widget_builder.dart';
import 'package:burgankuwait/features/home/ui/widgets/account_summary/home_account_summary_widget_builder.dart';
import 'package:burgankuwait/features/home/ui/widgets/last_transactions/home_last_transactions_widget_builder.dart';
import 'package:burgankuwait/features/home/ui/widgets/overdraft_info/home_overdraft_info_widget_builder.dart';
import 'package:burgankuwait/features/otp/widgets/count_down_timer/otp_count_down_timer_widget_builder.dart';
import 'package:burgankuwait/features/otp/widgets/message/otp_message_widget_builder.dart';
import 'package:burgankuwait/features/otp/widgets/otp_input_with_submit_button/otp_input_with_submit_button_widget_builder.dart';
import 'package:burgankuwait/features/otp/widgets/title/otp_title_widget_builder.dart';
import 'package:burgankuwait/features/personal_info/widgets/personal_info_form_widget_builder.dart';
import 'package:burgankuwait/features/set_password/widgets/set_password_form_widget_builder.dart';
import 'package:burgankuwait/features/set_security_picture/widgets/set_security_picture_form_widget/set_security_picture_form_widget_builder.dart';
import 'package:burgankuwait/features/set_security_question/widgets/set_security_question_form_widget_builder.dart';
import 'package:burgankuwait/features/terms_and_conditions/widgets/terms_and_conditions_form_widget/terms_and_conditions_form_widget_builder.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/widgets/terms_and_conditions_second_form_widget/terms_and_conditions_second_form_widget_builder.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class CustomWidgetRegisterer {
  static final registry = JsonWidgetRegistry.instance;

  init() {
    registry.registerCustomBuilder(
      HomeAccountSummaryWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: HomeAccountSummaryWidgetBuilder.fromDynamic),
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
      PersonalInfoFormWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: PersonalInfoFormWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      SetPasswordFormWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: SetPasswordFormWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      SetSecurityQuestionFormWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: SetSecurityQuestionFormWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      SetSecurityPictureFormWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: SetSecurityPictureFormWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      TermsAndConditionsFormWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: TermsAndConditionsFormWidgetBuilder.fromDynamic),
    );

    registry.registerCustomBuilder(
      TermsAndConditionsSecondFormWidgetBuilder.type,
      const JsonWidgetBuilderContainer(builder: TermsAndConditionsSecondFormWidgetBuilder.fromDynamic),
    );
  }
}
