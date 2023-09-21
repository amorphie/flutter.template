import 'package:burgankuwait/features/login/login_page.dart';
import 'package:burgankuwait/features/otp/otp_page.dart';
import 'package:burgankuwait/features/personal_info/personal_info_page.dart';
import 'package:burgankuwait/features/set_password/set_password_page.dart';
import 'package:burgankuwait/features/set_security_picture/set_security_picture_page.dart';
import 'package:burgankuwait/features/set_security_question/set_security_question_page.dart';
import 'package:burgankuwait/features/terms_and_conditions/terms_and_conditions_page.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookFolder get widgetbookFolderLoginSignupPages => WidgetbookFolder(
      name: 'Login & Signup Flows',
      children: [
        WidgetbookComponent(
          name: "Login Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => const LoginPage(),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Otp Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => const OtpPage(),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Personal Info Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => const PersonalInfoPage(),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Set Password Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => const SetPasswordPage(),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Set Security Question Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => const SetSecurityQuestionPage(),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Set Security Picture Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => const SetSecurityPicturePage(),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Terms and Conditions Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => const TermsAndConditionsPage(),
            )
          ],
        ),
      ],
    );
