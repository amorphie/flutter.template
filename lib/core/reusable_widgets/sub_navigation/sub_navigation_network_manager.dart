import 'package:burgan_poc/core/network/network_manager.dart';
import 'package:burgan_poc/core/reusable_widgets/account_summary/models/account_summary_component_details_response.dart';
import 'package:burgan_poc/core/reusable_widgets/sub_navigation/models/sub_navigation_component_details_response.dart';

class SubNavigationNetworkManager extends NetworkManager {
  SubNavigationNetworkManager(String url) : super(baseURL: url);

  Future<SubNavigationComponentDetailsResponse> fetchSubNavigationComponentDetails() async {
    final responseJSON = await requestGet('sub-navigation-components');
    return SubNavigationComponentDetailsResponse.fromJson(responseJSON);
  }
}
