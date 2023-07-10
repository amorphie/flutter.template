import 'package:burgan_poc/core/reusable_widgets/account_summary/account_summary_widget_ui_model.dart';
import 'package:burgan_poc/core/reusable_widgets/account_summary/bloc/account_summary_widget_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSummaryWidget extends StatelessWidget {
  // TODO: Get iban from constructor
  final String iban = "TR76 0012 5095 3200 5404 8973 98";

  const AccountSummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AccountSummaryWidgetBloc, AccountSummaryWidgetState>(
            bloc: AccountSummaryWidgetBloc()..add(AccountSummaryWidgetEventFetchComponentDetails(iban)),
            builder: (context, state) {
              switch (state) {
                case AccountSummaryWidgetStateLoading _:
                  return _buildLoading();
                case AccountSummaryWidgetStateLoaded _:
                  return _buildComponents(state.uiModel);
              }
            },
          ),
        ),
      ),
    );
  }

  // TODO: Display skeleton loading
  Widget _buildLoading() => const SizedBox(height: 180, child: Center(child: CircularProgressIndicator()));

  Widget _buildComponents(AccountSummaryWidgetUIModel uiModel) {
    return Column(
      children: [
        _buildRowItem(key: "Kullanılabilir Limit", value: uiModel.availableLimit),
        _buildDivider(),
        _buildRowItem(key: "Toplam Limit", value: uiModel.totalLimit),
        _buildDivider(),
        _buildRowItem(key: "Güncel Borç", value: uiModel.currentDebt),
        _buildDivider(),
        _buildRowItem(key: "Hesap Açılış Tarihi", value: uiModel.accountOpeningDate),
        _buildDivider(),
        _buildRowItem(key: "Aylık Faiz Oranı", value: uiModel.monthlyInterestRate),
        _buildDivider(),
        _buildRowItem(key: "Yıllık Faiz Oranı", value: uiModel.yearlyInterestRate),
      ],
    );
  }

  Widget _buildRowItem({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        color: Colors.grey,
        width: double.infinity,
        height: 1,
      ),
    );
  }
}
