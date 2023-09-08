import 'package:burgankuwait/core/network/network_manager.dart';

class HomeNetworkManager extends NetworkManager {
  HomeNetworkManager(String url) : super(baseURL: url);

  Future<Map<String, dynamic>> fetchHomePageComponents() async {
    return await requestGet('components?pageId=home');
  }
}
