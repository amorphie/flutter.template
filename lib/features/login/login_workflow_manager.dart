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

  Future submitPassword(String password) async {
    await requestPost('workflow/consumer/$entity/record/$recordId/transition/ob-openbanking-send-password', {
      "entityData": {"password": password},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future submitSecurityQuestion(String answer) async {
    await requestPost('workflow/consumer/$entity/record/$recordId/transition/ob-send-sequrity-question', {
      "entityData": {
        "question": "13c8ecc3-bf95-461c-aad6-6131c06f20e5", // TODO: Get it from API
        "answer": answer
      },
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future submitSecurityImage(String selectedPictureId) async {
    await requestPost('workflow/consumer/$entity/record/$recordId/transition/ob-send-sequrity-image', {
      "entityData": {"imageId": selectedPictureId},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future submitFirstContracts({required bool contract1, required bool contract2}) async {
    await requestPost('workflow/consumer/$entity/record/$recordId/transition/ob-send-contract-1', {
      "entityData": {"contract1": contract1, "contract2": contract2},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future submitThirdContract({required bool contract3}) async {
    await requestPost('workflow/consumer/$entity/record/$recordId/transition/ob-send-contract-2', {
      "entityData": {"contract3": contract3},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }
}
