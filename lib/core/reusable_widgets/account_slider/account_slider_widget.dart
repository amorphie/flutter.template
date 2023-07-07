import 'package:flutter/material.dart';

class AccountSliderWidget extends StatelessWidget {
  const AccountSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMainAccountRow(),
              _buildAccountBalanceRow(),
              _buildAvailableBalanceRow(),
              _buildIbanRow(),
              _buildIbanDetailsRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainAccountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Ana Hesap", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Column(
          children: [
            Text("Açılış Tarihi", style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 14)),
            const Text(
              "21.08.2023",
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountBalanceRow() {
    return const Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hesap Bakiyesi", style: TextStyle(color: Colors.white, fontSize: 14)),
          Text("0,00 TL", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildAvailableBalanceRow() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Kullanılabilir Bakiye", style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 14)),
          Text("1.860,90 TL",
              style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildIbanRow() {
    return const Row(
      children: [
        Text("TR76 0012 5095 3200 5404 8973 98", style: TextStyle(color: Colors.white, fontSize: 17)),
        Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(Icons.ios_share, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildIbanDetailsRow() {
    return const Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Text("9530 - Merkez", style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(width: 16),
          Text("20054048 - 351", style: TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
