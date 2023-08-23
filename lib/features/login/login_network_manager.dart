import 'package:burgankuwait/core/network/network_manager.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/features/login/models/login_register_request.dart';
import 'package:uuid/uuid.dart';

class LoginNetworkManager extends NetworkManager {
  LoginNetworkManager() : super(baseURL: AppConstants.baseUrl);

  final String recordId = const Uuid().v1();
  final String entityRegister = "openbanking-register";

  Future getTransitions() async {
    final response = await requestGet('workflow/consumer/$entityRegister/record/$recordId/transition');
  }

  Future login(LoginRegisterRequest requestModel) async {
    final response = await requestPost(
      'workflow/consumer/$entityRegister/record/$recordId/transition/openbanking-register-send-sms',
      requestModel.toJson(),
    );
  }
}
