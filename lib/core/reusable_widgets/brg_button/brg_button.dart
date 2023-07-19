import 'package:burgan_poc/core/util/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

const _buttonColor = Color(0xFF0069AA); // TODO: Move to colors file

class BrgButton extends StatelessWidget {
  const BrgButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: _buttonColor,
      ),
      onPressed: () => onPressed(),
      child: Text(text).padding(left: 16, right: 16, top: 20, bottom: 20),
    );
  }
}
