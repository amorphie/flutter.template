import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:flutter/material.dart';

class NewBadgeWidget extends StatelessWidget {
  const NewBadgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Text(
          const LocalizableText(tr: "Yeni", en: "New").localize(context),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
