import 'package:burgankuwait/core/models/brg_workflow.dart';
import 'package:burgankuwait/features/login/bloc/login_bloc.dart';
import 'package:burgankuwait/features/login/login_page.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/otp/bloc/otp_page_bloc.dart';
import 'package:burgankuwait/features/otp/otp_page.dart';
import 'package:burgankuwait/features/personal_info/bloc/personal_info_bloc.dart';
import 'package:burgankuwait/features/personal_info/personal_info_page.dart';
import 'package:burgankuwait/features/set_password/bloc/set_password_bloc.dart';
import 'package:burgankuwait/features/set_password/set_password_page.dart';
import 'package:burgankuwait/features/set_security_picture/bloc/set_security_picture_bloc.dart';
import 'package:burgankuwait/features/set_security_picture/set_security_picture_page.dart';
import 'package:burgankuwait/features/set_security_question/bloc/set_security_question_bloc.dart';
import 'package:burgankuwait/features/set_security_question/set_security_question_page.dart';
import 'package:burgankuwait/features/terms_and_conditions/bloc/terms_and_conditions_bloc.dart';
import 'package:burgankuwait/features/terms_and_conditions/terms_and_conditions_page.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/bloc/terms_and_conditions_second_bloc.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/terms_and_conditions_second_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookFolder get widgetbookFolderLoginSignupPages => WidgetbookFolder(
      name: 'Login & Signup Flows',
      children: [
        WidgetbookComponent(
          name: "Login Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => BlocProvider(
                create: (context) => LoginBloc(
                  workflowManager: LoginWorkflowManager(),
                ),
                child: const LoginPage(),
              ),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Otp Page",
          useCases: [
            WidgetbookUseCase(
              name: "Register Otp",
              builder: (context) => BlocProvider(
                create: (context) => OtpPageBloc(
                  workflowManager: LoginWorkflowManager(),
                ),
                child: const OtpPage(workflow: BrgWorkflow.register, pageId: "register-otp"),
              ),
            ),
            WidgetbookUseCase(
              name: "Login Otp",
              builder: (context) => BlocProvider(
                create: (context) => OtpPageBloc(
                  workflowManager: LoginWorkflowManager(),
                ),
                child: const OtpPage(workflow: BrgWorkflow.login, pageId: "login-otp"),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: "Personal Info Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => BlocProvider(
                create: (context) => PersonalInfoBloc(
                  workflowManager: LoginWorkflowManager(),
                ),
                child: const PersonalInfoPage(),
              ),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Set Password Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => BlocProvider(
                create: (context) => SetPasswordBloc(
                  workflowManager: LoginWorkflowManager(),
                ),
                child: const SetPasswordPage(),
              ),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Set Security Question Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => BlocProvider(
                create: (context) => SetSecurityQuestionBloc(
                  workflowManager: LoginWorkflowManager(),
                ),
                child: const SetSecurityQuestionPage(),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: "Set Security Picture Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => BlocProvider(
                create: (context) => SetSecurityPictureBloc(
                  workflowManager: LoginWorkflowManager(),
                ),
                child: const SetSecurityPicturePage(),
              ),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Terms and Conditions Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => BlocProvider(
                create: (context) => TermsAndConditionsBloc(
                  workflowManager: LoginWorkflowManager(),
                ),
                child: const TermsAndConditionsPage(),
              ),
            )
          ],
        ),
        WidgetbookComponent(
          name: "Terms and Conditions Second Page",
          useCases: [
            WidgetbookUseCase(
              name: "Default",
              builder: (context) => BlocProvider(
                create: (context) => TermsAndConditionsSecondBloc(
                  workflowManager: LoginWorkflowManager(),
                ),
                child: const TermsAndConditionsSecondPage(),
              ),
            )
          ],
        ),
      ],
    );
