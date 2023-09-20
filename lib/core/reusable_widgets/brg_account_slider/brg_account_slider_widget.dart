import 'package:burgankuwait/core/bus/widget_event_bus/widget_event.dart';
import 'package:burgankuwait/core/bus/widget_event_bus/widget_event_bus.dart';
import 'package:burgankuwait/core/dependency_injection/dependency_injection.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_account_slider/brg_account_slider_widget_builder.dart';
import 'package:flutter/material.dart';

class BrgAccountSliderWidget extends StatelessWidget {
  BrgAccountSliderWidget({
    Key? key,
    required this.openingDate,
    required this.accountBalance,
    required this.availableBalance,
    required this.iban,
    required this.branchDetails,
  }) : super(key: key);

  final String openingDate;
  final String accountBalance;
  final String availableBalance;
  final String iban;
  final String branchDetails;

  bool isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isFlipped = !isFlipped;
        getIt.get<WidgetEventBus>().addEvent(
              WidgetEvent(
                eventId: BrgAccountSliderWidgetBuilder.type,
                data: isFlipped,
              ),
            );
      },
      child: Padding(
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
            Text(
              openingDate,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountBalanceRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Hesap Bakiyesi", style: TextStyle(color: Colors.white, fontSize: 14)),
          Text(accountBalance, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildAvailableBalanceRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Kullanılabilir Bakiye", style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 14)),
          Text(availableBalance,
              style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildIbanRow() {
    return Row(
      children: [
        Text(iban, style: const TextStyle(color: Colors.white, fontSize: 17)),
        const Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(Icons.ios_share, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildIbanDetailsRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Text(branchDetails, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
