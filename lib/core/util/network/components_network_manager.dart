import 'package:burgankuwait/core/network/network_manager.dart';

class ComponentsNetworkManager extends NetworkManager {
  ComponentsNetworkManager(String url) : super(baseURL: url);

  Future<Map<String, dynamic>> fetchPageComponentsByPageId(String pageId) async {
    return await requestGet('components?pageId=$pageId');
  }
}
