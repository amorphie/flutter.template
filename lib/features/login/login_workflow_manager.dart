import 'package:burgankuwait/core/network/network_manager.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/features/login/models/login_register_request.dart';
import 'package:uuid/uuid.dart';

class LoginWorkflowManager extends NetworkManager {
  LoginWorkflowManager() : super(baseURL: AppConstants.baseUrl);

  static String recordId = const Uuid().v1();
  final String entity = "openbanking-register";

  Future getTransitions() async {
    final response = await requestGet('workflow/consumer/$entity/record/$recordId/transition');
    print('Response is $response');
  }

  Future login(LoginRegisterRequest requestModel) async {
    await requestPost(
      'workflow/consumer/$entity/record/$recordId/transition/openbanking-register-send-sms',
      requestModel.toJson(),
    );
  }

  Future submitOtp(String otp) async {
    await requestPost('workflow/consumer/$entity/record/$recordId/transition/openbanking-sms-key-send', {
      "entityData": {"smsKey": otp},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future submitPersonalInfo(String name, String surname, String email) async {
    await requestPost('workflow/consumer/$entity/record/$recordId/transition/ob-send-personal-information', {
      "entityData": {
        "firstName": name,
        "lastName": surname,
        "eMail": email,
      },
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }
}
