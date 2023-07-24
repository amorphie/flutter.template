import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/util/assets.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
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
          const LocalizableText(tr: "GÜVENLİK", en: "SECURITY").localize(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ).padding(left: 4)
      ],
    );
  }
}
