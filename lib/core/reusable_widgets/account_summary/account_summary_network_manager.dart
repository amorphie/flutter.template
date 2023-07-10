import 'package:burgan_poc/core/network/network_manager.dart';
import 'package:burgan_poc/core/reusable_widgets/account_summary/models/account_summary_component_details_response.dart';

class AccountSummaryNetworkManager extends NetworkManager {
  AccountSummaryNetworkManager(String url) : super(baseURL: url);

  Future<AccountSummaryComponentDetailsResponse> fetchAccountSummaryComponentDetails(String iban) async {
    final responseJSON = await requestGet('account_summary?iban=$iban');
    return AccountSummaryComponentDetailsResponse.fromJson(responseJSON);
  }
}
