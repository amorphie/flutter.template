import 'package:flutter/material.dart';

class OverdraftInfoWidget extends StatelessWidget {
  const OverdraftInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(child: Text("Süper Ek Hesap", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          _buildButton("Hesabı Kapat"),
          _buildButton("Limit Güncelle"),
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
