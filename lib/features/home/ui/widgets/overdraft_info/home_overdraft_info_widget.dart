import 'package:flutter/material.dart';

class HomeOverdraftInfoWidget extends StatelessWidget {
  const HomeOverdraftInfoWidget({
    Key? key,
    required this.title,
    required this.closeAccountButtonText,
    required this.updateLimitButtonText,
  }) : super(key: key);

  final String title;
  final String closeAccountButtonText;
  final String updateLimitButtonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          _buildButton(closeAccountButtonText),
          _buildButton(updateLimitButtonText),
        ],
      ),
    );
  }

  Padding _buildButton(String buttonText) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white10.withAlpha(150)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
        onPressed: () {},
        child: Text(buttonText),
      ),
    );
  }
}
