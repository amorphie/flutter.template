import 'package:burgan_core/burgan_core.dart';
import 'package:flutter/material.dart';

const _buttonColor = Color(0xFF0069AA); // TODO: Move to colors file

class BrgButton extends StatelessWidget {
  const BrgButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor

  }) : super(key: key);

  final String text;
  final Function onPressed;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: color ?? _buttonColor,
      ),
      onPressed: () => onPressed(),
      child: Text(text, style: TextStyle(color: textColor),).padding(left: 16, right: 16, top: 20, bottom: 20),
    );
  }
}
