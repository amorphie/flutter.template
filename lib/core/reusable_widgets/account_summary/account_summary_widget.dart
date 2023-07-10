import 'package:flutter/material.dart';

class AccountSummaryWidget extends StatelessWidget {
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
          child: Column(
            children: [
              _buildRowItem(key: "Kullanılabilir Limit", value: "1.860,93 TL"),
              _buildDivider(),
              _buildRowItem(key: "Toplam Limit", value: "2.000,00 TL"),
              _buildDivider(),
              _buildRowItem(key: "Güncel Borç", value: "193,55 TL"),
              _buildDivider(),
              _buildRowItem(key: "Hesap Açılış Tarihi", value: "5 Eylül 2013"),
              _buildDivider(),
              _buildRowItem(key: "Aylık Faiz Oranı", value: "%1.36"),
              _buildDivider(),
              _buildRowItem(key: "Yıllık Faiz Oranı", value: "%16.32"),
            ],
          ),
        ),
      ),
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
