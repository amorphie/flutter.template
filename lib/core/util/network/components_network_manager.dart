import 'dart:io';

import 'package:burgankuwait/core/network/network_manager.dart';

// STOPSHIP: Update it with real base url
final _baseUrlLocal = Platform.isAndroid ? "http://10.0.2.2:3000" : "http://localhost:3000";

class ComponentsNetworkManager extends NetworkManager {
  ComponentsNetworkManager() : super(baseURL: _baseUrlLocal);

  Future<Map<String, dynamic>> fetchPageComponentsByPageId(String pageId) async {
    return await requestGet('components?pageId=$pageId');
  }
}
