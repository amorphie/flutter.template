import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/features/home/ui/widgets/account_summary/models/home_account_summary_component_details_response.dart';

class HomeAccountSummaryNetworkManager extends NetworkManager {
  HomeAccountSummaryNetworkManager(String url) : super(baseURL: url);

  Future<HomeAccountSummaryComponentDetailsResponse> fetchAccountSummaryComponentDetails(String iban) async {
    final responseJSON = await requestGet('account_summary?iban=$iban');
    return HomeAccountSummaryComponentDetailsResponse.fromJson(responseJSON);
  }
}
