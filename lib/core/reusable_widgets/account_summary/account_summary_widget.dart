import 'dart:math';

import 'package:burgankuwait/core/reusable_widgets/account_summary/account_summary_widget_ui_model.dart';
import 'package:burgankuwait/core/reusable_widgets/account_summary/bloc/account_summary_widget_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';

class AccountSummaryWidget extends StatelessWidget {
  final String iban;

  const AccountSummaryWidget({Key? key, required this.iban}) : super(key: key);

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
                  return _buildSkeletonLoading();
                case AccountSummaryWidgetStateLoaded _:
                  return _buildComponents(state.uiModel);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonLoading() {
    const itemCount = 6;
    return SizedBox(
      height: 200,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) => SkeletonItem(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonLine(
                  style: SkeletonLineStyle(
                      width: 120 + index * itemCount * (pow(-1, index).toDouble()),
                      height: 16,
                      borderRadius: BorderRadius.circular(8)),
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(width: 40, height: 16, borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SkeletonLine(
              style: SkeletonLineStyle(width: double.infinity, height: 1, borderRadius: BorderRadius.circular(8)),
            ),
          );
        },
      ),
    );
  }

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
