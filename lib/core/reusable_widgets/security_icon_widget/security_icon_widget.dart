import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/util/assets.dart';
import 'package:burgan_poc/core/util/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class SecurityIconWidget extends StatelessWidget {
  const SecurityIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Image.asset(Assets.icSecurity.path),
        ),
        Text(
          const LocalizableText(tr: "GÜVENLİK", en: "SECURITY").localize(context),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ).padding(left: 4)
      ],
    );
  }
}
