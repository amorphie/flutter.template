import 'package:burgankuwait/core/network/network_manager.dart';
import 'package:burgankuwait/features/home/network/home_page_components_response.dart';

class HomeNetworkManager extends NetworkManager {
  HomeNetworkManager(String url) : super(baseURL: url);

  Future<HomePageComponentsResponse> fetchHomePageComponents() async {
    final responseJSON = await requestGet('home/components');
    return HomePageComponentsResponse.fromJson(responseJSON);
  }
}
