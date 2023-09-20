import 'package:burgankuwait/core/models/brg_phone_number.dart';
import 'package:burgankuwait/core/models/brg_workflow.dart';
import 'package:burgankuwait/core/network/network_manager.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:uuid/uuid.dart';

class LoginWorkflowManager extends NetworkManager {
  LoginWorkflowManager() : super(baseURL: AppConstants.baseUrl);

  static String recordId = const Uuid().v1();
  final String entityRegister = "openbanking-register";
  final String entityLogin = "login";

  // Has no effect, it only helps developers for next steps
  Future getTransitions() async {
    final response = await requestGet('workflow/consumer/$entityRegister/record/$recordId/transition');
    print('Response is $response');
  }

  Future register({required String tckn, required BrgPhoneNumber phoneNumber, required String transitionId}) async {
    await requestPost('workflow/consumer/$entityRegister/record/$recordId/transition/$transitionId', {
      "entityData": {"reference": tckn, "phone": phoneNumber.toJson()},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future login({required String username, required String password, required String transitionId}) async {
    await requestPost('workflow/consumer/login/record/$recordId/transition/$transitionId', {
      "entityData": {
        "username": username,
        "password": password,
        "client_id": "aa87c83e-493d-473a-a9d1-87ebe3f8f7f6",
        "client_secret": "7055067a-1729-45ff-ba6e-0253d1b3a0e8",
        "scopes": ["retail-customer", "openId"],
        "grant_type": "password"
      },
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future submitOtp(String otp, BrgWorkflow workflow, String transitionId) async {
    final selectedEntity = workflow == BrgWorkflow.register ? entityRegister : entityLogin;
    final selectedKey = workflow == BrgWorkflow.register ? 'smsKey' : 'otpValue';
    await requestPost('workflow/consumer/$selectedEntity/record/$recordId/transition/$transitionId', {
      "entityData": {selectedKey: otp},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future submitPersonalInfo(String name, String surname, String email, String transitionId) async {
    await requestPost('workflow/consumer/$entityRegister/record/$recordId/transition/$transitionId', {
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

  Future submitPassword(String password, String transitionId) async {
    await requestPost('workflow/consumer/$entityRegister/record/$recordId/transition/$transitionId', {
      "entityData": {"password": password},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future submitSecurityQuestion({required String answer, required String transitionId}) async {
    await requestPost('workflow/consumer/$entityRegister/record/$recordId/transition/$transitionId', {
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

  Future submitSecurityImage({required String selectedPictureId, required String transitionId}) async {
    await requestPost('workflow/consumer/$entityRegister/record/$recordId/$transitionId', {
      "entityData": {"imageId": selectedPictureId},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future submitFirstContracts({required bool contract1, required bool contract2, required String transitionId}) async {
    await requestPost('workflow/consumer/$entityRegister/record/$recordId/transition/$transitionId', {
      "entityData": {"contract1": contract1, "contract2": contract2},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  Future submitThirdContract({required bool contract3, required String transitionId}) async {
    await requestPost('workflow/consumer/$entityRegister/record/$recordId/transition/$transitionId', {
      "entityData": {"contract3": contract3},
      "formData": "",
      "additionalData": "",
      "getSignalRHub": true,
      "routeData": "",
      "queryData": ""
    });
  }

  void resetRecordId() {
    recordId = const Uuid().v1();
  }
}
