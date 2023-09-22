import 'package:burgan_core/burgan_core.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  final String titleText;
  final String contentText;
  final String toggleText;
  final Function(bool) onSwitchToggled;
  final double? contentMaxHeight;

  const TermsAndConditionsWidget({
    Key? key,
    required this.titleText,
    required this.contentText,
    required this.toggleText,
    required this.onSwitchToggled,
    this.contentMaxHeight,
  }) : super(key: key);

  @override
  State<TermsAndConditionsWidget> createState() => _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  final borderColor = const Color(0xFFE1E8ED);
  final switchInactiveTrackColor = const Color(0xFF5C6F7C);
  final switchInactiveThumbColor = Colors.white;

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitleAndDetailsCard(context),
        _buildSwitch(),
      ],
    );
  }

  Widget _buildTitleAndDetailsCard(BuildContext context) {
    final contentMaxHeight = widget.contentMaxHeight ?? MediaQuery.of(context).size.height * 0.66;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: contentMaxHeight),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 3),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.titleText,
                style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ).padding(bottom: 16),
              Flexible(
                child: Text(
                  widget.contentText,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ).paddingAll(24),
        ),
      ),
    );
  }

  Widget _buildSwitch() {
    return Row(
      children: [
        Switch(
          value: switchValue,
          onChanged: (newValue) {
            switchValue = newValue;
            widget.onSwitchToggled(newValue);
            setState(() {});
          },
          inactiveThumbColor: switchInactiveThumbColor,
          inactiveTrackColor: switchInactiveTrackColor,
        ),
        Text(
          widget.toggleText,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
