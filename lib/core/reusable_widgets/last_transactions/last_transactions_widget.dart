import 'package:flutter/material.dart';

class LastTransactionWidget extends StatelessWidget {
  const LastTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Son Transferler",
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              _buildNewTransactionItem(),
              _buildLastTransactionItem("Emre", "Reyhanlioglu"),
              _buildLastTransactionItem("Mertcan", "Yigin"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNewTransactionItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              side: BorderSide(width: 4, color: Colors.lightBlue.withAlpha(200)),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add, color: Colors.lightBlue, size: 32),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "YENİ TRANSFER",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLastTransactionItem(String name, String surname) {
    return Column(
      children: [
        FilledButton(
          style: OutlinedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.lightBlueAccent,
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("${name.substring(0, 1).toUpperCase()} ${surname.substring(0, 1).toUpperCase()}"),
          ),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 80),
          child: Text(
            "${name.toUpperCase()} ${surname.toUpperCase()}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.lightBlueAccent.withAlpha(200),
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
